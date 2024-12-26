# from pyexpat.errors import messages
from django.contrib import messages
from django.forms import model_to_dict
from django.http import HttpResponse, JsonResponse
from django.shortcuts import get_object_or_404, render, redirect  
from employee.forms import Employee_projectForm, EmployeeForm, DepartmentForm, DesignationForm, RegionForm, EducationForm, Employment_RecordForm, CertificationsForm, SkillsForm, CompanyForm, Project_typeForm, ProjectForm, ModuleForm, MainmenuForm, SubmenuForm, RoleForm, Company_moduleForm, Role_permissionForm, CV_templateForm, Template_columnForm, BankForm, Bank_guarantyForm, Liquidity_damagesForm, Insurance_typeForm, Insurance_detailForm, CountryForm, ZoneForm, AreaForm, BranchForm, ClientForm, Document_typeForm, Project_documentForm, Employee_targetForm, SalesForm, QuartersForm, LeadsForm, VendorForm
from employee.models import Employee, Department, Designation, Employee_project, Region, Education, Employment_Record, Certifications, Skills, Company, Module, Mainmenu, Submenu, Role, Company_module, Role_permission, CV_template, Template_column, Project_type, Project, Bank, Bank_guaranty, Liquidity_damages, Insurance_type, Insurance_detail, Country, Zone, Area, Branch, Client, Document_type, Project_document, Employee_target, Sales, Quarters, Leads, Vendor
from django.contrib.auth.decorators import login_required, permission_required
from django.db import connection
import json
import re
import os
import ast
from xhtml2pdf import pisa
import io as BytesIO
from django.conf import settings
from django.template.loader import get_template
from datetime import datetime, timedelta
from django.utils import timezone
import logging
from django.db.models import Sum, Subquery, Count, Q

from finance.models import Journal_entry

# Set up logging
logger = logging.getLogger(__name__)

 

# Employee
@login_required
@permission_required('employee.add_employee', raise_exception=True)  
def emp(request):
    departs = Department.objects.filter(status=1).values('id','depart_name')
    designs = Designation.objects.filter(status=1).values('id','design_name')
    branches = Branch.objects.filter(status=1).values('id','branch_name')
    if request.method == "POST":  
        form = EmployeeForm(request.POST, request.FILES)  
        try:
            if form.is_valid():
                file_instance = form.save(commit=False)
                file_instance.save()
                if 'cv_doc' in request.FILES:
                    # Generate folder path dynamically
                    folder_name = str(file_instance.pk)
                    folder_path = os.path.join(settings.MEDIA_ROOT,'employee',folder_name,'cv')
                    
                    if not os.path.exists(folder_path):
                        os.makedirs(folder_path)
                    # Generate file path dynamically
                    timestamp = datetime.now().strftime('%Y%m%d%H%M%S')
                    new_file_name = f"{file_instance.pk}_cv_{timestamp}{os.path.splitext(request.FILES['cv_doc'].name)[1]}"
                    new_file_path = os.path.join(folder_path, new_file_name)
                    # Save file to the generated path
                    with open(new_file_path, 'wb') as f:
                        for chunk in request.FILES['cv_doc'].chunks():
                            f.write(chunk)
                    # Update the file field with the relative path to the file
                    file_instance.cv_doc = os.path.relpath(new_file_path, settings.MEDIA_ROOT)
                file_instance.save() 
                messages.success(request, "Data added successfully!") 
                return redirect('view_employee') 
            else:
                error_messages = form.errors.as_json()
                messages.error(request, f"Form validation failed: {error_messages}")
                return render(request,'employee/index.html',{'departs':departs,'designs':designs,'branches':branches})  
        except Exception as e: 
            messages.error(request, f"Internal Server Error: {str(e)}")     
            return render(request,'employee/index.html',{'departs':departs,'designs':designs,'branches':branches})  
            pass  
    else:  
        # form = EmployeeForm()
        return render(request,'employee/index.html',{'departs':departs,'designs':designs,'branches':branches})  

@login_required  
@permission_required('employee.view_employee', raise_exception=True)  
def show(request):  
    employees = Employee.objects.filter(status=1)
    return render(request,"employee/show.html",{'employees':employees})  

@login_required  
@permission_required('employee.change_employee', raise_exception=True)  
def edit(request, id):  
    departs = Department.objects.filter(status=1).values('id','depart_name')
    designs = Designation.objects.filter(status=1).values('id','design_name')
    branches = Branch.objects.filter(status=1).values('id','branch_name')
    employee = Employee.objects.get(id=id)  
    return render(request,'employee/edit.html', {'employee':employee,'departs':departs,'designs':designs,'branches':branches})  

@login_required  
def update(request, id):  
    employee = Employee.objects.get(id=id)  
    old_path = employee.cv_doc 
    if request.method == "POST": 
        form = EmployeeForm(request.POST, request.FILES, instance = employee)
        try: 
            if form.is_valid():
                file_instance = form.save(commit=False)
                if 'cv_doc' in request.FILES:
                    # Generate folder path dynamically
                    folder_name = str(file_instance.pk)
                    folder_path = os.path.join(settings.MEDIA_ROOT,'employee',folder_name,'cv')
                    
                    if not os.path.exists(folder_path):
                        os.makedirs(folder_path)

                    # Generate file path dynamically
                    timestamp = datetime.now().strftime('%Y%m%d%H%M%S')
                    new_file_name = f"{file_instance.pk}_cv_{timestamp}{os.path.splitext(request.FILES['cv_doc'].name)[1]}"
                    new_file_path = os.path.join(folder_path, new_file_name)
                    
                    if old_path and os.path.exists(os.path.join(settings.MEDIA_ROOT, old_path)):
                            os.remove(os.path.join(settings.MEDIA_ROOT, old_path))
                    # Save file to the generated path
                    with open(new_file_path, 'wb') as f:
                        for chunk in request.FILES['cv_doc'].chunks():
                            f.write(chunk)
                    # Update the file field with the relative path to the file
                    file_instance.cv_doc = os.path.relpath(new_file_path, settings.MEDIA_ROOT)
                else:
                    # Ensure the old file path is retained if no new file is uploaded
                    file_instance.cv_doc = old_path

                file_instance.save() 
                messages.success(request, "Data Updated successfully!")  
                return redirect("view_employee")
            else:
                error_messages = form.errors.as_json()
                messages.error(request, f"Form validation failed: {error_messages}")
                return render(request, 'employee/edit.html', {'employee': employee})  
        except Exception as e:  
            messages.error(request, f"Internal Server Error: {str(e)}")
            return render(request, 'employee/edit.html', {'employee': employee})  

@login_required  
@permission_required('employee.delete_employee', raise_exception=True)  
def destroy(request, id):  
    employee = Employee.objects.get(id=id)  
    employee.status=0 
    employee.save()  
    messages.success(request, "Data Deleted successfully!")
    return redirect("view_employee")  


# Department
@login_required 
@permission_required('employee.add_department', raise_exception=True)  
def add_depart(request):  
    if request.method == "POST":  
        form = DepartmentForm(request.POST) 
        depart_name = request.POST.get('depart_name').strip().lower()  # Normalize to lowercase
        depart = Department.objects.filter(depart_name__iexact=depart_name, status=1)
        if form.is_valid():
            if depart.exists():
                messages.error(request, "This Department already exist.")
                return render(request,'department/add_depart.html',{'form':form})
            else:
                try:  
                    form.save()  
                    messages.success(request, "Data added successfully!")
                    return redirect('show_depart')  
                except Exception as e:  
                    messages.error(request, f"Internal Server Error: {str(e)}")
                    return render(request,'department/add_depart.html',{'form':form})
                    pass  
        else:
            error_messages = form.errors.as_json()
            messages.error(request, f"Form validation failed: {error_messages}")
            return render(request,'department/add_depart.html',{'form':form})
    else:  
        form = DepartmentForm()  
        return render(request,'department/add_depart.html',{'form':form})  

@login_required  
@permission_required('employee.view_department', raise_exception=True)   
def show_depart(request):  
    departments = Department.objects.filter(status=1)
    return render(request,"department/show_depart.html",{'departments':departments})  

@login_required  
@permission_required('employee.change_department', raise_exception=True) 
def e_depart(request, id):  
    department = Department.objects.get(id=id)  
    return render(request,'department/e_depart.html', {'department':department})  

@login_required  
def u_depart(request, id):  
    department = Department.objects.get(id=id)  
    form = DepartmentForm(request.POST, instance = department)
    depart_name = request.POST.get('depart_name').strip().lower()  # Normalize to lowercase
    depart = Department.objects.filter(depart_name__iexact=depart_name, status=1)  
    if form.is_valid():  
        if depart.exists():
            messages.error(request, "This Department already exist.")
            return redirect("show_depart")
        else:
            form.save()  
            messages.success(request, "Data Updated successfully!")  
            return redirect("show_depart") 
    error_messages = form.errors.as_json()
    messages.error(request, f"Form validation failed: {error_messages}")
    return render(request, 'department/e_depart.html', {'department': department})  

@login_required  
@permission_required('employee.delete_department', raise_exception=True) 
def d_depart(request, id):  
    department = Department.objects.get(id=id)  
    department.status=0  
    department.save()
    messages.success(request, "Data Deleted successfully!")
    return redirect("show_depart")  


# Designation
@login_required 
@permission_required('employee.add_designation', raise_exception=True) 
def add_design(request):  
    if request.method == "POST":  
        form = DesignationForm(request.POST) 
        design_name = request.POST.get('design_name').strip().lower()  # Normalize to lowercase
        design = Designation.objects.filter(design_name__iexact=design_name, status=1)
        if form.is_valid():
            if design.exists():
                messages.error(request, "This Designation already exist.")
                return render(request,'designation/add_design.html',{'form':form})  
            else:
                try:  
                    form.save()
                    messages.success(request, "Data added successfully!") 
                    return redirect('show_design')  
                except Exception as e:  
                    messages.error(request, f"Internal Server Error: {str(e)}")
                    return render(request,'designation/add_design.html',{'form':form})  
                    pass  
        else:
            error_messages = form.errors.as_json()
            messages.error(request, f"Form validation failed: {error_messages}")
            return render(request,'designation/add_design.html',{'form':form})  
    else:  
        form = DesignationForm()  
        return render(request,'designation/add_design.html',{'form':form})  

@login_required  
@permission_required('employee.view_designation', raise_exception=True)   
def show_design(request):  
    designations = Designation.objects.filter(status=1)  
    return render(request,"designation/show_design.html",{'designations':designations})  

@login_required  
@permission_required('employee.change_designation', raise_exception=True) 
def e_design(request, id):  
    designation = Designation.objects.get(id=id)  
    return render(request,'designation/e_design.html', {'designation':designation})  

@login_required  
def u_design(request, id):  
    designation = Designation.objects.get(id=id)  
    form = DesignationForm(request.POST, instance = designation) 
    design_name = request.POST.get('design_name').strip().lower()  # Normalize to lowercase
    design = Designation.objects.filter(design_name__iexact=design_name, status=1) 
    if form.is_valid(): 
        if design.exists():
            messages.error(request, "This Designation already exist.")
            return redirect("show_design")
        else: 
            form.save()  
            messages.success(request, "Data Updated successfully!")  
            return redirect("show_design")
    error_messages = form.errors.as_json()
    messages.error(request, f"Form validation failed: {error_messages}")  
    return render(request, 'designation/e_design.html', {'designation': designation})  

@login_required  
@permission_required('employee.delete_designation', raise_exception=True) 
def d_design(request, id):  
    designation = Designation.objects.get(id=id)  
    designation.status=0  
    designation.save()
    messages.success(request, "Data Deleted successfully!")
    return redirect("show_design")  


# Region
@login_required 
@permission_required('employee.add_region', raise_exception=True) 
def add_region(request):  
    if request.method == "POST":  
        form = RegionForm(request.POST) 
        region_name = request.POST.get('region_name').strip().lower()  # Normalize to lowercase
        region = Region.objects.filter(region_name__iexact=region_name, status=1)
        if form.is_valid():
            if region.exists():
                messages.error(request, "This Region already exist.")
                return render(request,'region/add_region.html',{'form':form})  
            else:
                try:  
                    form.save()  
                    messages.success(request, "Data added successfully!") 
                    return redirect('show_region')  
                except Exception as e:  
                    messages.error(request, f"Internal Server Error: {str(e)}")
                    return render(request,'region/add_region.html',{'form':form})  
                    pass  
        else:
            error_messages = form.errors.as_json()
            messages.error(request, f"Form validation failed: {error_messages}")
            return render(request,'region/add_region.html',{'form':form})  
    else:  
        form = RegionForm()  
        return render(request,'region/add_region.html',{'form':form})  

@login_required    
@permission_required('employee.view_region', raise_exception=True)
def show_region(request):  
    regions = Region.objects.filter(status=1)  
    return render(request,"region/show_region.html",{'regions':regions})  

@login_required 
@permission_required('employee.change_region', raise_exception=True) 
def e_region(request, id):  
    region = Region.objects.get(id=id)  
    return render(request,'region/e_region.html', {'region':region})  

@login_required  
def u_region(request, id):  
    region = Region.objects.get(id=id)  
    form = RegionForm(request.POST, instance = region)  
    region_name = request.POST.get('region_name').strip().lower()  # Normalize to lowercase
    regions = Region.objects.filter(region_name__iexact=region_name, status=1)
    if form.is_valid(): 
        if regions.exists():
            messages.error(request, "This Region already exist.")
            return redirect("show_region")
        else: 
            form.save()  
            messages.success(request, "Data Updated successfully!")  
            return redirect("show_region")  
    error_messages = form.errors.as_json()
    messages.error(request, f"Form validation failed: {error_messages}")  
    return render(request, 'region/e_region.html', {'region': region})  

@login_required  
@permission_required('employee.delete_region', raise_exception=True)
def d_region(request, id):  
    region = Region.objects.get(id=id)  
    region.status=0  
    region.save()
    messages.success(request, "Data Deleted successfully!")
    return redirect("show_region") 


# Education
@login_required 
@permission_required('employee.add_education', raise_exception=True)
def add_education(request):  
    if request.method == "POST":  
        form = EducationForm(request.POST, request.FILES) 
        employees = Employee.objects.filter(status=1).values('id','ename')
        if form.is_valid():
            try:
                file_instance = form.save(commit=False)
                if 'degree_doc' in request.FILES:
                    # Generate folder path dynamically
                    folder_name = str(file_instance.employee.id)
                    folder_path = os.path.join(settings.MEDIA_ROOT,'employee',folder_name,'education')
                    
                    if not os.path.exists(folder_path):
                        os.makedirs(folder_path)
                    # Generate file path dynamically
                    timestamp = datetime.now().strftime('%Y%m%d%H%M%S')
                    new_file_name = f"{file_instance.employee.id}_edu_{timestamp}{os.path.splitext(request.FILES['degree_doc'].name)[1]}"
                    new_file_path = os.path.join(folder_path, new_file_name)
                    # Save file to the generated path
                    with open(new_file_path, 'wb') as f:
                        for chunk in request.FILES['degree_doc'].chunks():
                            f.write(chunk)
                    # Update the file field with the relative path to the file
                    file_instance.degree_doc = os.path.relpath(new_file_path, settings.MEDIA_ROOT)
                file_instance.save()  
                messages.success(request, "Data added successfully!")
                return redirect('show_education') 
            except Exception as e:    
                messages.error(request, f"Internal Server Error: {str(e)}") 
                return render(request,'education/add_education.html',{'form':form,'employees':employees})   
                pass
        else:
            error_messages = form.errors.as_json()
            messages.error(request, f"Form validation failed: {error_messages}")
            return render(request,'education/add_education.html',{'form':form,'employees':employees})  
    else:  
        form = EducationForm()  
        employees = Employee.objects.filter(status=1).values('id','ename')
        return render(request,'education/add_education.html',{'form':form,'employees':employees})  

@login_required    
@permission_required('employee.view_education', raise_exception=True)
def show_education(request):  
    educations = Education.objects.filter(status=1)  
    return render(request,"education/show_education.html",{'educations':educations})  

@login_required  
@permission_required('employee.change_education', raise_exception=True)
def e_education(request, id):  
    education = Education.objects.get(id=id) 
    employees = Employee.objects.filter(status=1).values('id','ename')
    return render(request,'education/e_education.html', {'education':education,'employees':employees})  

@login_required  
def u_education(request, id):  
    education = Education.objects.get(id=id)  
    old_path = education.degree_doc 
    if request.method == "POST": 
        form = EducationForm(request.POST, request.FILES, instance = education)
        try: 
            if form.is_valid():
                file_instance = form.save(commit=False)
                if 'degree_doc' in request.FILES:
                    # Generate folder path dynamically
                    folder_name = str(file_instance.employee.id)
                    folder_path = os.path.join(settings.MEDIA_ROOT,'employee',folder_name,'education')
                    
                    if not os.path.exists(folder_path):
                        os.makedirs(folder_path)

                    # Generate file path dynamically
                    timestamp = datetime.now().strftime('%Y%m%d%H%M%S')
                    new_file_name = f"{file_instance.employee.id}_edu_{timestamp}{os.path.splitext(request.FILES['degree_doc'].name)[1]}"
                    new_file_path = os.path.join(folder_path, new_file_name)
                    
                    if old_path and os.path.exists(os.path.join(settings.MEDIA_ROOT, old_path)):
                            os.remove(os.path.join(settings.MEDIA_ROOT, old_path))
                    # Save file to the generated path
                    with open(new_file_path, 'wb') as f:
                        for chunk in request.FILES['degree_doc'].chunks():
                            f.write(chunk)
                    # Update the file field with the relative path to the file
                    file_instance.degree_doc = os.path.relpath(new_file_path, settings.MEDIA_ROOT)
                else:
                    # Ensure the old file path is retained if no new file is uploaded
                    file_instance.degree_doc = old_path

                file_instance.save() 
                messages.success(request, "Data Updated successfully!")
                return redirect("show_education")  
            else: 
                error_messages = form.errors.as_json()
                messages.error(request, f"Form validation failed: {error_messages}")
                return render(request, 'education/e_education.html', {'education': education})  
        except Exception as e:  
            messages.error(request, f"Internal Server Error: {str(e)}")
            return render(request, 'education/e_education.html', {'education': education})  

@login_required  
@permission_required('employee.delete_education', raise_exception=True)
def d_education(request, id):  
    education = Education.objects.get(id=id)  
    education.status=0  
    education.save()
    messages.success(request, "Data Deleted successfully!")
    return redirect("show_education") 


# Employement_Record
@login_required 
@permission_required('employee.add_employement_record', raise_exception=True)
def add_employement_Record(request):  
    if request.method == "POST":  
        form = Employment_RecordForm(request.POST) 
        if form.is_valid():
            try:  
                form.save()  
                messages.success(request, "Data added successfully!")
                return redirect('show_employement_record')  
            except Exception as e:  
                messages.error(request, f"Internal Server Error: {str(e)}")
                return render(request,'employement_record/add_employement_record.html',{'form':form,'employees':employees})  
                pass  
        else:
            error_messages = form.errors.as_json()
            messages.error(request, f"Form validation failed: {error_messages}")
            return render(request,'employement_record/add_employement_record.html',{'form':form,'employees':employees})  
    else:  
        form = Employment_RecordForm()
        employees = Employee.objects.filter(status=1).values('id','ename')  
        return render(request,'employement_record/add_employement_record.html',{'form':form,'employees':employees})  

@login_required 
@permission_required('employee.view_employement_record', raise_exception=True)   
def show_employement_Record(request):  
    employement_Records = Employment_Record.objects.filter(status=1)  
    return render(request,"employement_record/show_employement_record.html",{'employement_Records':employement_Records})  

@login_required  
@permission_required('employee.change_employement_record', raise_exception=True)
def e_employement_Record(request, id):  
    employement_Record = Employment_Record.objects.get(id=id) 
    employees = Employee.objects.filter(status=1).values('id','ename') 
    return render(request,'employement_record/e_employement_record.html', {'employement_Record':employement_Record,'employees':employees})  

@login_required  
def u_employement_Record(request, id):  
    employement_Record = Employment_Record.objects.get(id=id)  
    form = Employment_RecordForm(request.POST, instance = employement_Record)  
   
    if form.is_valid():  
        form.save() 
        messages.success(request, "Data Updated successfully!")   
        return redirect("show_employement_record")  
    error_messages = form.errors.as_json()
    messages.error(request, f"Form validation failed: {error_messages}") 
    return render(request, 'employement_record/e_employement_record.html', {'employement_Record': employement_Record})  

@login_required  
@permission_required('employee.delete_employement_record', raise_exception=True)
def d_employement_Record(request, id):  
    employement_Record = Employment_Record.objects.get(id=id)  
    employement_Record.status=0 
    employement_Record.save()
    messages.success(request, "Data Deleted successfully!")
    return redirect("show_employement_record") 

 
# Certifications
@login_required 
@permission_required('employee.add_certifications', raise_exception=True)
def add_certification(request):  
    if request.method == "POST":  
        form = CertificationsForm(request.POST, request.FILES) 
        employees = Employee.objects.filter(status=1).values('id','ename')
        try:
            if form.is_valid():
                file_instance = form.save(commit=False)
                if 'certification_doc' in request.FILES:
                    # Generate folder path dynamically
                    folder_name = str(file_instance.employee.id)
                    folder_path = os.path.join(settings.MEDIA_ROOT,'employee',folder_name,'certification')
                    
                    if not os.path.exists(folder_path):
                        os.makedirs(folder_path)
                    # Generate file path dynamically
                    timestamp = datetime.now().strftime('%Y%m%d%H%M%S')
                    new_file_name = f"{file_instance.employee.id}_certificate_{timestamp}{os.path.splitext(request.FILES['certification_doc'].name)[1]}"
                    new_file_path = os.path.join(folder_path, new_file_name)
                    # Save file to the generated path
                    with open(new_file_path, 'wb') as f:
                        for chunk in request.FILES['certification_doc'].chunks():
                            f.write(chunk)
                    # Update the file field with the relative path to the file
                    file_instance.certification_doc = os.path.relpath(new_file_path, settings.MEDIA_ROOT)
                file_instance.save() 
                messages.success(request, "Data added successfully!") 
                return redirect('show_certification') 
            else:
                error_messages = form.errors.as_json()
                messages.error(request, f"Form validation failed: {error_messages}")
                return render(request,'certification/add_certification.html',{'form':form,'employees':employees})  
        except Exception as e: 
            messages.error(request, f"Internal Server Error: {str(e)}")
            return render(request,'certification/add_certification.html',{'form':form,'employees':employees})        
            pass
    else:  
        form = CertificationsForm()  
        employees = Employee.objects.filter(status=1).values('id','ename')
        return render(request,'certification/add_certification.html',{'form':form,'employees':employees})  

@login_required  
@permission_required('employee.view_certifications', raise_exception=True)  
def show_certification(request):  
    certifications = Certifications.objects.filter(status=1) 
    return render(request,"certification/show_certification.html",{'certifications':certifications})  

@login_required  
@permission_required('employee.change_certifications', raise_exception=True)
def e_certification(request, id):  
    certification = Certifications.objects.get(id=id)  
    employees = Employee.objects.filter(status=1).values('id','ename')
    return render(request,'certification/e_certification.html', {'certification':certification,'employees':employees})  

@login_required  
def u_certification(request, id):  
    certification = Certifications.objects.get(id=id)  
    old_path = certification.certification_doc 
    if request.method == "POST": 
        form = CertificationsForm(request.POST, request.FILES, instance = certification)
        try: 
            if form.is_valid():
                file_instance = form.save(commit=False)
                if 'certification_doc' in request.FILES:
                    # Generate folder path dynamically
                    folder_name = str(file_instance.employee.id)
                    folder_path = os.path.join(settings.MEDIA_ROOT,'employee',folder_name,'certification')
                    
                    if not os.path.exists(folder_path):
                        os.makedirs(folder_path)

                    # Generate file path dynamically
                    timestamp = datetime.now().strftime('%Y%m%d%H%M%S')
                    new_file_name = f"{file_instance.employee.id}_certificate_{timestamp}{os.path.splitext(request.FILES['certification_doc'].name)[1]}"
                    new_file_path = os.path.join(folder_path, new_file_name)
                    
                    if old_path and os.path.exists(os.path.join(settings.MEDIA_ROOT, old_path)):
                            os.remove(os.path.join(settings.MEDIA_ROOT, old_path))
                    # Save file to the generated path
                    with open(new_file_path, 'wb') as f:
                        for chunk in request.FILES['certification_doc'].chunks():
                            f.write(chunk)
                    # Update the file field with the relative path to the file
                    file_instance.certification_doc = os.path.relpath(new_file_path, settings.MEDIA_ROOT)
                else:
                    # Ensure the old file path is retained if no new file is uploaded
                    file_instance.certification_doc = old_path

                file_instance.save() 
                messages.success(request, "Data Updated successfully!")
                return redirect("show_certification") 
            else: 
                error_messages = form.errors.as_json()
                messages.error(request, f"Form validation failed: {error_messages}")  
                return render(request, 'certification/e_certification.html', {'certification': certification}) 
        except Exception as e:  
            messages.error(request, f"Internal Server Error: {str(e)}")
            return render(request, 'certification/e_certification.html', {'certification': certification}) 

@login_required 
@permission_required('employee.delete_certifications', raise_exception=True) 
def d_certification(request, id):  
    certification = Certifications.objects.get(id=id)  
    certification.status=0 
    certification.save()
    messages.success(request, "Data Deleted successfully!")
    return redirect("show_certification") 


# Skills
@login_required 
@permission_required('employee.add_skills', raise_exception=True)
def add_skill(request):  
    if request.method == "POST":  
        form = SkillsForm(request.POST) 
        employees = Employee.objects.filter(status=1).values('id','ename')
        if form.is_valid():
            skill_name = request.POST.get('skill_name').strip().lower()  # Normalize to lowercase
            skill = Skills.objects.filter(skill_name__iexact=skill_name,employee_id=request.POST.get('employee'), status=1)
            if skill.exists():
                messages.error(request, "This Skill already exist against this employee.")
                return render(request,'skill/add_skill.html',{'form':form,'employees':employees})
            else:
                try:  
                    form.save()  
                    messages.success(request, "Data added successfully!") 
                    return redirect('show_skill')  
                except Exception as e:  
                    messages.error(request, f"Internal Server Error: {str(e)}")
                    return render(request,'skill/add_skill.html',{'form':form,'employees':employees})  
                    pass  
        else:
            error_messages = form.errors.as_json()
            messages.error(request, f"Form validation failed: {error_messages}")
            return render(request,'skill/add_skill.html',{'form':form,'employees':employees})  
    else:  
        form = SkillsForm()  
        employees = Employee.objects.filter(status=1).values('id','ename')
        return render(request,'skill/add_skill.html',{'form':form,'employees':employees})  

@login_required  
@permission_required('employee.view_skills', raise_exception=True)  
def show_skill(request):  
    skills = Skills.objects.filter(status=1) 
    return render(request,"skill/show_skill.html",{'skills':skills})  

@login_required  
@permission_required('employee.change_skills', raise_exception=True)
def e_skill(request, id):  
    skill = Skills.objects.get(id=id)  
    employees = Employee.objects.filter(status=1).values('id','ename')
    return render(request,'skill/e_skill.html', {'skill':skill,'employees':employees})  

@login_required  
def u_skill(request, id):  
    skill = Skills.objects.get(id=id)  
    form = SkillsForm(request.POST, instance = skill) 
    skill_name = request.POST.get('skill_name').strip().lower()  # Normalize to lowercase
    skills = Skills.objects.filter(skill_name__iexact=skill_name,employee_id=request.POST.get('employee'), status=1) 
    if form.is_valid():  
        if skills.exists():
            messages.error(request, "This Skill already exist against this employee.")
            return redirect("show_skill")  
        else:
            form.save()  
            messages.success(request, "Data Updated successfully!")  
            return redirect("show_skill")  
    error_messages = form.errors.as_json()
    messages.error(request, f"Form validation failed: {error_messages}")  
    return render(request, 'skill/e_skill.html', {'skill': skill})  

@login_required  
@permission_required('employee.delete_skills', raise_exception=True)
def d_skill(request, id):  
    skill = Skills.objects.get(id=id)  
    skill.status=0  
    skill.save()
    messages.success(request, "Data Deleted successfully!")
    return redirect("show_skill") 


# Company
@login_required
@permission_required('employee.add_company', raise_exception=True)
def add_company(request):  
    if request.method == "POST":  
        form = CompanyForm(request.POST) 
        comp_name = request.POST.get('comp_name').strip().lower()  # Normalize to lowercase
        comp = Company.objects.filter(comp_name__iexact=comp_name, status=1)
        if form.is_valid():
            if comp.exists():
                messages.error(request, "This Company already exist.")
                return render(request,'company/add_company.html',{'form':form})
            else:
                try:  
                    form.save() 
                    messages.success(request, "Data added successfully!")  
                    return redirect('show_company')  
                except Exception as e:  
                    messages.error(request, f"Internal Server Error: {str(e)}")
                    return render(request,'company/add_company.html',{'form':form})  
                    pass  
        else:
            error_messages = form.errors.as_json()
            messages.error(request, f"Form validation failed: {error_messages}")
            return render(request,'company/add_company.html',{'form':form})  
    else:  
        form = CompanyForm()  
        return render(request,'company/add_company.html',{'form':form})  

@login_required    
@permission_required('employee.view_company', raise_exception=True)
def show_company(request):  
    company = Company.objects.filter(status=1) 
    return render(request,"company/show_company.html",{'company':company})  

@login_required  
@permission_required('employee.change_company', raise_exception=True)
def e_company(request, id):  
    company = Company.objects.get(id=id)  
    return render(request,'company/e_company.html', {'company':company})  

@login_required  
def u_company(request, id):  
    company = Company.objects.get(id=id)  
    form = CompanyForm(request.POST, instance = company)  
    comp_name = request.POST.get('comp_name').strip().lower()  # Normalize to lowercase
    comp = Company.objects.filter(comp_name__iexact=comp_name, status=1)
    if form.is_valid():
        if comp.exists():
            messages.error(request, "This Company already exist.")
            return redirect("show_company")  
        else:  
            form.save()  
            messages.success(request, "Data Updated successfully!")  
            return redirect("show_company")  
    error_messages = form.errors.as_json()
    messages.error(request, f"Form validation failed: {error_messages}")  
    return render(request, 'company/e_company.html', {'company': company})  

@login_required  
@permission_required('employee.delete_company', raise_exception=True)
def d_company(request, id):  
    company = Company.objects.get(id=id)  
    company.status=0
    company.save()  
    messages.success(request, "Data Deleted successfully!")
    return redirect("show_company") 


# Module
@login_required 
def add_module(request):  
    if request.method == "POST":  
        form = ModuleForm(request.POST) 
        if form.is_valid():
            try:  
                form.save()  
                return redirect('show_module')  
            except Exception as e:  
  
                pass  
    else:  
        form = ModuleForm()  
    return render(request,'module/add_module.html',{'form':form})  

@login_required    
def show_module(request):  
    modules = Module.objects.filter(status=1)
    return render(request,"module/show_module.html",{'modules':modules})  

@login_required  
def e_module(request, id):  
    module = Module.objects.get(id=id)  
    return render(request,'module/e_module.html', {'module':module})  

@login_required  
def u_module(request, id):  
    module = Module.objects.get(id=id)  
    form = ModuleForm(request.POST, instance = module)  
    if form.is_valid():  
        form.save()  
        return redirect("show_module")  
    return render(request, 'module/e_module.html', {'module': module})  

@login_required  
def d_module(request, id):  
    module = Module.objects.get(id=id)  
    module.status=0 
    module.save()
    return redirect("show_module") 


# Mainmenu
@login_required 
def add_mainmenu(request):  
    if request.method == "POST":  
        form = MainmenuForm(request.POST) 
        if form.is_valid():
            try:  
                form.save()  
                return redirect('show_mainmenu')  
            except Exception as e:  
  
                pass  
    else:  
        form = MainmenuForm()  
    return render(request,'mainmenu/add_mainmenu.html',{'form':form})  

@login_required    
def show_mainmenu(request):  
    mainmenus = Mainmenu.objects.all()  
    return render(request,"mainmenu/show_mainmenu.html",{'mainmenus':mainmenus})  

@login_required  
def e_mainmenu(request, id):  
    mainmenu = Mainmenu.objects.get(id=id)  
    return render(request,'mainmenu/e_mainmenu.html', {'mainmenu':mainmenu})  

@login_required  
def u_mainmenu(request, id):  
    mainmenu = Mainmenu.objects.get(id=id)  
    form = MainmenuForm(request.POST, instance = mainmenu)  
    if form.is_valid():  
        form.save()  
        return redirect("show_mainmenu")  
    return render(request, 'mainmenu/e_mainmenu.html', {'mainmenu': mainmenu})  

@login_required  
def d_mainmenu(request, id):  
    mainmenu = Mainmenu.objects.get(id=id)  
    mainmenu.status=0  
    mainmenu.save()
    return redirect("show_mainmenu") 


# Submenu
@login_required 
def add_submenu(request):  
    if request.method == "POST":  
        form = SubmenuForm(request.POST) 
        if form.is_valid():
            try:  
                form.save()  
                return redirect('show_submenu')  
            except Exception as e:  
  
                pass  
    else:  
        form = SubmenuForm()  
    return render(request,'submenu/add_submenu.html',{'form':form})  

@login_required    
def show_submenu(request):  
    submenus = Submenu.objects.all()  
    return render(request,"submenu/show_submenu.html",{'submenus':submenus})  

@login_required  
def e_submenu(request, id):  
    submenu = Submenu.objects.get(id=id)  
    return render(request,'submenu/e_submenu.html', {'submenu':submenu})  

@login_required  
def u_submenu(request, id):  
    submenu = Submenu.objects.get(id=id)  
    form = SubmenuForm(request.POST, instance = submenu)  
    if form.is_valid():  
        form.save()  
        return redirect("show_submenu")  
    return render(request, 'submenu/e_submenu.html', {'submenu': submenu})  

@login_required  
def d_submenu(request, id):  
    submenu = Submenu.objects.get(id=id)  
    submenu.status=0  
    submenu.save()
    return redirect("show_submenu") 


# Role
@login_required 
def add_role(request):  
    if request.method == "POST":  
        form = RoleForm(request.POST) 
        if form.is_valid():
            try:  
                form.save()  
                return redirect('show_role')  
            except Exception as e:  
  
                pass  
    else:  
        form = RoleForm()  
    return render(request,'role/add_role.html',{'form':form})  

@login_required    
def show_role(request):  
    roles = Role.objects.all()  
    return render(request,"role/show_role.html",{'roles':roles})  

@login_required  
def e_role(request, id):  
    role = Role.objects.get(id=id)  
    return render(request,'role/e_role.html', {'role':role})  

@login_required  
def u_role(request, id):  
    role = Role.objects.get(id=id)  
    form = RoleForm(request.POST, instance = role)  
    if form.is_valid():  
        form.save()  
        return redirect("show_role")  
    return render(request, 'role/e_role.html', {'role': role})  

@login_required  
def d_role(request, id):  
    role = Role.objects.get(id=id)  
    role.status=0  
    role.save()
    return redirect("show_role") 


# Company_module
@login_required 
def add_company_module(request):  
    if request.method == "POST":  
        form = Company_moduleForm(request.POST) 
        if form.is_valid():
            try:  
                form.save()  
                return redirect('show_company_module')  
            except Exception as e:  
  
                pass  
    else:  
        form = Company_moduleForm()  
    return render(request,'company_module/add_company_module.html',{'form':form})  

@login_required    
def show_company_module(request):  
    company_modules = Company_module.objects.filter(status=1) 
    return render(request,"company_module/show_company_module.html",{'company_modules':company_modules})  

@login_required  
def e_company_module(request, id):  
    company_module = Company_module.objects.get(id=id)  
    return render(request,'company_module/e_company_module.html', {'company_module':company_module})  

@login_required  
def u_company_module(request, id):  
    company_module = Company_module.objects.get(id=id)  
    form = Company_moduleForm(request.POST, instance = company_module)  
    if form.is_valid():  
        form.save()  
        return redirect("show_company_module")  
    return render(request, 'company_module/e_company_module.html', {'company_module': company_module})  

@login_required  
def d_company_module(request, id):  
    company_module = Company_module.objects.get(id=id)  
    company_module.status=0  
    company_module.save()
    return redirect("show_company_module") 


# Role_permission
@login_required 
def add_role_permission(request):  
    if request.method == "POST":  
        form = Role_permissionForm(request.POST) 
        if form.is_valid():
            try:  
                form.save()  
                return redirect('show_role_permission')  
            except Exception as e:  
  
                pass  
    else:  
        form = Role_permissionForm()  
    return render(request,'role_permission/add_role_permission.html',{'form':form})  

@login_required    
def show_role_permission(request):  
    role_permissions = Role_permission.objects.all()  
    return render(request,"role_permission/show_role_permission.html",{'role_permissions':role_permissions})  

@login_required  
def e_role_permission(request, id):  
    role_permission = Role_permission.objects.get(id=id)  
    return render(request,'role_permission/e_role_permission.html', {'role_permission':role_permission})  

@login_required  
def u_role_permission(request, id):  
    role_permission = Role_permission.objects.get(id=id)  
    form = Role_permissionForm(request.POST, instance = role_permission)  
    if form.is_valid():  
        form.save()  
        return redirect("show_role_permission")  
    return render(request, 'role_permission/e_role_permission.html', {'role_permission': role_permission})  

@login_required  
def d_role_permission(request, id):  
    role_permission = Role_permission.objects.get(id=id)  
    role_permission.status=0 
    role_permission.save() 
    return redirect("show_role_permission") 


# CV_template
@login_required 
@permission_required('employee.add_cv_template', raise_exception=True)
def add_cv_template(request):  
    if request.method == "POST":  
        form = CV_templateForm(request.POST) 
        columns = Template_column.objects.filter(status=1).values('id','title','table_name','field_name')  
        if form.is_valid():
            try:  
                form.save()  
                messages.success(request, "Data added successfully!")
                return redirect('show_cv_template')  
            except Exception as e:  
                messages.error(request, f"Internal Server Error: {str(e)}")
                return render(request,'cv_template/add_cv_template.html',{'form':form,'columns':columns})  
                pass  
        else:
            error_messages = form.errors.as_json()
            messages.error(request, f"Form validation failed: {error_messages}")
            return render(request,'cv_template/add_cv_template.html',{'form':form,'columns':columns})  
    else:  
        form = CV_templateForm()
        columns = Template_column.objects.filter(status=1).values('id','title','table_name','field_name')  
        return render(request,'cv_template/add_cv_template.html',{'form':form,'columns':columns})  

@login_required    
@permission_required('employee.view_cv_template', raise_exception=True)
def show_cv_template(request):  
    cv_templates = CV_template.objects.filter(status=1) 
    return render(request,"cv_template/show_cv_template.html",{'cv_templates':cv_templates})  

@login_required  
@permission_required('employee.change_cv_template', raise_exception=True)
def e_cv_template(request, id):  
    cv_template = CV_template.objects.get(id=id)  
    return render(request,'cv_template/e_cv_template.html', {'cv_template':cv_template})  

@login_required  
def u_cv_template(request, id):  
    cv_template = CV_template.objects.get(id=id)  
    form = CV_templateForm(request.POST, instance = cv_template)  
    if form.is_valid():  
        form.save()  
        messages.success(request, "Data Updated successfully!")   
        return redirect("show_cv_template")
    error_messages = form.errors.as_json()
    messages.error(request, f"Form validation failed: {error_messages}")   
    return render(request, 'cv_template/e_cv_template.html', {'cv_template': cv_template})  

@login_required  
@permission_required('employee.delete_cv_template', raise_exception=True)
def d_cv_template(request, id):  
    cv_template = CV_template.objects.get(id=id)  
    cv_template.status=0  
    cv_template.save()
    messages.success(request, "Data Deleted successfully!")
    return redirect("show_cv_template") 

@login_required    
@permission_required('employee.generate_cv', raise_exception=True)
def generate_cv(request):  
    employees = Employee.objects.filter(status=1).values('id','ename')
    templates = CV_template.objects.filter(status=1).values('id','title') 
    return render(request,"cv_template/generate_cv.html",{'employees':employees,'templates':templates})

def dictfetchall(cursor): 
    "Returns all rows from a cursor as a dict" 
    desc = cursor.description 
    return [
            dict(zip([col[0] for col in desc], row)) 
            for row in cursor.fetchall() 
    ]

@login_required    
def generate(request):  
    template = CV_template.objects.get(id=request.POST.get('template'))
    findcol = re.findall(r'<td>\{{(.*?)\}}</td>', template.templete_code)
    
    stg_col = "'" + "','".join(findcol) + "'"
    cursor1 = connection.cursor()
    cursor1.execute('''SELECT group_concat(concat("'",field_name,"'")),table_name FROM `template_column` WHERE title_without_braces in ({cols}) GROUP BY table_name'''.format(
        cols=stg_col
    ))
    rows2 = cursor1.fetchall()
    stg_query = ''
    for i, j in enumerate(rows2): 
        items = j[0].split(",")
        json_fields = ""
        for item in items:
            if json_fields == "":
                json_fields = item + "," + item.replace("'","")
            else:
                json_fields += "," + item + "," + item.replace("'","")

        if stg_query == "":
            stg_query ='''(select GROUP_CONCAT(json_object('''+ json_fields +'''))  from '''+j[1]+'''
        where employee_id=e.id) as '''+j[1] 
        else:
            stg_query+=''',(select GROUP_CONCAT(json_object('''+ json_fields +'''))  from '''+j[1]+'''
        where employee_id=e.id) as '''+j[1]  
       
    if stg_query!= "":
        stg_query = "select e.id ,e.ename as name,e.eemail as email,e.econtact as contact," + stg_query + " from employee e"
    else:
        stg_query = "select e.id ,e.ename as name,e.eemail as email,e.econtact as contact from employee e"
    
    cursor = connection.cursor()
    cursor.execute(stg_query)
    
    cols = [x[0]for x in cursor.description]
    rows = cursor.fetchall()
    
    json_objs = []
    i = 0
    for row in rows:
        json_obj = {}
        i = 0
        for rec in row:
            if(rec is not None and ( cols[i]=="education" or cols[i]=="skills" or cols[i]=="certifications" or cols[i]=="employment_record")):                
                _splits = rec.split("},")
                json_arr = []
                for index, _split in enumerate(_splits):
                    if(index<len(_splits)-1):
                        _u = _split + "}"
                    else:
                        _u = _split
                    _uu = ast.literal_eval(json.loads(json.dumps(_u)))
                    json_arr.append(_uu)
                json_obj[cols[i]] = json_arr
            else:    
                json_obj[cols[i]] = rec
            i+=1
        json_objs.append(json_obj)
    stng =''
    
    for employees in json_objs:
        _template = template.templete_code
        # field = "{{name}}"
        
        # _template = _template.replace(field,str(employees["name"])) 
        # _template=''


        # templates = [_template]
        for key in employees:
            field = "{{" + str(key) + "}}"
            if key=="education":
                _list = employees[key]
                if _list is not None:
                    keysList = [key for key in _list[0]]
                    for _key in keysList:
                        _field = "{{" + str(_key) + "}}"       
                        tbl = ""
                        for items in _list:
                            tbl += "<tr>"
                            for sub_item in items:
                                tbl += "<td>" + str(items[sub_item]) + "</td>"
                            tbl += "</tr>"
                        tbl += "</table>"
                    _template = _template.replace(_field,tbl)
            elif key=="skills":
                _list = employees[key]
                tbl = ""        
                _list = employees[key]
                if _list is not None:
                    for items in _list:
                        tbl += "<tr>"
                        for sub_item in items:
                            tbl += "<td>" + str(items[sub_item]) + "</td>"
                        tbl += "</tr>"
                    tbl += "</table>"
                    _template = _template.replace(field,tbl)
            elif key=="certifications":
                _list = employees[key]
                tbl = ""        
                _list = employees[key]
                if _list is not None:
                    for items in _list:
                        tbl += "<tr>"
                        for sub_item in items:
                            tbl += "<td>" + str(items[sub_item]) + "</td>"
                        tbl += "</tr>"
                    tbl += "</table>"
                    _template = _template.replace(field,tbl)
            elif key=="employment_record":                
                # tbl = ""        
                # _list = employees[key]
                # if _list is not None:
                #     for items in _list:
                #         tbl += "<tr>"
                #         for sub_item in items:
                #             tbl += "<td>" + str(items[sub_item]) + "</td>"
                #         tbl += "</tr>"
                #     tbl += "</table>"
                #     _template = _template.replace(field,tbl)
                _list = employees[key]
                if _list is not None:
                    keysList = [key for key in _list[0]]
                    for _key in keysList:
                        _field = "{{" + str(_key) + "}}"
                   
                        tbl = ""
                        for items in _list:
                
                            tbl += "<tr>"
                            for sub_item in items:
                                tbl += "<td>" + str(items[sub_item]) + "</td>"
                            tbl += "</tr>"
                        tbl += "</table>"
                    _template = _template.replace(_field,tbl)
            else:
                _template = _template.replace(field,str(employees[key])) 
        stng+=_template


    employee = Employee.objects.get(id=request.POST.get('employee'))
    columns = Template_column.objects.filter(status=1)  
    _columns = {}

    for column in columns:
        _columns[column.title] = column.field_name 


        
        template = get_template("cv_template/cv.html")
        context = {"template": stng}
        html = template.render(context).encode("ISO-8859-1")
        result = BytesIO.BytesIO()
        pdf = pisa.pisaDocument(BytesIO.BytesIO(html), dest=result)   
        
        if not pdf.err:
            return HttpResponse(result.getvalue(), content_type="application/pdf")
        else:
            return HttpResponse("Errors")
    # return render(request,"cv_template/cv.html",{'employee':employee,'template':stng,'columns': columns})

 
def print_pdf(request):
    template = get_template("cv_template/cv.html")
    context = {"pagesize": "A4"}
    html = template.render(context).encode("ISO-8859-1")
    result = BytesIO.BytesIO()
    pdf = pisa.pisaDocument(BytesIO.BytesIO(html), dest=result)   
    
    if not pdf.err:
        return HttpResponse(result.getvalue(), content_type="application/pdf")
    else:
        return HttpResponse("Errors")

# Template_column
@login_required 
def add_template_column(request):  
    if request.method == "POST":  
        form = Template_columnForm(request.POST) 
        if form.is_valid():
            try:  
                form.save()  
                return redirect('show_template_column')  
            except Exception as e:  
  
                pass  
    else:  
        form = Template_columnForm()  
    return render(request,'template_column/add_template_column.html',{'form':form})  

@login_required    
def show_template_column(request):  
    template_columns = Template_column.objects.filter(status=1) 
    return render(request,"template_column/show_template_column.html",{'template_columns':template_columns})  

@login_required  
def e_template_column(request, id):  
    template_column = Template_column.objects.get(id=id)  
    return render(request,'template_column/e_template_column.html', {'template_column':template_column})  

@login_required  
def u_template_column(request, id):  
    template_column = Template_column.objects.get(id=id)  
    form = Template_columnForm(request.POST, instance = template_column)  
    if form.is_valid():  
        form.save()  
        return redirect("show_template_column")  
    return render(request, 'template_column/e_template_column.html', {'template_column': template_column})  

@login_required  
def d_template_column(request, id):  
    template_column = Template_column.objects.get(id=id)  
    template_column.status=0  
    template_column.save()
    return redirect("show_template_column")

# Project_type
@login_required 
@permission_required('employee.add_project_type', raise_exception=True)
def add_project_type(request):  
    if request.method == "POST":  
        form = Project_typeForm(request.POST) 
        type_name = request.POST.get('type_name').strip().lower()  # Normalize to lowercase
        type = Project_type.objects.filter(type_name__iexact=type_name, status=1)
        if form.is_valid():
            if type.exists():
                messages.error(request, "This Project Type already exist.")
                return render(request,'project_type/add_project_type.html',{'form':form})   
            else:
                try:  
                    form.save()  
                    messages.success(request, "Data added successfully!")
                    return redirect('show_project_type')  
                except Exception as e:  
                    messages.error(request, f"Internal Server Error: {str(e)}")
                    return render(request,'project_type/add_project_type.html',{'form':form})  
                    pass  
        else:
            error_messages = form.errors.as_json()
            messages.error(request, f"Form validation failed: {error_messages}")
            return render(request,'project_type/add_project_type.html',{'form':form})  
    else:  
        form = Project_typeForm()  
        return render(request,'project_type/add_project_type.html',{'form':form})  

@login_required    
@permission_required('employee.view_project_type', raise_exception=True)
def show_project_type(request):  
    project_types = Project_type.objects.filter(status=1) 
    return render(request,"project_type/show_project_type.html",{'project_types':project_types})  

@login_required  
@permission_required('employee.change_project_type', raise_exception=True)
def e_project_type(request, id):  
    project_type = Project_type.objects.get(id=id)  
    return render(request,'project_type/e_project_type.html', {'project_type':project_type})  

@login_required  
def u_project_type(request, id):  
    project_type = Project_type.objects.get(id=id)  
    form = Project_typeForm(request.POST, instance = project_type)  
    type_name = request.POST.get('type_name').strip().lower()  # Normalize to lowercase
    type = Project_type.objects.filter(type_name__iexact=type_name, status=1)
    if form.is_valid(): 
        if type.exists():
            messages.error(request, "This Project Type already exist.")
            return redirect("show_project_type") 
        else: 
            form.save()  
            messages.success(request, "Data Updated successfully!")  
            return redirect("show_project_type")  
    error_messages = form.errors.as_json()
    messages.error(request, f"Form validation failed: {error_messages}")  
    return render(request, 'project_type/e_project_type.html', {'project_type': project_type})  

@login_required  
@permission_required('employee.delete_project_type', raise_exception=True)
def d_project_type(request, id):  
    project_type = Project_type.objects.get(id=id)  
    project_type.status=0  
    project_type.save()
    messages.success(request, "Data Deleted successfully!")
    return redirect("show_project_type")

# Project
@login_required 
@permission_required('employee.add_project', raise_exception=True)
def add_project(request):
    if request.method == "POST":  
        form = ProjectForm(request.POST, request.FILES) 
        branches = Branch.objects.filter(status=1).values('id','branch_name')
        project_types = Project_type.objects.filter(status=1).values('id','type_name')
        clients = Client.objects.filter(status=1).values('id','client_name')
        countries = Country.objects.filter(status=1).values('id','country_name')
        leads = Leads.objects.filter(status=1).values('id','title')
        title = request.POST.get('title').strip().lower()  # Normalize to lowercase
        pro_title = Project.objects.filter(title__iexact=title, status=1)
        try:
            if form.is_valid():
                if pro_title.exists():
                    messages.error(request, "The project title already exist.")
                    return render(request,'project/add_project.html',{'form':form, 'branches':branches, 'project_types':project_types, 'clients':clients, 'countries':countries, 'leads':leads})  
                else:
                    file_instance = form.save(commit=False)
                    file_instance.save()

                    # Loop through each file field in the form
                    for field_name, uploaded_file in request.FILES.items():
                        if uploaded_file:
                            # Generate folder path dynamically
                            folder_name = str(file_instance.pk)
                            folder_path = os.path.join(settings.MEDIA_ROOT,'project', folder_name)

                            if not os.path.exists(folder_path):
                                os.makedirs(folder_path)

                            # Generate file path dynamically
                            timestamp = datetime.now().strftime('%Y%m%d%H%M%S')
                            new_file_name = f"{file_instance.pk}_{timestamp}{os.path.splitext(uploaded_file.name)[1]}"
                            file_path = os.path.join(folder_path, new_file_name)

                            # Save file to the generated path
                            with open(file_path, 'wb') as f:
                                for chunk in uploaded_file.chunks():
                                    f.write(chunk)

                            # Update the file field with the relative path to the file
                            setattr(file_instance, field_name, os.path.relpath(file_path, settings.MEDIA_ROOT))
                    file_instance.save()
                    messages.success(request, "Data added successfully!") 
                    return redirect('show_project')
            else:
                logger.error('Form is not valid: %s', form.errors)
                error_messages = form.errors.as_json()
                messages.error(request, f"Form validation failed: {error_messages}")
                return render(request,'project/add_project.html',{'form':form, 'branches':branches, 'project_types':project_types, 'clients':clients, 'countries':countries, 'leads':leads})  
                
        except Exception as e:  
            logger.exception('An error occurred while processing the form: %s', e)
            form.add_error(None, f'An unexpected error occurred: {str(e)}')
            messages.error(request, f"Internal Server Error: {str(e)}")
            return render(request,'project/add_project.html',{'form':form, 'branches':branches, 'project_types':project_types, 'clients':clients, 'countries':countries, 'leads':leads})  
    else:  
        form = ProjectForm()  
        branches = Branch.objects.filter(status=1).values('id','branch_name')
        project_types = Project_type.objects.filter(status=1).values('id','type_name')
        clients = Client.objects.filter(status=1).values('id','client_name')
        countries = Country.objects.filter(status=1).values('id','country_name')
        leads = Leads.objects.filter(status=1).values('id','title')
        return render(request,'project/add_project.html',{'form':form, 'branches':branches, 'project_types':project_types, 'clients':clients, 'countries':countries, 'leads':leads})  

@login_required   
@permission_required('employee.view_project', raise_exception=True) 
def show_project(request):  
    projects = Project.objects.filter(status=1)
    return render(request,"project/show_project.html",{'projects':projects})  

@login_required  
@permission_required('employee.change_project', raise_exception=True)
def e_project(request, id):  
    project = Project.objects.get(id=id)  
    branches = Branch.objects.filter(status=1).values('id','branch_name')
    project_types = Project_type.objects.filter(status=1).values('id','type_name')
    clients = Client.objects.filter(status=1).values('id','client_name')
    countries = Country.objects.filter(status=1).values('id','country_name')
    return render(request,'project/e_project.html', {'project':project, 'branches':branches, 'project_types':project_types, 'clients':clients, 'countries':countries})  

@login_required  
def u_project(request, id):  
    project_instance = Project.objects.get(id=id)
    # Retrieve old file paths before initializing the form
    old_file_paths = {}
    for field in request.FILES:
        old_file_paths[field] = getattr(project_instance, field)

    if request.method == 'POST':
        form = ProjectForm(request.POST, request.FILES, instance=project_instance)
        try:
            if form.is_valid():
                file_instance = form.save(commit=False)
                # Loop through each file field in the form
                for field_name in request.FILES:
                    uploaded_file = request.FILES[field_name]
                    if uploaded_file:
                        folder_name = str(file_instance.pk)
                        folder_path = os.path.join(settings.MEDIA_ROOT, 'project', folder_name)

                        if not os.path.exists(folder_path):
                            os.makedirs(folder_path)

                        timestamp = datetime.now().strftime('%Y%m%d%H%M%S')
                        new_file_name = f"{file_instance.pk}_{timestamp}{os.path.splitext(uploaded_file.name)[1]}"
                        file_path = os.path.join(folder_path, new_file_name)

                        old_file_path = old_file_paths.get(field_name)
                        if old_file_path:
                            old_file_full_path = os.path.join(settings.MEDIA_ROOT, old_file_path)
                            if os.path.exists(old_file_full_path):
                                os.remove(old_file_full_path)

                        with open(file_path, 'wb') as f:
                            for chunk in uploaded_file.chunks():
                                f.write(chunk)
                        
                        setattr(file_instance, field_name, os.path.relpath(file_path, settings.MEDIA_ROOT))
                    # else:
                    #     # Ensure the old file path is retained if no new file is uploaded
                    #     setattr(file_instance, field_name, old_file_paths[field_name])
                        
                file_instance.save()
                messages.success(request, "Data Updated successfully!")  
                return redirect('../project_details/'+str(file_instance.pk))
            else:
                error_messages = form.errors.as_json()
                messages.error(request, f"Project Form validation failed: {error_messages}")
                return redirect(f'../project_details/{project_instance.id}')
        except Exception as e:
            logger.exception('An error occurred while processing the form: %s', e)
            form.add_error(None, f'An unexpected error occurred: {str(e)}')
            messages.error(request, f"Internal Server Error: {str(e)}")
            return redirect(f'../project_details/{project_instance.id}')

@login_required  
@permission_required('employee.delete_project', raise_exception=True)
def d_project(request, id):  
    project = Project.objects.get(id=id)  
    project.status=0  
    project.save()
    messages.success(request, "Data Deleted successfully!")
    return redirect("show_project")

@login_required  
def project_details(request, id):  
    user = request.user
    # if user.has_perm('employee.change_project'):
    #     permission = ''
    # else:
    #     permission = 'disabled'

    # project = Project.objects.get(id=id)  
    # banks = Bank.objects.all()
    # types = Insurance_type.objects.all()
    # document_types = Document_type.objects.all()  
    # bank_guaranty = Bank_guaranty.objects.get(project=id)
    # liquidity_damages = Liquidity_damages.objects.get(project_id=id)
    # insurance_detail = Insurance_detail.objects.get(project_id=id) 
    # project_document = Project_document.objects.filter(project=id)
    # branches = Branch.objects.filter(status=1).values('id','branch_name')
    # project_types = Project_type.objects.filter(status=1).values('id','type_name')
    # clients = Client.objects.filter(status=1).values('id','client_name')
    # countries = Country.objects.filter(status=1).values('id','country_name')
    # return render(request,'project/project_details.html', {'document_types':document_types,'project_document':project_document,'types':types,'banks':banks,'bank_guaranty':bank_guaranty,'liquidity_damages':liquidity_damages,'insurance_detail':insurance_detail,'permission':permission,'project':project, 'branches':branches, 'project_types':project_types, 'clients':clients, 'countries':countries})  
    context = {}
    context['project'] = get_object_or_404(Project, id=id)

    if user.has_perm('employee.change_project'):
        if(context['project'].project_status == 'Cancel' or context['project'].project_status == 'Completed'):
            context['permission'] = 'disabled'
        else:
            context['permission'] = ''
    else:
        context['permission'] = 'disabled'
    # Use get_object_or_404 for Project as it is likely required
    

    # Use try-except for optional single object queries
    try:
        context['bank_guaranty'] = Bank_guaranty.objects.filter(project=id,status=1)
    except Bank_guaranty.DoesNotExist:
        context['bank_guaranty'] = None

    try:
        context['liquidity_damages'] = Liquidity_damages.objects.filter(project_id=id,status=1)
    except Liquidity_damages.DoesNotExist:
        context['liquidity_damages'] = None

    try:
        context['insurance_detail'] = Insurance_detail.objects.filter(project_id=id,status=1)
    except Insurance_detail.DoesNotExist:
        context['insurance_detail'] = None
    
    try:
        context['employee_projects'] = Employee_project.objects.filter(project_id=id,status=1)
    except Employee_project.DoesNotExist:
        context['employee_projects'] = None

    # QuerySets are handled normally as empty QuerySets are fine
    context['banks'] = Bank.objects.filter(status=1)
    context['types'] = Insurance_type.objects.filter(status=1)
    context['document_types'] = Document_type.objects.filter(status=1)
    context['project_document'] = Project_document.objects.filter(project=id,status=1)
    context['branches'] = Branch.objects.filter(status=1).values('id', 'branch_name')
    context['project_types'] = Project_type.objects.filter(status=1).values('id', 'type_name')
    context['clients'] = Client.objects.filter(status=1).values('id', 'client_name')
    context['countries'] = Country.objects.filter(status=1).values('id', 'country_name')
    context['employees'] = Employee.objects.filter(status=1).values('id', 'ename')
    context['leads'] = Leads.objects.filter(status=1).values('id', 'title')
    
    return render(request, 'project/project_details.html', context)

def manual_update_project(request, id):
    project_instance = get_object_or_404(Project, id=id)

    if request.method == 'POST':
        try:
            # Update fields from request.POST
            for field, value in request.POST.items():
                if hasattr(project_instance, field):
                    setattr(project_instance, field, value)

            # Handle file uploads from request.FILES
            for field_name, uploaded_file in request.FILES.items():
                if hasattr(project_instance, field_name):
                    # Create a folder path
                    folder_name = str(project_instance.pk)
                    folder_path = os.path.join(settings.MEDIA_ROOT, 'project', folder_name)

                    if not os.path.exists(folder_path):
                        os.makedirs(folder_path)

                    # Generate a unique file name
                    timestamp = datetime.now().strftime('%Y%m%d%H%M%S')
                    new_file_name = f"{project_instance.pk}_{timestamp}{os.path.splitext(uploaded_file.name)[1]}"
                    file_path = os.path.join(folder_path, new_file_name)

                    # Save the file to disk
                    with open(file_path, 'wb') as f:
                        for chunk in uploaded_file.chunks():
                            f.write(chunk)

                    # Update the model field with the file's relative path
                    setattr(project_instance, field_name, os.path.relpath(file_path, settings.MEDIA_ROOT))

            # Save the updated instance
            project_instance.save()

            # Return success response
            return JsonResponse({'status': 'success', 'id': project_instance.id}, status=200)

        except Exception as e:
            logger.exception("Error updating project: %s", e)
            return JsonResponse({'status': 'error', 'error': str(e)}, status=400)

    return JsonResponse({'status': 'error', 'message': 'Invalid request method'}, status=405)


# Bank
@login_required 
@permission_required('employee.add_bank', raise_exception=True)
def add_bank(request): 
    if request.method == "POST":  
        form = BankForm(request.POST) 
        bank_name = request.POST.get('bank_name').strip().lower()  # Normalize to lowercase
        branch_code = request.POST.get('branch_code').strip().lower()
        bank = Bank.objects.filter(bank_name__iexact=bank_name, branch_code__iexact=branch_code, status=1)
        if form.is_valid():
            if bank.exists():
                messages.error(request, "This Bank or Branch code already exist.")
                return render(request,'bank/add_bank.html',{'form':form})
            else:
                try:  
                    form.save()  
                    messages.success(request, "Data added successfully!")
                    return redirect('show_bank')  
                except Exception as e:  
                    messages.error(request, f"Internal Server Error: {str(e)}")
                    return render(request,'bank/add_bank.html',{'form':form})  
                    pass  
        else:
            error_messages = form.errors.as_json()
            messages.error(request, f"Form validation failed: {error_messages}")
            return render(request,'bank/add_bank.html',{'form':form})
    else:  
        form = BankForm() 
        return render(request,'bank/add_bank.html',{'form':form})  

@login_required    
@permission_required('employee.view_bank', raise_exception=True)
def show_bank(request):  
    banks = Bank.objects.filter(status=1)  
    return render(request,"bank/show_bank.html",{'banks':banks})  

@login_required  
@permission_required('employee.change_bank', raise_exception=True)
def e_bank(request, id):  
    bank = Bank.objects.get(id=id) 
    return render(request,'bank/e_bank.html', {'bank':bank})  

@login_required  
def u_bank(request, id):  
    bank = Bank.objects.get(id=id)  
    form = BankForm(request.POST, instance = bank)  
    bank_name = request.POST.get('bank_name').strip().lower()  # Normalize to lowercase
    branch_code = request.POST.get('branch_code').strip().lower()
    data = Bank.objects.filter(bank_name__iexact=bank_name, branch_code__iexact=branch_code, status=1)
    if form.is_valid(): 
        if data.exists():
            messages.error(request, "This Bank or Branch code already exist.")
            return redirect("show_bank")
        else:
            form.save()  
            messages.success(request, "Data Updated successfully!")  
            return redirect("show_bank")  
    error_messages = form.errors.as_json()
    messages.error(request, f"Form validation failed: {error_messages}")  
    return render(request, 'bank/e_bank.html', {'bank': bank})  

@login_required  
@permission_required('employee.delete_bank', raise_exception=True)
def d_bank(request, id):  
    bank = Bank.objects.get(id=id)  
    bank.status=0  
    bank.save()
    messages.success(request, "Data Deleted successfully!")
    return redirect("show_bank")

# Bank_guaranty
@login_required 
@permission_required('employee.add_bank_guaranty', raise_exception=True)
def add_bank_guaranty(request):  
    if request.method == "POST":  
        form = Bank_guarantyForm(request.POST, request.FILES)
        projects = Project.objects.filter(status=1).values('id','title')
        banks = Bank.objects.filter(status=1).values('id','bank_name')
        modalfield_value = request.POST.get('modalfield')
        try: 
            if form.is_valid():
                file_instance = form.save(commit=False)
                if 'bg_doc' in request.FILES:
                    # Generate folder path dynamically
                    folder_name = str(file_instance.project.id)
                    folder_path = os.path.join(settings.MEDIA_ROOT,'project',folder_name,'bank_guarantee')
                    
                    if not os.path.exists(folder_path):
                        os.makedirs(folder_path)
                    # Generate file path dynamically
                    # file_name = request.FILES['bg_doc'].name
                    timestamp = datetime.now().strftime('%Y%m%d%H%M%S')
                    new_file_name = f"{file_instance.project.id}_bg_{timestamp}{os.path.splitext(request.FILES['bg_doc'].name)[1]}"
                    file_path = os.path.join(folder_path, new_file_name)
                    # Save file to the generated path
                    with open(file_path, 'wb') as f:
                        for chunk in request.FILES['bg_doc'].chunks():
                            f.write(chunk)
                    # Update the file field with the relative path to the file
                    file_instance.bg_doc = os.path.relpath(file_path, settings.MEDIA_ROOT)
                file_instance.save() 
                if modalfield_value == '1':
                    messages.success(request, "Data added successfully!") 
                    return JsonResponse({'status': 'success'}, status=200)
                else:
                    messages.success(request, "Data added successfully!") 
                    return redirect('show_bank_guaranty') 
                
            else:
                if modalfield_value == '1':
                    error_messages = form.errors.as_json()
                    return JsonResponse({'status': 'error', 'message': f"Form validation failed: {error_messages}"}, status=400)
                else:
                    error_messages = form.errors.as_json()
                    messages.error(request, f"Form validation failed: {error_messages}")
                    return render(request,'bank_guaranty/add_bank_guaranty.html',{'form':form,'projects':projects,'banks':banks})  
        except Exception as e:  
            if modalfield_value == '1':
                return JsonResponse({'status': 'error', 'message': f"Internal Server Error: {str(e)}"}, status=400)
            else:
                messages.error(request, f"Internal Server Error: {str(e)}")
                return render(request,'bank_guaranty/add_bank_guaranty.html',{'form':form,'projects':projects,'banks':banks})  
            pass  
    else:  
        form = Bank_guarantyForm()  
        projects = Project.objects.filter(status=1).values('id','title')
        banks = Bank.objects.filter(status=1).values('id','bank_name')
        return render(request,'bank_guaranty/add_bank_guaranty.html',{'form':form,'projects':projects,'banks':banks})  
     # Added a fallback return to ensure an HttpResponse is always returned
    # return JsonResponse({'status': 'error', 'message': 'Unhandled request method'}, status=400)

@login_required    
@permission_required('employee.view_bank_guaranty', raise_exception=True)
def show_bank_guaranty(request):  
    bank_guaranties = Bank_guaranty.objects.filter(status=1)  
    return render(request,"bank_guaranty/show_bank_guaranty.html",{'bank_guaranties':bank_guaranties})  

@login_required  
@permission_required('employee.change_bank_guaranty', raise_exception=True)
def e_bank_guaranty(request, id):  
    bank_guaranty = Bank_guaranty.objects.get(id=id) 
    projects = Project.objects.filter(status=1).values('id','title')
    banks = Bank.objects.filter(status=1).values('id','bank_name')
    return render(request,'bank_guaranty/e_bank_guaranty.html', {'bank_guaranty':bank_guaranty,'projects':projects,'banks':banks})  

@login_required  
def u_bank_guaranty(request, id):  
    bank_guaranty = Bank_guaranty.objects.get(id=id)
    old_path = bank_guaranty.bg_doc 
    if request.method == "POST": 
        form = Bank_guarantyForm(request.POST, request.FILES, instance = bank_guaranty)
        try: 
            if form.is_valid():
                file_instance = form.save(commit=False)
                if 'bg_doc' in request.FILES:
                    # Generate folder path dynamically
                    folder_name = str(file_instance.project.id)
                    folder_path = os.path.join(settings.MEDIA_ROOT,'project',folder_name,'bank_guarantee')
                    
                    if not os.path.exists(folder_path):
                        os.makedirs(folder_path)
                    # Generate file path dynamically
                    timestamp = datetime.now().strftime('%Y%m%d%H%M%S')
                    new_file_name = f"{file_instance.project.id}_bg_{timestamp}{os.path.splitext(request.FILES['bg_doc'].name)[1]}"
                    file_path = os.path.join(folder_path, new_file_name)
                    
                    if old_path and os.path.exists(os.path.join(settings.MEDIA_ROOT, old_path)):
                            os.remove(os.path.join(settings.MEDIA_ROOT, old_path))
                    # Save file to the generated path
                    with open(file_path, 'wb') as f:
                        for chunk in request.FILES['bg_doc'].chunks():
                            f.write(chunk)
                    # Update the file field with the relative path to the file
                    file_instance.bg_doc = os.path.relpath(file_path, settings.MEDIA_ROOT)
                else:
                    # Ensure the old file path is retained if no new file is uploaded
                    file_instance.bg_doc = old_path

                file_instance.save() 
                messages.success(request, "Data Updated successfully!")  
                return redirect('../project_details/'+str(file_instance.project.id)) 
                # return redirect('show_bank_guaranty')  
            else:
                error_messages = form.errors.as_json()
                messages.error(request, f"Bank guaranty Form validation failed: {error_messages}")
                return redirect(f'../project_details/{bank_guaranty.project.id}')
        except Exception as e:  
            messages.error(request, f"Internal Server Error: {str(e)}")
            return redirect(f'../project_details/{bank_guaranty.project.id}')
   
@login_required  
@permission_required('employee.delete_bank_guaranty', raise_exception=True)
def d_bank_guaranty(request, id):  
    bank_guaranty = Bank_guaranty.objects.get(id=id)  
    bank_guaranty.status=0  
    bank_guaranty.save()
    messages.success(request, "Data Deleted successfully!")
    return redirect("show_bank_guaranty")

# Liquidity_damages
@login_required 
@permission_required('employee.add_liquidity_damages', raise_exception=True)
def add_liquidity_damages(request):  
    if request.method == "POST":  
        form = Liquidity_damagesForm(request.POST, request.FILES) 
        projects = Project.objects.filter(status=1).values('id','title')  
        modalfield_value = request.POST.get('modalfield')
        try:
            if form.is_valid():
                file_instance = form.save(commit=False)
                if 'ld_doc' in request.FILES:
                    # Generate folder path dynamically
                    folder_name = str(file_instance.project.id)
                    folder_path = os.path.join(settings.MEDIA_ROOT,'project',folder_name,'liquidity_damages')
                    
                    if not os.path.exists(folder_path):
                        os.makedirs(folder_path)
                    # Generate file path dynamically
                    # file_name = request.FILES['ld_doc'].name
                    timestamp = datetime.now().strftime('%Y%m%d%H%M%S')
                    new_file_name = f"{file_instance.project.id}_ld_{timestamp}{os.path.splitext(request.FILES['ld_doc'].name)[1]}"
                    file_path = os.path.join(folder_path, new_file_name)
                    # Save file to the generated path
                    with open(file_path, 'wb') as f:
                        for chunk in request.FILES['ld_doc'].chunks():
                            f.write(chunk)
                    # Update the file field with the relative path to the file
                    file_instance.ld_doc = os.path.relpath(file_path, settings.MEDIA_ROOT)
                file_instance.save()   
                if modalfield_value == '1':
                    messages.success(request, "Data added successfully!") 
                    return JsonResponse({'status': 'success'}, status=200)
                else:
                    messages.success(request, "Data added successfully!") 
                    return redirect('show_liquidity_damages')  
            else:
                if modalfield_value == '1':
                    error_messages = form.errors.as_json()
                    return JsonResponse({'status': 'error', 'message': f"Form validation failed: {error_messages}"}, status=400)
                else:
                    error_messages = form.errors.as_json()
                    messages.error(request, f"Form validation failed: {error_messages}")
                    return render(request,'liquidity_damages/add_liquidity_damages.html',{'form':form,'projects':projects})  
        except Exception as e:  
            if modalfield_value == '1':
                return JsonResponse({'status': 'error', 'message': f"Internal Server Error: {str(e)}"}, status=400)
            else:
                messages.error(request, f"Internal Server Error: {str(e)}")
                return render(request,'liquidity_damages/add_liquidity_damages.html',{'form':form,'projects':projects})  
    else:  
        form = Liquidity_damagesForm()
        projects = Project.objects.filter(status=1).values('id','title')  
        return render(request,'liquidity_damages/add_liquidity_damages.html',{'form':form,'projects':projects})  
     # Added a fallback return to ensure an HttpResponse is always returned
    # return JsonResponse({'status': 'error', 'message': 'Unhandled request method'}, status=400)

@login_required  
@permission_required('employee.view_liquidity_damages', raise_exception=True)  
def show_liquidity_damages(request):  
    liquidity_damages = Liquidity_damages.objects.filter(status=1)  
    return render(request,"liquidity_damages/show_liquidity_damages.html",{'liquidity_damages':liquidity_damages})  

@login_required  
@permission_required('employee.change_liquidity_damages', raise_exception=True)
def e_liquidity_damages(request, id):  
    liquidity_damages = Liquidity_damages.objects.get(id=id)
    projects = Project.objects.filter(status=1).values('id','title') 
    return render(request,'liquidity_damages/e_liquidity_damages.html', {'liquidity_damages':liquidity_damages,'projects':projects})  

@login_required  
def u_liquidity_damages(request, id):  
    liquidity_damages = Liquidity_damages.objects.get(id=id)  
    old_path = liquidity_damages.ld_doc 
    if request.method == "POST": 
        form = Liquidity_damagesForm(request.POST, request.FILES, instance=liquidity_damages)
        try: 
            if form.is_valid():
                file_instance = form.save(commit=False)  # Save without committing to handle the file logic
                if 'ld_doc' in request.FILES:
                    # Generate folder path dynamically
                    folder_name = str(file_instance.project.id)
                    folder_path = os.path.join(settings.MEDIA_ROOT, 'project', folder_name, 'liquidity_damages')
                    
                    if not os.path.exists(folder_path):
                        os.makedirs(folder_path)

                    # Generate file path dynamically
                    timestamp = datetime.now().strftime('%Y%m%d%H%M%S')
                    new_file_name = f"{file_instance.project.id}_ld_{timestamp}{os.path.splitext(request.FILES['ld_doc'].name)[1]}"
                    file_path = os.path.join(folder_path, new_file_name)
                    
                    # Remove the old file if it exists
                    if old_path and os.path.exists(os.path.join(settings.MEDIA_ROOT, old_path)):
                        os.remove(os.path.join(settings.MEDIA_ROOT, old_path))

                    # Save file to the generated path
                    with open(file_path, 'wb') as f:
                        for chunk in request.FILES['ld_doc'].chunks():
                            f.write(chunk)

                    # Update the file field with the relative path
                    file_instance.ld_doc = os.path.relpath(file_path, settings.MEDIA_ROOT)
                else:
                    # Retain old file path if no new file is uploaded
                    file_instance.ld_doc = old_path

                # Save the file instance
                file_instance.save()
                messages.success(request, "Data Updated successfully!")  
                return redirect(f'../project_details/{file_instance.project.id}')  
            else:
                # Log form errors for debugging
                error_messages = form.errors.as_json()
                messages.error(request, f"Liquidity damages Form validation failed: {error_messages}")
                return redirect(f'../project_details/{liquidity_damages.project.id}')
        except Exception as e:  
            messages.error(request, f"Internal Server Error: {str(e)}")
            return redirect(f'../project_details/{liquidity_damages.project.id}')
    

@login_required  
@permission_required('employee.delete_liquidity_damages', raise_exception=True)
def d_liquidity_damages(request, id):  
    liquidity_damages = Liquidity_damages.objects.get(id=id)  
    liquidity_damages.status=0  
    liquidity_damages.save()
    messages.success(request, "Data Deleted successfully!")
    return redirect("show_liquidity_damages")

# Insurance_type
@login_required 
@permission_required('employee.add_insurance_type', raise_exception=True)
def add_insurance_type(request):  
    if request.method == "POST":  
        form = Insurance_typeForm(request.POST) 
        type_name = request.POST.get('type_name').strip().lower()  # Normalize to lowercase
        type = Insurance_type.objects.filter(type_name__iexact=type_name, status=1)
        if form.is_valid():
            if type.exists():
                messages.error(request, "This Insurance Type already exist.")
                return render(request,'insurance_type/add_insurance_type.html',{'form':form})     
            else:
                try:  
                    form.save()  
                    messages.success(request, "Data added successfully!")
                    return redirect('show_insurance_type')  
                except Exception as e:  
                    messages.error(request, f"Internal Server Error: {str(e)}")
                    return render(request,'insurance_type/add_insurance_type.html',{'form':form})  
        else:
            error_messages = form.errors.as_json()
            messages.error(request, f"Form validation failed: {error_messages}")  
            return render(request,'insurance_type/add_insurance_type.html',{'form':form})     
    else:  
        form = Insurance_typeForm()  
        return render(request,'insurance_type/add_insurance_type.html',{'form':form})  

@login_required    
@permission_required('employee.view_insurance_type', raise_exception=True)
def show_insurance_type(request):  
    insurance_types = Insurance_type.objects.filter(status=1)  
    return render(request,"insurance_type/show_insurance_type.html",{'insurance_types':insurance_types})  

@login_required  
@permission_required('employee.change_insurance_type', raise_exception=True)
def e_insurance_type(request, id):  
    insurance_type = Insurance_type.objects.get(id=id) 
    return render(request,'insurance_type/e_insurance_type.html', {'insurance_type':insurance_type})  

@login_required  
def u_insurance_type(request, id):  
    insurance_type = Insurance_type.objects.get(id=id)  
    form = Insurance_typeForm(request.POST, instance = insurance_type)  
    type_name = request.POST.get('type_name').strip().lower()  # Normalize to lowercase
    type = Insurance_type.objects.filter(type_name__iexact=type_name, status=1)
    if form.is_valid():  
        if type.exists():
            messages.error(request, "This Insurance Type already exist.")
            return redirect("show_insurance_type")
        else:
            form.save()  
            messages.success(request, "Data Updated successfully!")  
            return redirect("show_insurance_type")  
    error_messages = form.errors.as_json()
    messages.error(request, f"Form validation failed: {error_messages}")  
    return render(request, 'insurance_type/e_insurance_type.html', {'insurance_type': insurance_type})  

@login_required  
@permission_required('employee.delete_insurance_type', raise_exception=True)
def d_insurance_type(request, id):  
    insurance_type = Insurance_type.objects.get(id=id)  
    insurance_type.status=0  
    insurance_type.save()
    messages.success(request, "Data Deleted successfully!")
    return redirect("show_insurance_type")


# Insurance_detail
@login_required 
@permission_required('employee.add_insurance_detail', raise_exception=True)
def add_insurance_detail(request):  
    if request.method == "POST":  
        form = Insurance_detailForm(request.POST) 
        modalfield_value = request.POST.get('modalfield')
        projects = Project.objects.filter(status=1).values('id','title') 
        insurance_types = Insurance_type.objects.filter(status=1).values('id','type_name') 
        if form.is_valid():
            try:  
                form.save() 
                if modalfield_value == '1':
                    messages.success(request, "Data added successfully!") 
                    return JsonResponse({'status': 'success'}, status=200)
                else: 
                    messages.success(request, "Data added successfully!") 
                    return redirect('show_insurance_detail')  
            except Exception as e:  
                if modalfield_value == '1':
                    return JsonResponse({'status': 'error', 'message': f"Internal Server Error: {str(e)}"}, status=400)
                else:
                    messages.error(request, f"Internal Server Error: {str(e)}")
                    return render(request,'insurance_detail/add_insurance_detail.html',{'form':form,'projects':projects,'insurance_types':insurance_types})    
        else:
            if modalfield_value == '1':
                error_messages = form.errors.as_json()
                return JsonResponse({'status': 'error', 'message': f"Form validation failed: {error_messages}"}, status=400)
            else:
                error_messages = form.errors.as_json()
                messages.error(request, f"Form validation failed: {error_messages}")
                return render(request,'insurance_detail/add_insurance_detail.html',{'form':form,'projects':projects,'insurance_types':insurance_types})  
    else:  
        form = Insurance_detailForm()
        projects = Project.objects.filter(status=1).values('id','title') 
        insurance_types = Insurance_type.objects.filter(status=1).values('id','type_name') 
        return render(request,'insurance_detail/add_insurance_detail.html',{'form':form,'projects':projects,'insurance_types':insurance_types})  
     # Added a fallback return to ensure an HttpResponse is always returned
    # return JsonResponse({'status': 'error', 'message': 'Unhandled request method'}, status=400)

@login_required   
@permission_required('employee.view_insurance_detail', raise_exception=True) 
def show_insurance_detail(request):  
    insurance_details = Insurance_detail.objects.filter(status=1) 
    return render(request,"insurance_detail/show_insurance_detail.html",{'insurance_details':insurance_details})  

@login_required  
@permission_required('employee.change_insurance_type', raise_exception=True)
def e_insurance_detail(request, id):  
    insurance_detail = Insurance_detail.objects.get(id=id) 
    projects = Project.objects.filter(status=1).values('id','title')
    insurance_types = Insurance_type.objects.filter(status=1).values('id','type_name')
    return render(request,'insurance_detail/e_insurance_detail.html', {'insurance_detail':insurance_detail,'projects':projects,'insurance_types':insurance_types})  

@login_required  
def u_insurance_detail(request, id):  
    insurance_detail = Insurance_detail.objects.get(id=id)  
    form = Insurance_detailForm(request.POST, instance = insurance_detail)  
    if form.is_valid():  
        form.save()  
        messages.success(request, "Data Updated successfully!")  
        return redirect('../project_details/'+str(insurance_detail.project.id))
        # return redirect("show_insurance_detail")  
    else:
        error_messages = form.errors.as_json()
        messages.error(request, f"Insurance detail Form validation failed: {error_messages}")
        return redirect('../project_details/'+str(insurance_detail.project.id))
    # return render(request, 'insurance_detail/e_insurance_detail.html', {'insurance_detail': insurance_detail})  

@login_required  
@permission_required('employee.delete_insurance_detail', raise_exception=True)
def d_insurance_detail(request, id):  
    insurance_detail = Insurance_detail.objects.get(id=id)  
    insurance_detail.status=0  
    insurance_detail.save()
    messages.success(request, "Data Deleted successfully!")
    return redirect("show_insurance_detail")

# Country
@login_required 
@permission_required('employee.add_country', raise_exception=True)
def add_country(request):  
    if request.method == "POST":  
        form = CountryForm(request.POST) 
        country_name = request.POST.get('country_name').strip().lower()
        country = Country.objects.filter(country_name__iexact=country_name, status=1)
        if form.is_valid():
            if country.exists():
                messages.error(request, "This Country already exist.")
                return render(request,'country/add_country.html',{'form':form})  
            else:
                try:  
                    form.save()  
                    messages.success(request, "Data added successfully!")
                    return redirect('show_country')  
                except Exception as e:  
                    messages.error(request, f"Internal Server Error: {str(e)}")
                    return render(request,'country/add_country.html',{'form':form})  
        else:
            error_messages = form.errors.as_json()
            messages.error(request, f"Form validation failed: {error_messages}") 
            return render(request,'country/add_country.html',{'form':form})         
    else:  
        form = CountryForm()  
        return render(request,'country/add_country.html',{'form':form})  

@login_required 
@permission_required('employee.view_country', raise_exception=True)   
def show_country(request):  
    countries = Country.objects.filter(status=1) 
    return render(request,"country/show_country.html",{'countries':countries})  

@login_required  
@permission_required('employee.change_country', raise_exception=True)
def e_country(request, id):  
    country = Country.objects.get(id=id)
    return render(request,'country/e_country.html', {'country':country})  

@login_required  
def u_country(request, id):  
    country = Country.objects.get(id=id)  
    form = CountryForm(request.POST, instance = country) 
    country_name = request.POST.get('country_name').strip().lower()
    countries = Country.objects.filter(country_name__iexact=country_name, status=1) 
    if form.is_valid(): 
        if countries.exists():
            messages.error(request, "This Country already exist.")
            return redirect("show_country") 
        else: 
            form.save()  
            messages.success(request, "Data Updated successfully!")  
            return redirect("show_country")  
    error_messages = form.errors.as_json()
    messages.error(request, f"Form validation failed: {error_messages}")  
    return render(request, 'country/e_country.html', {'country': country})  

@login_required  
@permission_required('employee.delete_country', raise_exception=True)
def d_country(request, id):  
    country = Country.objects.get(id=id)  
    country.status=0  
    country.save()
    messages.success(request, "Data Deleted successfully!")
    return redirect("show_country")

# Zone
@login_required 
@permission_required('employee.add_zone', raise_exception=True)
def add_zone(request):  
    if request.method == "POST":  
        form = ZoneForm(request.POST) 
        zone_name = request.POST.get('zone_name').strip().lower()
        zone = Zone.objects.filter(zone_name__iexact=zone_name, status=1)
        if form.is_valid():
            if zone.exists():
                messages.error(request, "This Zone already exist.")
                return render(request,'zone/add_zone.html',{'form':form})
            else:
                try:  
                    form.save()  
                    messages.success(request, "Data added successfully!")
                    return redirect('show_zone')  
                except Exception as e:  
                    messages.error(request, f"Internal Server Error: {str(e)}")
                    return render(request,'zone/add_zone.html',{'form':form})
        else:
            error_messages = form.errors.as_json()
            messages.error(request, f"Form validation failed: {error_messages}")
            return render(request,'zone/add_zone.html',{'form':form})
    else:  
        form = ZoneForm()  
        return render(request,'zone/add_zone.html',{'form':form})  

@login_required   
@permission_required('employee.view_zone', raise_exception=True) 
def show_zone(request):  
    zones = Zone.objects.filter(status=1) 
    return render(request,"zone/show_zone.html",{'zones':zones})  

@login_required  
@permission_required('employee.change_zone', raise_exception=True)
def e_zone(request, id):  
    zone = Zone.objects.get(id=id)  
    return render(request,'zone/e_zone.html', {'zone':zone})  

@login_required  
def u_zone(request, id):  
    zone = Zone.objects.get(id=id)  
    form = ZoneForm(request.POST, instance = zone)  
    zone_name = request.POST.get('zone_name').strip().lower()
    zones = Zone.objects.filter(zone_name__iexact=zone_name, status=1)
    if form.is_valid():  
        if zones.exists():
            messages.error(request, "This Zone already exist.")
            return redirect("show_zone")
        else:
            form.save()  
            messages.success(request, "Data Updated successfully!")  
            return redirect("show_zone")  
    error_messages = form.errors.as_json()
    messages.error(request, f"Form validation failed: {error_messages}")  
    return render(request, 'zone/e_zone.html', {'zone': zone})  

@login_required
@permission_required('employee.delete_zone', raise_exception=True)  
def d_zone(request, id):  
    zone = Zone.objects.get(id=id)  
    zone.status=0  
    zone.save()
    messages.success(request, "Data Deleted successfully!")
    return redirect("show_zone")

# Area
@login_required 
@permission_required('employee.add_area', raise_exception=True)
def add_area(request):  
    if request.method == "POST":  
        form = AreaForm(request.POST) 
        area_name = request.POST.get('area_name').strip().lower()
        area = Area.objects.filter(area_name__iexact=area_name, status=1)
        if form.is_valid():
            if area.exists():
                messages.error(request, "This Area already exist.")
                return render(request,'area/add_area.html',{'form':form}) 
            else:
                try:  
                    form.save()  
                    messages.success(request, "Data added successfully!")
                    return redirect('show_area')  
                except Exception as e:  
                    messages.error(request, f"Internal Server Error: {str(e)}")
                    return render(request,'area/add_area.html',{'form':form}) 
                    pass  
        else:
            error_messages = form.errors.as_json()
            messages.error(request, f"Form validation failed: {error_messages}")
            return render(request,'area/add_area.html',{'form':form}) 
    else:  
        form = AreaForm()  
        return render(request,'area/add_area.html',{'form':form})  

@login_required   
@permission_required('employee.view_area', raise_exception=True) 
def show_area(request):  
    areas = Area.objects.filter(status=1)  
    return render(request,"area/show_area.html",{'areas':areas})  

@login_required  
@permission_required('employee.change_area', raise_exception=True)
def e_area(request, id):  
    area = Area.objects.get(id=id)  
    return render(request,'area/e_area.html', {'area':area})  

@login_required  
def u_area(request, id):  
    area = Area.objects.get(id=id)  
    form = AreaForm(request.POST, instance = area)  
    area_name = request.POST.get('area_name').strip().lower()
    areas = Area.objects.filter(area_name__iexact=area_name, status=1)
    if form.is_valid():
        if areas.exists():
            messages.error(request, "This Area already exist.")
            return redirect("show_area")   
        else:  
            form.save() 
            messages.success(request, "Data Updated successfully!")   
            return redirect("show_area")  
    error_messages = form.errors.as_json()
    messages.error(request, f"Form validation failed: {error_messages}")  
    return render(request, 'area/e_area.html', {'area': area})  

@login_required  
@permission_required('employee.delete_area', raise_exception=True)
def d_area(request, id):  
    area = Area.objects.get(id=id)  
    area.status=0  
    area.save()
    messages.success(request, "Data Deleted successfully!")
    return redirect("show_area")

# Branch
@login_required 
@permission_required('employee.add_branch', raise_exception=True)
def add_branch(request):  
    companies = Company.objects.filter(status=1).values('id','comp_name')
    countries = Country.objects.filter(status=1).values('id','country_name')
    zones = Zone.objects.filter(status=1).values('id','zone_name')
    regions = Region.objects.filter(status=1).values('id','region_name')
    areas = Area.objects.filter(status=1).values('id','area_name')
    if request.method == "POST":  
        form = BranchForm(request.POST) 
        if form.is_valid():
            try:  
                form.save()  
                messages.success(request, "Data added successfully!")
                return redirect('show_branch')  
            except Exception as e:  
                messages.error(request, f"Internal Server Error: {str(e)}")
                return render(request,'branch/add_branch.html',{'form':form, 'companies':companies, 'countries':countries, 'zones':zones, 'regions':regions, 'areas':areas})    
        else:
            error_messages = form.errors.as_json()
            messages.error(request, f"Form validation failed: {error_messages}")
            return render(request,'branch/add_branch.html',{'form':form, 'companies':companies, 'countries':countries, 'zones':zones, 'regions':regions, 'areas':areas})    
    else:  
        form = BranchForm() 
        return render(request,'branch/add_branch.html',{'form':form, 'companies':companies, 'countries':countries, 'zones':zones, 'regions':regions, 'areas':areas})  

@login_required   
@permission_required('employee.view_branch', raise_exception=True) 
def show_branch(request):  
    branches = Branch.objects.filter(status=1)  
    return render(request,"branch/show_branch.html",{'branches':branches})  

@login_required
@permission_required('employee.change_branch', raise_exception=True)  
def e_branch(request, id):  
    branch = Branch.objects.get(id=id)
    companies = Company.objects.filter(status=1).values('id','comp_name')
    countries = Country.objects.filter(status=1).values('id','country_name')
    zones = Zone.objects.filter(status=1).values('id','zone_name')
    regions = Region.objects.filter(status=1).values('id','region_name')
    areas = Area.objects.filter(status=1).values('id','area_name')  
    return render(request,'branch/e_branch.html', {'branch':branch, 'companies':companies, 'countries':countries, 'zones':zones, 'regions':regions, 'areas':areas})  

@login_required  
def u_branch(request, id):  
    branch = Branch.objects.get(id=id)  
    form = BranchForm(request.POST, instance = branch)  
    if form.is_valid():  
        form.save()  
        messages.success(request, "Data Updated successfully!")  
        return redirect("show_branch")  
    error_messages = form.errors.as_json()
    messages.error(request, f"Form validation failed: {error_messages}")  
    return render(request, 'branch/e_branch.html', {'branch': branch})  

@login_required  
@permission_required('employee.delete_branch', raise_exception=True)
def d_branch(request, id):  
    branch = Branch.objects.get(id=id)  
    branch.status=0  
    branch.save()
    messages.success(request, "Data Deleted successfully!")
    return redirect("show_branch")

# Client
@login_required 
@permission_required('employee.add_client', raise_exception=True)
def add_client(request): 
    countries = Country.objects.filter(status=1).values('id','country_name') 
    if request.method == "POST":  
        form = ClientForm(request.POST) 
        email = request.POST.get('email')
        phone = request.POST.get('phone')
        client = Client.objects.filter(Q(email=email) | Q(phone=phone), status=1)
        if form.is_valid():
            if client.exists():
                messages.error(request, "This Client Email Address OR Phone Number already exist.")
                return render(request,'client/add_client.html',{'form':form, 'countries':countries})  
            else:
                try:  
                    form.save()
                    messages.success(request, "Data added successfully!")  
                    return redirect('show_client')  
                except Exception as e:  
                    messages.error(request, f"Internal Server Error: {str(e)}")
                    return render(request,'client/add_client.html',{'form':form, 'countries':countries})  
        else:
            error_messages = form.errors.as_json()
            messages.error(request, f"Form validation failed: {error_messages}")
            return render(request,'client/add_client.html',{'form':form, 'countries':countries})  
    else:  
        form = ClientForm() 
        return render(request,'client/add_client.html',{'form':form, 'countries':countries})  

@login_required    
@permission_required('employee.view_client', raise_exception=True)
def show_client(request):  
    clients = Client.objects.filter(status=1) 
    return render(request,"client/show_client.html",{'clients':clients})  

@login_required  
@permission_required('employee.change_client', raise_exception=True)
def e_client(request, id):  
    client = Client.objects.get(id=id)  
    countries = Country.objects.filter(status=1).values('id','country_name')
    return render(request,'client/e_client.html', {'client':client, 'countries':countries})  

@login_required  
def u_client(request, id):  
    client = Client.objects.get(id=id)  
    form = ClientForm(request.POST, instance = client) 
    countries = Country.objects.filter(status=1).values('id','country_name') 
    if form.is_valid():  
        form.save()  
        messages.success(request, "Data Updated successfully!")  
        return redirect("show_client")  
    error_messages = form.errors.as_json()
    messages.error(request, f"Form validation failed: {error_messages}")  
    return render(request, 'client/e_client.html', {'client': client, 'countries':countries})  

@login_required  
@permission_required('employee.delete_client', raise_exception=True)
def d_client(request, id):  
    client = Client.objects.get(id=id)  
    client.status=0  
    client.save()
    messages.success(request, "Data Deleted successfully!")
    return redirect("show_client")

# Document_type
@login_required 
@permission_required('employee.add_document_type', raise_exception=True)
def add_document_type(request):  
    if request.method == "POST":  
        form = Document_typeForm(request.POST) 
        title = request.POST.get('title').strip().lower()
        doc_type = Document_type.objects.filter(title__iexact=title, status=1)
        if form.is_valid():
            if doc_type.exists():
                messages.error(request, "This Document type already exist.")
                return render(request,'document_type/add_document_type.html',{'form':form})  
            else:
                try:  
                    form.save() 
                    messages.success(request, "Data added successfully!") 
                    return redirect('show_document_type')  
                except Exception as e:  
                    messages.error(request, f"Internal Server Error: {str(e)}")
                    return render(request,'document_type/add_document_type.html',{'form':form})  
        else:
            error_messages = form.errors.as_json()
            messages.error(request, f"Form validation failed: {error_messages}")
            return render(request,'document_type/add_document_type.html',{'form':form})  
    else:  
        form = Document_typeForm()  
        return render(request,'document_type/add_document_type.html',{'form':form})  

@login_required  
@permission_required('employee.view_document_type', raise_exception=True)  
def show_document_type(request):  
    document_types = Document_type.objects.filter(status=1)  
    return render(request,"document_type/show_document_type.html",{'document_types':document_types})  

@login_required  
@permission_required('employee.change_document_type', raise_exception=True)
def e_document_type(request, id):  
    document_type = Document_type.objects.get(id=id)  
    return render(request,'document_type/e_document_type.html', {'document_type':document_type})  

@login_required  
def u_document_type(request, id):  
    document_type = Document_type.objects.get(id=id)  
    form = Document_typeForm(request.POST, instance = document_type)
    title = request.POST.get('title').strip().lower()
    doc_type = Document_type.objects.filter(title__iexact=title, status=1)  
    if form.is_valid():  
        if doc_type.exists():
            messages.error(request, "This Document type already exist.")
            return redirect("show_document_type")
        else:
            form.save()  
            messages.success(request, "Data Updated successfully!")  
            return redirect("show_document_type") 
    error_messages = form.errors.as_json()
    messages.error(request, f"Form validation failed: {error_messages}")  
    return render(request, 'document_type/e_document_type.html', {'document_type': document_type})  

@login_required  
@permission_required('employee.delete_document_type', raise_exception=True)
def d_document_type(request, id):  
    document_type = Document_type.objects.get(id=id)  
    document_type.status=0  
    document_type.save()
    messages.success(request, "Data Deleted successfully!")
    return redirect("show_document_type")

# Project_document
@login_required 
@permission_required('employee.add_project_document', raise_exception=True)
def add_project_document(request): 
    projects = Project.objects.filter(status=1).values('id','title')
    document_types = Document_type.objects.filter(status=1).values('id','title')
    if request.method == "POST": 
        # Manually handle form validation
        project = request.POST.get('project')
        document_types = request.POST.getlist('document_type')
        doc_paths = request.FILES.getlist('doc_path')
        remarks = request.POST.getlist('remarks')
        ref_nos = request.POST.getlist('ref_no')
        issuance_dates = request.POST.getlist('issuance_date')
        modalfield_value = request.POST.get('modalfield')

        # Check if the common project field is provided
        if not project:
            if modalfield_value == '1':
                return JsonResponse({'status': 'error', 'message': "Project is required"}, status=400)
            else:
                messages.error(request, "Project is required")
                return render(request, 'project_document/add_project_document.html')

        # Ensure that all dynamic fields have values
        if len(document_types) != len(doc_paths) or len(doc_paths) != len(remarks) or len(ref_nos) != len(issuance_dates):
            if modalfield_value == '1':
                return JsonResponse({'status': 'error', 'message': "Mismatched form fields"}, status=400)
            else:
                messages.error(request, "Mismatched form fields")
                return render(request, 'project_document/add_project_document.html')

        # Process and save the data 
        try: 
            # Generate folder path dynamically
            folder_name = str(project)
            folder_path = os.path.join(settings.MEDIA_ROOT,'project',folder_name)
            
            if not os.path.exists(folder_path):
                print(f"An error occurred this path does not exist: {folder_path}")

            # Process dynamic fields and save them to the database
            for document_type, doc_path, remark, ref_no, issuance_date in zip(document_types, doc_paths, remarks, ref_nos, issuance_dates):
               # Generate the new file name
                doc_type_title = Document_type.objects.get(id=document_type)
                timestamp = datetime.now().strftime('%Y%m%d%H%M%S')
                new_file_name = f"{project}_{doc_type_title.title}_{timestamp}{os.path.splitext(doc_path.name)[1]}"
                new_file_path = os.path.join(folder_path, new_file_name)

                # Save file to the generated path
                with open(new_file_path, 'wb') as f:
                    for chunk in doc_path.chunks():
                        f.write(chunk)

                # Update the file field with the relative path to the file
                relative_file_path = os.path.relpath(new_file_path, settings.MEDIA_ROOT)

                Project_document.objects.create(
                    project_id=project,
                    document_type_id=document_type,
                    doc_path=relative_file_path,
                    remarks=remark,
                    ref_no=ref_no,
                    issuance_date=issuance_date
                    )
                
            
            if modalfield_value == '1':
                messages.success(request, "Data added successfully!")
                return JsonResponse({'status': 'success'}, status=200)
            else:
                messages.success(request, "Data added successfully!")
                return redirect('show_project_document')  
        except Exception as e:  
            if modalfield_value == '1':
                return JsonResponse({'status': 'error', 'message': f"Internal Server Error: {str(e)}"}, status=400)
            else:
                messages.error(request, f"Internal Server Error: {str(e)}")
                return render(request,'project_document/add_project_document.html',{'projects':projects, 'document_types':document_types})  
    else:  
        
        return render(request,'project_document/add_project_document.html',{'projects':projects, 'document_types':document_types})  
     # Added a fallback return to ensure an HttpResponse is always returned
    # return JsonResponse({'status': 'error', 'message': 'Unhandled request method'}, status=400)


@login_required   
@permission_required('employee.view_project_document', raise_exception=True) 
def show_project_document(request):  
    project_documents = Project_document.objects.filter(status=1)  
    return render(request,"project_document/show_project_document.html",{'project_documents':project_documents})  

@login_required  
@permission_required('employee.change_project_document', raise_exception=True)
def e_project_document(request, id):  
    project_document = Project_document.objects.get(id=id)
    projects = Project.objects.filter(status=1).values('id','title')
    document_types = Document_type.objects.filter(status=1).values('id','title')  
    return render(request,'project_document/e_project_document.html', {'project_document':project_document, 'projects':projects, 'document_types':document_types})  

@login_required  
def u_project_document(request, id):  
    project_document = Project_document.objects.get(id=id)  
    old_path = project_document.doc_path 
    if request.method == "POST": 
        form = Project_documentForm(request.POST, request.FILES, instance = project_document)
        try: 
            if form.is_valid():
                file_instance = form.save(commit=False)
                if 'doc_path' in request.FILES:
                    # Generate folder path dynamically
                    folder_name = str(file_instance.project.id)
                    folder_path = os.path.join(settings.MEDIA_ROOT,'project',folder_name)
                    
                    if not os.path.exists(folder_path):
                        print(f"An error occurred this path does not exist: {folder_path}")
                    # Generate the new file name
                    doc_type_title = Document_type.objects.get(id=file_instance.document_type.id)
                    timestamp = datetime.now().strftime('%Y%m%d%H%M%S')
                    new_file_name = f"{file_instance.project.id}_{doc_type_title.title}_{timestamp}{os.path.splitext(request.FILES['doc_path'].name)[1]}"
                    new_file_path = os.path.join(folder_path, new_file_name)
                    
                    
                    if old_path and os.path.exists(os.path.join(settings.MEDIA_ROOT, old_path)):
                            os.remove(os.path.join(settings.MEDIA_ROOT, old_path))
                    # Save file to the generated path
                    with open(new_file_path, 'wb') as f:
                        for chunk in request.FILES['doc_path'].chunks():
                            f.write(chunk)
                    # Update the file field with the relative path to the file
                    file_instance.doc_path = os.path.relpath(new_file_path, settings.MEDIA_ROOT)
                else:
                    # Ensure the old file path is retained if no new file is uploaded
                    file_instance.doc_path = old_path

                file_instance.save() 
                messages.success(request, "Data Updated successfully!")  
                return redirect('../project_details/'+str(file_instance.project.id))  
            else:
                error_messages = form.errors.as_json()
                messages.error(request, f"Project Document Form validation failed: {error_messages}")
                return redirect(f'../project_details/{project_document.project.id}')
        except Exception as e:  
            messages.error(request, f"Internal Server Error: {str(e)}")
            return redirect(f'../project_details/{project_document.project.id}')

@login_required  
@permission_required('employee.delete_project_document', raise_exception=True)
def d_project_document(request, id):  
    project_document = Project_document.objects.get(id=id)  
    project_document.status=0 
    project_document.save() 
    messages.success(request, "Data Deleted successfully!")
    return redirect("show_project_document")


# Employee_target
@login_required 
@permission_required('employee.add_employee_target', raise_exception=True)
def add_employee_target(request):  
    if request.method == "POST":  
        form = Employee_targetForm(request.POST)
        # Current date
        today = datetime.now().date()
        current_month = today.month
        current_year = today.year
        employees = Employee.objects.filter(status=1).values('id','ename')
        
        if form.is_valid():
            employee_target = Employee_target.objects.filter(financial_year=current_year,employee=request.POST.get('employee'),status=1)  
            if employee_target.exists():
                messages.error(request, "This employee target is already set.")
                return render(request,'employee_target/add_employee_target.html',{'form':form,'employees':employees})  
            else:
                try:
                    if(request.POST.get('whole_year')=='1'):
                        quarter = Quarters.objects.filter(status=1).values('id')
                    else:
                        # Query to filter quarters
                        quarter = Quarters.objects.filter(
                            start_date__month__lte=current_month,
                            end_date__month__gte=current_month,
                            status=1
                        ).values('id')
                    for id in quarter:
                        file_instance=form.save(commit=False)  
                        file_instance.quarter_id=id['id']
                        file_instance.financial_year=current_year
                        file_instance.pk = None
                        file_instance.save()
                    messages.success(request, "Data added successfully!")
                    return redirect('show_employee_target')  
                except Exception as e:  
                    messages.error(request, f"Internal Server Error: {str(e)}")
                    return render(request,'employee_target/add_employee_target.html',{'form':form,'employees':employees})  
        else:
            error_messages = form.errors.as_json()
            messages.error(request, f"Form validation failed: {error_messages}")
            return render(request,'employee_target/add_employee_target.html',{'form':form,'employees':employees})
    else:  
        form = Employee_targetForm()
        employees = Employee.objects.filter(status=1).values('id','ename')
        return render(request,'employee_target/add_employee_target.html',{'form':form,'employees':employees})  

@login_required  
@permission_required('employee.view_employee_target', raise_exception=True)  
def show_employee_target(request):  
    employee_targets = Employee_target.objects.filter(status=1)  
    return render(request,"employee_target/show_employee_target.html",{'employee_targets':employee_targets})  

@login_required  
@permission_required('employee.change_employee_target', raise_exception=True)
def e_employee_target(request, id):  
    employee_target = Employee_target.objects.get(id=id)  
    employees = Employee.objects.filter(status=1).values('id','ename')
    return render(request,'employee_target/e_employee_target.html', {'employee_target':employee_target,'employees':employees})  

@login_required  
def u_employee_target(request, id):  
    employee_target = Employee_target.objects.get(id=id)  
    form = Employee_targetForm(request.POST, instance = employee_target)  
    if form.is_valid():  
        form.save()
        messages.success(request, "Data Updated successfully!")  
        return redirect("show_employee_target")  
    error_messages = form.errors.as_json()
    messages.error(request, f"Form validation failed: {error_messages}")
    return redirect(f'../project_details/{employee_target.project.id}')

@login_required  
@permission_required('employee.delete_employee_target', raise_exception=True)
def d_employee_target(request, id):  
    employee_target = Employee_target.objects.get(id=id)  
    employee_target.status=0  
    employee_target.save()
    messages.success(request, "Data Deleted successfully!")
    return redirect("show_employee_target")

# Sales
@login_required 
@permission_required('employee.add_employee_project', raise_exception=True)
def add_employee_project(request):  
    projects = Project.objects.filter(status=1).values('id','title')
    employees = Employee.objects.filter(status=1).values('id','ename')
    if request.method == "POST":  
        form = Employee_projectForm(request.POST) 
        modalfield_value = request.POST.get('modalfield')
        if form.is_valid():
            employee_projects = Employee_project.objects.filter(project=request.POST.get('project'),employee=request.POST.get('employee'),status=1)  
            if employee_projects.exists():
                if modalfield_value == '1':
                    return JsonResponse({'status': 'error','message': "This employee is already assigned to the selected project."}, status=402)
                else:
                    messages.error(request, "This employee is already assigned to the selected project.")
                    return render(request,'employee_project/add_employee_project.html',{'form':form,'projects':projects,'employees':employees})  
            else:
                try:  
                    form.save()
                    if modalfield_value == '1':
                        messages.success(request, "Data added successfully!")
                        return JsonResponse({'status': 'success'}, status=200)
                    else:
                        messages.success(request, "Data added successfully!")
                        return redirect('show_employee_project')  
                except Exception as e:  
                    if modalfield_value == '1':
                        return JsonResponse({'status': 'error', 'message': f"Internal Server Error: {str(e)}"}, status=400)
                    else:
                        messages.error(request, f"Internal Server Error: {str(e)}")
                        return render(request,'employee_project/add_employee_project.html',{'form':form,'projects':projects,'employees':employees})  
        else:
            error_messages = form.errors.as_json()
            if modalfield_value == '1':
                return JsonResponse({'status': 'error', 'message': f"Form validation failed: {error_messages}"}, status=400)
            else:
                messages.error(request, f"Form validation failed: {error_messages}") 
                return render(request,'employee_project/add_employee_project.html',{'form':form,'projects':projects,'employees':employees})     
    else:  
        form = Employee_projectForm()
        return render(request,'employee_project/add_employee_project.html',{'form':form,'projects':projects,'employees':employees})  
    # return JsonResponse({'status': 'error', 'message': 'Unhandled request method'}, status=400)

@login_required  
@permission_required('employee.view_employee_project', raise_exception=True)  
def show_employee_project(request):  
    employee_projects = Employee_project.objects.filter(status=1)  
    return render(request,"employee_project/show_employee_project.html",{'employee_projects':employee_projects})  

@login_required  
@permission_required('employee.change_employee_project', raise_exception=True)
def e_employee_project(request, id):  
    employee_project = Employee_project.objects.get(id=id)  
    employee_project_data = {
            'id': employee_project.id,
            'project': {
                'id': employee_project.project.id,
                'title': employee_project.project.title,
            },
            'employee': {
                'id': employee_project.employee.id,
                'ename': employee_project.employee.ename,
            },
            'is_key_acc_mgr': employee_project.is_key_acc_mgr,
        }
    projects = list(Project.objects.filter(status=1).values('id', 'title'))
    employees = list(Employee.objects.filter(status=1).values('id', 'ename'))

    data = {
        'employee_project': employee_project_data,
        'projects': projects,
        'employees': employees,
    }
    return JsonResponse({'status': 'success', 'data':data}, status=200)
    # return render(request,'employee_project/e_employee_project.html', {'employee_project':employee_project,'projects':projects,'employees':employees})  

@login_required  
def u_employee_project(request, id):  
    employee_project = Employee_project.objects.get(id=id)  
    form = Employee_projectForm(request.POST, instance = employee_project)  
    employee_projects = Employee_project.objects.filter(project=request.POST.get('project'),employee=request.POST.get('employee'),status=1)  
    if employee_projects.exists():
        return JsonResponse({'status': 'error','message': "This employee is already assigned to the selected project."}, status=402)
    else:
        if form.is_valid():  
            form.save()  
            messages.success(request, "Data Updated successfully!")  
            return JsonResponse({'status': 'success'}, status=200)
            # return redirect("show_employee_project") 
        else:
            error_messages = form.errors.as_json()
            messages.error(request, f"Form validation failed: {error_messages}")   
            return redirect(f'../project_details/{employee_project.project.id}')

@login_required  
@permission_required('employee.delete_employee_project', raise_exception=True)
def d_employee_project(request, id):  
    employee_project = Employee_project.objects.get(id=id)  
    employee_project.status=0  
    employee_project.save()
    messages.success(request, "Data Deleted successfully!")
    return redirect("show_employee_project")

#Generate Report
@login_required 
# @permission_required('employee.add_employee_project', raise_exception=True)
def generate_report(request):  
    if request.method == "POST":    
        # Initialize the queryset
        employee_ids = request.POST.getlist('employees')
        branch_ids = request.POST.getlist('branch')
        department_ids = request.POST.getlist('department')
        fin_years = request.POST.getlist('year')

        # Apply filters based on the input
        where = ''
        years = ''
        sale_year = ''

        # if employee_ids and 'all' not in employee_ids:
        #     where += f' and e.id in ({",".join(employee_ids)})'

        # if branch_ids and 'all' not in branch_ids:
        #     where += f' and e.branch_id in ({",".join(branch_ids)})'

        # if department_ids and 'all' not in department_ids:
        #     where += f' and e.department_id in ({",".join(department_ids)})'

        # if fin_years and 'all' not in fin_years:
        #     years = f'WHERE q.year in ({",".join(fin_years)})'

        cursor1 = connection.cursor()
        # cursor1.execute('''SELECT 
        #             q.year,
        #             CONCAT('[', GROUP_CONCAT(
        #                 CONCAT('{{"quarters":"', q.title, '", "sales":', (
        #                     SELECT CONCAT(
        #                         '[', GROUP_CONCAT(
        #                             CONCAT(
        #                                 '{{"sales_person_id":', e.id,
        #                                 ', "sales_person_name":"', e.ename,
        #                                 '", "joining_date":"', e.date_of_joining,
        #                                 '", "sales_target":', et.sales_target,
        #                                 ', "sales_amount":', IFNULL(s.amount, 0),
        #                                 ', "remaining":', (et.sales_target - IFNULL(s.amount, 0)),
        #                                 ', "percentage":', ROUND((s.amount * 100 / et.sales_target)),
        #                                 ', "status":"', IF(IFNULL(s.amount, 0) < et.sales_target, 'Not Achieved', (IF(IFNULL(s.amount, 0) = et.sales_target, 'Achieved','Above Target'))), '"}}'
        #                             )
        #                             SEPARATOR ','
        #                         ), ']'
        #                     )
        #                     FROM employee_target et
        #                     JOIN employee e ON et.employee_id = e.id
        #                     LEFT JOIN sales s ON et.employee_id = s.sale_person_id AND et.quarter_id = s.quarter_id
        #                     WHERE et.quarter_id = q.id {where1}
        #                 ), '}}')
        #             SEPARATOR ','
        #             ), ']') AS quarter_sales
        #         FROM quarters q
        #         {where2}
        #         GROUP BY q.year
        #         ORDER BY q.year DESC'''.format(
        #                         where1=where,
        #                         where2=years
        #                     ))

        if employee_ids and 'all' not in employee_ids:
            where += f' and e.id in ({",".join(employee_ids)})'

        if branch_ids and 'all' not in branch_ids:
            where += f' and e.branch_id in ({",".join(branch_ids)})'

        if department_ids and 'all' not in department_ids:
            where += f' and e.department_id in ({",".join(department_ids)})'

        if fin_years and 'all' not in fin_years:
            years = f'WHERE employee_target.financial_year in ({",".join(fin_years)})'
            sale_year = f'WHERE YEAR(sales.sale_date) in ({",".join(fin_years)})'

        query= f'''
        SELECT CONCAT('[',
                            GROUP_CONCAT(
                                CONCAT(
                                    '{{"employee_name":"', e.ename, '",',
                                    '"Year":', COALESCE(t.financial_year), ',',
                                    '"q1_target":', COALESCE(t.q1_target, 0), ',',
                                    '"q1_sales":', COALESCE(s.q1_sales, 0), ',',
                                    '"q2_target":', COALESCE(t.q2_target, 0), ',',
                                    '"q2_sales":', COALESCE(s.q2_sales, 0), ',',
                                    '"q3_target":', COALESCE(t.q3_target, 0), ',',
                                    '"q3_sales":', COALESCE(s.q3_sales, 0), ',',
                                    '"q4_target":', COALESCE(t.q4_target, 0), ',',
                                    '"q4_sales":', COALESCE(s.q4_sales, 0), ',',
                                    '"total_year_target":', COALESCE(t.total_target, 0), ',',
                                    '"total_year_sales":', COALESCE(s.total_sales, 0), ',',
                                    '"remaining":', (t.total_target - IFNULL(s.total_sales, 0)), ',',
                                    '"percentage":', ROUND((s.total_sales * 100 / t.total_target)), ',',
                                    '"status":"', 
                                                IF(
                                                    COALESCE(s.total_sales, 0) < COALESCE(t.total_target, 0), 
                                                    'Not Achieved', 
                                                    IF(
                                                        COALESCE(s.total_sales, 0) = COALESCE(t.total_target, 0), 
                                                        'Achieved', 
                                                        'Above Target'
                                                    )
                                                ), 
                                    '"}}'
                                )
                            ),']') AS employee_data
                        FROM 
                            employee e
                        LEFT JOIN (
                            SELECT 
                                employee_id,
                                financial_year,
                                SUM(CASE WHEN quarter_id = 1 THEN sales_target ELSE 0 END) AS q1_target,
                                SUM(CASE WHEN quarter_id = 2 THEN sales_target ELSE 0 END) AS q2_target,
                                SUM(CASE WHEN quarter_id = 3 THEN sales_target ELSE 0 END) AS q3_target,
                                SUM(CASE WHEN quarter_id = 4 THEN sales_target ELSE 0 END) AS q4_target,
                                SUM(sales_target) AS total_target
                            FROM 
                                employee_target
                            {years}
                            GROUP BY 
                                employee_id
                        ) t ON e.id = t.employee_id
                        LEFT JOIN (
                            SELECT 
                                sale_person_id,
                                SUM(CASE WHEN quarter_id = 1 THEN amount ELSE 0 END) AS q1_sales,
                                SUM(CASE WHEN quarter_id = 2 THEN amount ELSE 0 END) AS q2_sales,
                                SUM(CASE WHEN quarter_id = 3 THEN amount ELSE 0 END) AS q3_sales,
                                SUM(CASE WHEN quarter_id = 4 THEN amount ELSE 0 END) AS q4_sales,
                                SUM(amount) AS total_sales
                            FROM 
                                sales
                           {sale_year}
                            GROUP BY 
                                sale_person_id
                        ) s ON e.id = s.sale_person_id
                        WHERE 1=1 {where}
                        LIMIT 0, 25
                        '''
        # Execute the query
        cursor1.execute(query)
        rows2 = cursor1.fetchall()
        # Print raw JSON for debugging
        # for row in rows2:
        #     print('Raw JSON:', row[1])  # Print the JSON string

        # Continue with parsing after confirming the JSON structure
        parsed_data = []

        # for row in rows2:
        #     year = row[0]  # The year value
        #     quarter_sales_json = row[1]  # The JSON string

        #     # Parse the JSON string into a Python object
        #     try:
        #         quarter_sales = json.loads(quarter_sales_json)
        #         parsed_data.append((year, quarter_sales))
        #     except json.JSONDecodeError as e:
        #         print(f"Error decoding JSON for year {year}: {e}")
        #         print(f"Faulty JSON: {quarter_sales_json}")
        for row in rows2:
            year = row[0]  # The year value

            # Parse the JSON string into a Python object
            try:
                quarter_sales = json.loads(year)
                parsed_data.append(quarter_sales)
            except json.JSONDecodeError as e:
                print(f"Error decoding JSON for year {year}: {e}")
        return JsonResponse({'status': 'success', 'final_data': quarter_sales}, status=200)
        # return render(request, 'employee_target/generate_report.html', {'final_data': parsed_data})
    else:  
        regions = Region.objects.filter(status=1).values('id','region_name')
        branches = Branch.objects.filter(status=1).values('id','branch_name')
        employees = Employee.objects.filter(status=1).values('id','ename')
        departs = Department.objects.filter(status=1).values('id','depart_name')
        financial_years = Employee_target.objects.values('financial_year').distinct()
    return render(request,'employee_target/generate_report.html',{'employees':employees,'branches':branches,'departs':departs, 'years':financial_years,'regions':regions})  


def load_employee(request):
    if len(request.GET.getlist('department')) == 0 or request.GET.getlist('department')[0] == 'all' :
        employees = Employee.objects.filter(status=1).order_by('ename')
    else:
        department = request.GET.getlist('department')
        employees = Employee.objects.filter(department_id__in=department,status=1).order_by('ename')
    return JsonResponse(list(employees.values('id', 'ename')), safe=False)

def load_branch(request):
    if len(request.GET.getlist('region')) == 0 or request.GET.getlist('region')[0] == 'all' :
        branch = Branch.objects.filter(status=1).order_by('branch_name')
    else:
        region = request.GET.getlist('region')
        branch = Branch.objects.filter(region_id__in=region,status=1).order_by('branch_name')
    return JsonResponse(list(branch.values('id', 'branch_name')), safe=False)

# Leads
@login_required 
@permission_required('employee.add_leads', raise_exception=True)
def add_leads(request):  
    clients = Client.objects.filter(status=1).values('id','client_name')
    employees = Employee.objects.filter(status=1).values('id','ename')
    if request.method == "POST":  
        form = LeadsForm(request.POST) 
        if form.is_valid():
            try:  
                form.save() 
                messages.success(request, "Data added successfully!") 
                return redirect('show_leads')  
            except Exception as e:  
                messages.error(request, f"Internal Server Error: {str(e)}")
                return render(request,'leads/add_leads.html',{'form':form,'employees':employees, 'clients':clients})  
        else:
            error_messages = form.errors.as_json()
            messages.error(request, f"Form validation failed: {error_messages}")  
            return render(request,'leads/add_leads.html',{'form':form,'employees':employees, 'clients':clients})  
    else:  
        form = LeadsForm()
        return render(request,'leads/add_leads.html',{'form':form,'employees':employees, 'clients':clients})  

@login_required  
@permission_required('employee.view_leads', raise_exception=True)  
def show_leads(request):  
    leads = Leads.objects.filter(status=1) 
    employees = Employee.objects.filter(status=1).values('id','ename')
    years = Quarters.objects.values('year').distinct()
    return render(request,"leads/show_leads.html",{'leads':leads, 'employees':employees,'years':years})  

@login_required  
@permission_required('employee.change_leads', raise_exception=True)
def e_leads(request, id):  
    leads = Leads.objects.get(id=id)  
    employees = Employee.objects.filter(status=1).values('id','ename')
    clients = Client.objects.filter(status=1).values('id','client_name')
    return render(request,'leads/e_leads.html', {'leads':leads,'employees':employees, 'clients':clients})  

@login_required  
def u_leads(request, id):  
    leads = Leads.objects.get(id=id)  
    form = LeadsForm(request.POST, instance = leads)  
    if form.is_valid():  
        form.save() 
        messages.success(request, "Data Updated successfully!")   
        return redirect("show_leads") 
    error_messages = form.errors.as_json()
    messages.error(request, f"Form validation failed: {error_messages}")  
    return render(request, 'leads/e_leads.html', {'leads': leads})  

@login_required  
@permission_required('employee.delete_leads', raise_exception=True)
def d_leads(request, id):  
    leads = Leads.objects.get(id=id)  
    leads.status=0  
    leads.save()
    messages.success(request, "Data Deleted successfully!")
    return redirect("show_leads")

# Sales
@login_required 
@permission_required('employee.add_sales', raise_exception=True)
def add_sales(request):  
    if request.method == "POST":  
        form = SalesForm(request.POST) 
        if form.is_valid():
            try:  
                file_instance=form.save(commit=False)  
                # Current date
                today = datetime.now().date()
                current_month = today.month
                # Query to filter quarters
                quarter = Quarters.objects.get(
                    start_date__month__lte=current_month,
                    end_date__month__gte=current_month
                )
                leads = Leads.objects.get(id=file_instance.lead.id)  
                leads.convert_date = today
                leads.save()
                file_instance.quarter=quarter
                file_instance.sale_date=today
                file_instance.sale_person_id=leads.sale_person_id
                file_instance.save()
                messages.success(request, "Data added successfully!")
                return JsonResponse({'status': 'success'}, status=200)  
            except Exception as e:  
                return JsonResponse({'status': 'Failed','Error': e}, status=400)
        return JsonResponse({'status': 'error', 'message': 'Unhandled request method'}, status=400)
    # Create your views here. 
@login_required    
def dashboard(request):
    today = datetime.now().date()
    # Subquery to filter quarters with the year 2024
    quarters_2024 = Quarters.objects.filter(year=today.year).values('id')
    projects = Project.objects.filter(status=1).count()
    inprogress = Project.objects.filter(status=1,project_status="In Progress").count()
    completed = Project.objects.filter(status=1,project_status="Completed").count()
    cancelled = Project.objects.filter(status=1,project_status="Cancel").count()

    # Main query to sum the amount for each quarter_id
    sales_summary = (
        Sales.objects
        .filter(status=1, quarter_id__in=Subquery(quarters_2024))
        .values('quarter_id')  # Group by quarter_id
        .annotate(total_amount=Sum('amount'))  # Calculate the sum of the amount
    )
    # Extract only the total_amount values into a list
    amount_list = [entry['total_amount'] for entry in sales_summary]

    leads = Leads.objects.filter(status=1, convert_date__isnull=False)

    today2 = timezone.now().date()
  # Calculate the start (Monday) and end (Sunday) of the current week
    start_of_week = today2 - timedelta(days=today2.weekday())  # Monday
    days_of_week = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]

    # Initialize a dictionary to store the counts for each day
    weekly_data_count = []

    # Loop through each day of the current week
    for i in range(7):
        # Calculate the date for the current day
        current_day = start_of_week + timedelta(days=i)
        
        # Fetch data for the specific day
        daily_data_count = Leads.objects.filter(
            status=1,
            convert_date=current_day
        ).count()  # Use .count() to get the number of records for that day

        # Update the dictionary with the count
        weekly_data_count.append(daily_data_count)

    return render(request,"dashboard.html",{'leads':leads, 'quarterly':amount_list, 'days_of_week':days_of_week, 'weekly_data_count':weekly_data_count,'projects':projects,'inprogress':inprogress, 'completed':completed, 'cancelled':cancelled})
    # else:  
    #     form = LeadsForm()
    #     employees = Employee.objects.filter(status=1).values('id','ename')
    # return render(request,'leads/add_leads.html',{'form':form,'employees':employees})  

# Vendor
@login_required 
@permission_required('employee.add_vendor', raise_exception=True)
def add_vendor(request):  
    countries = Country.objects.filter(status=1).values('id','country_name')
    if request.method == "POST":  
        form = VendorForm(request.POST) 
        email = request.POST.get('email')
        phone = request.POST.get('phone')
        vendor = Vendor.objects.filter(Q(email=email) | Q(phone=phone),  status=1)
        if form.is_valid():
            if vendor.exists():
                messages.error(request, "This Vendor Email Address OR Phone Number already exist.")
                return render(request,'vendor/add_vendor.html',{'form':form, 'countries':countries})  
            else:
                try:  
                    form.save()  
                    messages.success(request, "Data added successfully!")
                    return redirect('show_vendor')  
                except Exception as e:  
                    messages.error(request, f"Internal Server Error: {str(e)}")
                    return render(request,'vendor/add_vendor.html',{'form':form, 'countries':countries})
        else:
            error_messages = form.errors.as_json()
            messages.error(request, f"Form validation failed: {error_messages}")
            return render(request,'vendor/add_vendor.html',{'form':form, 'countries':countries})
    else:  
        form = VendorForm()
        return render(request,'vendor/add_vendor.html',{'form':form, 'countries':countries})  

@login_required    
@permission_required('employee.view_vendor', raise_exception=True)
def show_vendor(request):  
    vendors = Vendor.objects.filter(status=1) 
    return render(request,"vendor/show_vendor.html",{'vendors':vendors})  

@login_required  
@permission_required('employee.change_vendor', raise_exception=True)
def e_vendor(request, id):  
    vendor = Vendor.objects.get(id=id)  
    countries = Country.objects.filter(status=1).values('id','country_name')
    return render(request,'vendor/e_vendor.html', {'vendor':vendor, 'countries':countries})  

@login_required  
def u_vendor(request, id):  
    vendor = Vendor.objects.get(id=id)  
    form = VendorForm(request.POST, instance = vendor)
    if form.is_valid():  
        form.save()  
        messages.success(request, "Data Updated successfully!")  
        return redirect("show_vendor") 
    error_messages = form.errors.as_json()
    messages.error(request, f"Form validation failed: {error_messages}")   
    return render(request, 'vendor/e_vendor.html', {'vendor': vendor})  

@login_required  
@permission_required('employee.delete_vendor', raise_exception=True)
def d_vendor(request, id):  
    vendor = Vendor.objects.get(id=id)  
    vendor.status=0  
    vendor.save()
    messages.success(request, "Data Deleted successfully!")
    return redirect("show_vendor")

@login_required 
def project_summary(request):  
    if request.method == "POST": 
        project = Project.objects.get(id=request.POST.get('project'))
        employee_projects = Employee_project.objects.filter(project=request.POST.get('project'),status=1)
        project_documents= Project_document.objects.filter(project=request.POST.get('project'),status=1)
        bgs= Bank_guaranty.objects.filter(project=request.POST.get('project'),status=1)
         # Use a list comprehension to include related fields
        employee_projects_data = [
            {
                **model_to_dict(emp_proj),  # Base fields from the model
                'employee_name': emp_proj.employee.ename,  # Add the related field explicitly
            }
            for emp_proj in employee_projects
        ]
        manager = None  # Default to None if no manager is found
        for emp_proj in employee_projects:
            if emp_proj.is_key_acc_mgr == 1:  # Check if the employee is a key account manager
                manager = {
                    'manager_name': emp_proj.employee.ename,
                    'manager_id': emp_proj.employee.id,  # Optional: Include additional details if needed
            }
            break  # Exit the loop once the manager is found
        project_document_data = [
            {
                **model_to_dict(doc_proj),  # Base fields from the model
                'doc_type': doc_proj.document_type.title  # Add the related field explicitly
            }
            for doc_proj in project_documents
        ]
        bgs_data = [
            {
                **model_to_dict(bg_proj),  # Base fields from the model
                'bank': bg_proj.bank.bank_name  # Add the related field explicitly
            }
            for bg_proj in bgs
        ]
        query = Journal_entry.objects.filter(project=request.POST.get('project'),status=1)
        total = sum([item.total_amount for item in query])
        bg_total = sum([bg.bg_amount for bg in bgs])
        perc = total/project.amount * 100 
         # Return success response
        project_data = {
            'project':model_to_dict(project),
            'client':model_to_dict(project.client),
            'employee_projects': employee_projects_data,
            'project_documents': project_document_data,
            'bank_guarantees': bgs_data,
            'expense' : total,
            'perc' : perc,
            'manager':manager,
            'bg_total':bg_total
        }
        final=dict(project_data)
        return JsonResponse({'status': 'success', 'project': final}, status=200)
    else:  
        projects = Project.objects.filter(status=1).values('id','title')
    return render(request,'employee_target/summary.html',{'projects':projects})  