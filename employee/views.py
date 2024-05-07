from django.http import HttpResponse
from django.shortcuts import get_object_or_404, render, redirect  
from employee.forms import EmployeeForm, DepartmentForm, DesignationForm, RegionForm, EducationForm, Employment_RecordForm, CertificationsForm, SkillsForm, CompanyForm, Project_typeForm, ProjectForm, ModuleForm, MainmenuForm, SubmenuForm, RoleForm, Company_moduleForm, Role_permissionForm, CV_templateForm, Template_columnForm, BankForm, Bank_guarantyForm, Liquidity_damagesForm, Insurance_typeForm, Insurance_detailForm, CountryForm, ZoneForm, AreaForm, BranchForm
from employee.models import Employee, Department, Designation, Region, Education, Employment_Record, Certifications, Skills, Company, Module, Mainmenu, Submenu, Role, Company_module, Role_permission, CV_template, Template_column, Project_type, Project, Bank, Bank_guaranty, Liquidity_damages, Insurance_type, Insurance_detail, Country, Zone, Area, Branch
from django.contrib.auth.decorators import login_required, permission_required
import re
from django.db import connection
import json
import re
import ast
from xhtml2pdf import pisa
import io as BytesIO

from django.template.loader import get_template
from django.template import Context

# Create your views here. 
@login_required    
def dashboard(request):   
    return render(request,"dashboard.html") 

# Employee
@login_required
@permission_required('employee.add_employee', raise_exception=True)  
def emp(request):
    if request.method == "POST":  
        form = EmployeeForm(request.POST)
        print(form)  
        # if form.is_valid(): 
        try:  
            form.save()  
            return redirect('view_employee')  
        except Exception as e:  
            print(e)    
            pass  
    else:  
        print("else")
        # form = EmployeeForm()
        departs = Department.objects.filter(status=1).values('id','depart_name')
        designs = Designation.objects.filter(status=1).values('id','design_name')
        branches = Branch.objects.filter(status=1).values('id','branch_name')

    return render(request,'employee/index.html',{'departs':departs,'designs':designs,'branches':branches})  
@login_required  
@permission_required('employee.view_employee', raise_exception=True)  
def show(request):  
    employees = Employee.objects.all()
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
    form = EmployeeForm(request.POST, instance = employee)  
    if form.is_valid():  
        form.save()  
        return redirect("view_employee")  
    return render(request, 'employee/edit.html', {'employee': employee})  

@login_required  
@permission_required('employee.delete_employee', raise_exception=True)  
def destroy(request, id):  
    employee = Employee.objects.get(id=id)  
    employee.delete()  
    return redirect("view_employee")  


# Department
@login_required 
@permission_required('employee.add_department', raise_exception=True)  
def add_depart(request):  
    if request.method == "POST":  
        form = DepartmentForm(request.POST) 
        if form.is_valid():
            try:  
                form.save()  
                return redirect('show_depart')  
            except Exception as e:  
                print(e)  
                pass  
    else:  
        form = DepartmentForm()  
    return render(request,'department/add_depart.html',{'form':form})  

@login_required  
@permission_required('employee.view_department', raise_exception=True)   
def show_depart(request):  
    departments = Department.objects.all()  
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
    if form.is_valid():  
        form.save()  
        return redirect("show_depart")  
    return render(request, 'department/e_depart.html', {'department': department})  

@login_required  
@permission_required('employee.delete_department', raise_exception=True) 
def d_depart(request, id):  
    department = Department.objects.get(id=id)  
    department.delete()  
    return redirect("show_depart")  


# Designation
@login_required 
@permission_required('employee.add_designation', raise_exception=True) 
def add_design(request):  
    if request.method == "POST":  
        form = DesignationForm(request.POST) 
        if form.is_valid():
            try:  
                form.save()  
                return redirect('show_design')  
            except Exception as e:  
                print(e)  
                pass  
    else:  
        form = DesignationForm()  
    return render(request,'designation/add_design.html',{'form':form})  

@login_required  
@permission_required('employee.view_designation', raise_exception=True)   
def show_design(request):  
    designations = Designation.objects.all()  
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
    if form.is_valid():  
        form.save()  
        return redirect("show_design")  
    return render(request, 'designation/e_design.html', {'designation': designation})  

@login_required  
@permission_required('employee.delete_designation', raise_exception=True) 
def d_design(request, id):  
    designation = Designation.objects.get(id=id)  
    designation.delete()  
    return redirect("show_design")  


# Region
@login_required 
@permission_required('employee.add_region', raise_exception=True) 
def add_region(request):  
    if request.method == "POST":  
        form = RegionForm(request.POST) 
        if form.is_valid():
            try:  
                form.save()  
                return redirect('show_region')  
            except Exception as e:  
                print(e)  
                pass  
    else:  
        form = RegionForm()  
    return render(request,'region/add_region.html',{'form':form})  

@login_required    
@permission_required('employee.view_region', raise_exception=True)
def show_region(request):  
    regions = Region.objects.all()  
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
    if form.is_valid():  
        form.save()  
        return redirect("show_region")  
    return render(request, 'region/e_region.html', {'region': region})  

@login_required  
@permission_required('employee.delete_region', raise_exception=True)
def d_region(request, id):  
    region = Region.objects.get(id=id)  
    region.delete()  
    return redirect("show_region") 


# Education
@login_required 
@permission_required('employee.add_education', raise_exception=True)
def add_education(request):  
    if request.method == "POST":  
        form = EducationForm(request.POST) 
        if form.is_valid():
            try:  
                form.save()  
                return redirect('show_education')  
            except Exception as e:  
                print(e)  
                pass  
    else:  
        form = EducationForm()  
        employees = Employee.objects.filter(status=1).values('id','ename')
    return render(request,'education/add_education.html',{'form':form,'employees':employees})  

@login_required    
@permission_required('employee.view_education', raise_exception=True)
def show_education(request):  
    educations = Education.objects.all()  
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
    form = EducationForm(request.POST, instance = education)  
    if form.is_valid():  
        form.save()  
        return redirect("show_education")  
    return render(request, 'education/e_education.html', {'education': education})  

@login_required  
@permission_required('employee.delete_education', raise_exception=True)
def d_education(request, id):  
    education = Education.objects.get(id=id)  
    education.delete()  
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
                return redirect('show_employement_record')  
            except Exception as e:  
                print(e)  
                pass  
    else:  
        form = Employment_RecordForm()
        employees = Employee.objects.filter(status=1).values('id','ename')  
    return render(request,'employement_record/add_employement_record.html',{'form':form,'employees':employees})  

@login_required 
@permission_required('employee.view_employement_record', raise_exception=True)   
def show_employement_Record(request):  
    employement_Records = Employment_Record.objects.all()  
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
        return redirect("show_employement_record")  
    return render(request, 'employement_record/e_employement_record.html', {'employement_Record': employement_Record})  

@login_required  
@permission_required('employee.delete_employement_record', raise_exception=True)
def d_employement_Record(request, id):  
    employement_Record = Employment_Record.objects.get(id=id)  
    employement_Record.delete()  
    return redirect("show_employement_record") 

 
# Certifications
@login_required 
@permission_required('employee.add_certification', raise_exception=True)
def add_certification(request):  
    if request.method == "POST":  
        form = CertificationsForm(request.POST) 
        if form.is_valid():
            try:  
                form.save()  
                return redirect('show_certification')  
            except Exception as e:  
                print(e)  
                pass  
    else:  
        form = CertificationsForm()  
        employees = Employee.objects.filter(status=1).values('id','ename')
    return render(request,'certification/add_certification.html',{'form':form,'employees':employees})  

@login_required  
@permission_required('employee.view_certification', raise_exception=True)  
def show_certification(request):  
    certifications = Certifications.objects.all()  
    return render(request,"certification/show_certification.html",{'certifications':certifications})  

@login_required  
@permission_required('employee.change_certification', raise_exception=True)
def e_certification(request, id):  
    certification = Certifications.objects.get(id=id)  
    employees = Employee.objects.filter(status=1).values('id','ename')
    return render(request,'certification/e_certification.html', {'certification':certification,'employees':employees})  

@login_required  
def u_certification(request, id):  
    certification = Certifications.objects.get(id=id)  
    form = CertificationsForm(request.POST, instance = certification)  
    if form.is_valid():  
        form.save()  
        return redirect("show_certification")  
    return render(request, 'certification/e_certification.html', {'certification': certification})  

@login_required 
@permission_required('employee.delete_certification', raise_exception=True) 
def d_certification(request, id):  
    certification = Certifications.objects.get(id=id)  
    certification.delete()  
    return redirect("show_certification") 


# Skills
@login_required 
@permission_required('employee.add_skill', raise_exception=True)
def add_skill(request):  
    if request.method == "POST":  
        form = SkillsForm(request.POST) 
        if form.is_valid():
            try:  
                form.save()  
                return redirect('show_skill')  
            except Exception as e:  
                print(e)  
                pass  
    else:  
        form = SkillsForm()  
        employees = Employee.objects.filter(status=1).values('id','ename')
    return render(request,'skill/add_skill.html',{'form':form,'employees':employees})  

@login_required  
@permission_required('employee.view_skill', raise_exception=True)  
def show_skill(request):  
    skills = Skills.objects.all()  
    return render(request,"skill/show_skill.html",{'skills':skills})  

@login_required  
@permission_required('employee.change_skill', raise_exception=True)
def e_skill(request, id):  
    skill = Skills.objects.get(id=id)  
    employees = Employee.objects.filter(status=1).values('id','ename')
    return render(request,'skill/e_skill.html', {'skill':skill,'employees':employees})  

@login_required  
def u_skill(request, id):  
    skill = Skills.objects.get(id=id)  
    form = SkillsForm(request.POST, instance = skill)  
    if form.is_valid():  
        form.save()  
        return redirect("show_skill")  
    return render(request, 'skill/e_skill.html', {'skill': skill})  

@login_required  
@permission_required('employee.delete_skill', raise_exception=True)
def d_skill(request, id):  
    skill = Skills.objects.get(id=id)  
    skill.delete()  
    return redirect("show_skill") 


# Company
@login_required 
def add_company(request):  
    if request.method == "POST":  
        form = CompanyForm(request.POST) 
        if form.is_valid():
            try:  
                form.save()  
                return redirect('show_company')  
            except Exception as e:  
                print(e)  
                pass  
    else:  
        form = CompanyForm()  
    return render(request,'company/add_company.html',{'form':form})  

@login_required    
def show_company(request):  
    company = Company.objects.all()  
    return render(request,"company/show_company.html",{'company':company})  

@login_required  
def e_company(request, id):  
    company = Company.objects.get(id=id)  
    return render(request,'company/e_company.html', {'company':company})  

@login_required  
def u_company(request, id):  
    company = Company.objects.get(id=id)  
    form = CompanyForm(request.POST, instance = company)  
    if form.is_valid():  
        form.save()  
        return redirect("show_company")  
    return render(request, 'company/e_company.html', {'company': company})  

@login_required  
def d_company(request, id):  
    company = Company.objects.get(id=id)  
    company.delete()  
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
                print(e)  
                pass  
    else:  
        form = ModuleForm()  
    return render(request,'module/add_module.html',{'form':form})  

@login_required    
def show_module(request):  
    modules = Module.objects.all()  
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
    module.delete()  
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
                print(e)  
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
    mainmenu.delete()  
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
                print(e)  
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
    submenu.delete()  
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
                print(e)  
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
    role.delete()  
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
                print(e)  
                pass  
    else:  
        form = Company_moduleForm()  
    return render(request,'company_module/add_company_module.html',{'form':form})  

@login_required    
def show_company_module(request):  
    company_modules = Company_module.objects.all()  
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
    company_module.delete()  
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
                print(e)  
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
    role_permission.delete()  
    return redirect("show_role_permission") 


# CV_template
@login_required 
def add_cv_template(request):  
    if request.method == "POST":  
        form = CV_templateForm(request.POST) 
        print(form)
        if form.is_valid():
            try:  
                form.save()  
                return redirect('show_cv_template')  
            except Exception as e:  
                print(e)  
                pass  
    else:  
        form = CV_templateForm()
        columns = Template_column.objects.filter(status=1).values('id','title','table_name','field_name')  
    return render(request,'cv_template/add_cv_template.html',{'form':form,'columns':columns})  

@login_required    
def show_cv_template(request):  
    cv_templates = CV_template.objects.all()  
    return render(request,"cv_template/show_cv_template.html",{'cv_templates':cv_templates})  

@login_required  
def e_cv_template(request, id):  
    cv_template = CV_template.objects.get(id=id)  
    return render(request,'cv_template/e_cv_template.html', {'cv_template':cv_template})  

@login_required  
def u_cv_template(request, id):  
    cv_template = CV_template.objects.get(id=id)  
    form = CV_templateForm(request.POST, instance = cv_template)  
    if form.is_valid():  
        form.save()  
        return redirect("show_cv_template")  
    return render(request, 'cv_template/e_cv_template.html', {'cv_template': cv_template})  

@login_required  
def d_cv_template(request, id):  
    cv_template = CV_template.objects.get(id=id)  
    cv_template.delete()  
    return redirect("show_cv_template") 




@login_required    
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
    # print(rows2)
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
       
    # print(stg_query)
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
    # print(json_objs)
    final = []
    stng =''
    employee_dict = []
    
    for employees in json_objs:
        _template = template.templete_code
        # print(_template,'1st-----')
        # field = "{{name}}"
        # print(employees["name"])
        
        # _template = _template.replace(field,str(employees["name"])) 
        # print(_template,'2nd---')
        # _template=''
        # print(_template,'last---')


        # print(_template.templete_code)
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
                # print(field)
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
                    # print(keysList)
                    for _key in keysList:
                        _field = "{{" + str(_key) + "}}"
                        # print(_field)    
                        tbl = ""
                        for items in _list:
                            # print(items)
                            tbl += "<tr>"
                            for sub_item in items:
                                tbl += "<td>" + str(items[sub_item]) + "</td>"
                            tbl += "</tr>"
                        tbl += "</table>"
                    _template = _template.replace(_field,tbl)
            else:
                _template = _template.replace(field,str(employees[key])) 
        stng+=_template
    print(stng)

    employee = Employee.objects.get(id=request.POST.get('employee'))
    columns = Template_column.objects.all()  
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

 
def print(request):
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
        print(form)
        if form.is_valid():
            try:  
                form.save()  
                return redirect('show_template_column')  
            except Exception as e:  
                print(e)  
                pass  
    else:  
        form = Template_columnForm()  
    return render(request,'template_column/add_template_column.html',{'form':form})  

@login_required    
def show_template_column(request):  
    template_columns = Template_column.objects.all()  
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
    template_column.delete()  
    return redirect("show_template_column") 


# Company
@login_required 
def add_company(request):  
    if request.method == "POST":  
        form = CompanyForm(request.POST) 
        print(form)
        if form.is_valid():
            try:  
                form.save()  
                return redirect('show_company')  
            except Exception as e:  
                print(e)  
                pass  
    else:  
        form = CompanyForm()  
    return render(request,'company/add_company.html',{'form':form})  

@login_required    
def show_company(request):  
    company = Company.objects.all()  
    return render(request,"company/show_company.html",{'company':company})  

@login_required  
def e_company(request, id):  
    company = Company.objects.get(id=id)  
    return render(request,'company/e_company.html', {'company':company})  

@login_required  
def u_company(request, id):  
    company = Company.objects.get(id=id)  
    form = CompanyForm(request.POST, instance = company)  
    if form.is_valid():  
        form.save()  
        return redirect("show_company")  
    return render(request, 'company/e_company.html', {'company': company})  

@login_required  
def d_company(request, id):  
    company = Company.objects.get(id=id)  
    company.delete()  
    return redirect("show_company") 

# Project_type
@login_required 
def add_project_type(request):  
    if request.method == "POST":  
        form = Project_typeForm(request.POST) 
        print(form)
        if form.is_valid():
            try:  
                form.save()  
                return redirect('show_project_type')  
            except Exception as e:  
                print(e)  
                pass  
    else:  
        form = Project_typeForm()  
    return render(request,'project_type/add_project_type.html',{'form':form})  

@login_required    
def show_project_type(request):  
    project_types = Project_type.objects.all()  
    return render(request,"project_type/show_project_type.html",{'project_types':project_types})  

@login_required  
def e_project_type(request, id):  
    project_type = Project_type.objects.get(id=id)  
    return render(request,'project_type/e_project_type.html', {'project_type':project_type})  

@login_required  
def u_project_type(request, id):  
    project_type = Project_type.objects.get(id=id)  
    form = Project_typeForm(request.POST, instance = project_type)  
    if form.is_valid():  
        form.save()  
        return redirect("show_project_type")  
    return render(request, 'project_type/e_project_type.html', {'project_type': project_type})  

@login_required  
def d_project_type(request, id):  
    project_type = Project_type.objects.get(id=id)  
    project_type.delete()  
    return redirect("show_project_type")

# Project
@login_required 
def add_project(request):  
    if request.method == "POST":  
        form = ProjectForm(request.POST) 
        print(form)
        if form.is_valid():
            try:  
                form.save()  
                return redirect('show_project')  
            except Exception as e:  
                print(e)  
                pass  
    else:  
        form = ProjectForm()  
        branches = Branch.objects.filter(status=1).values('id','branch_name')
        project_types = Project_type.objects.filter(status=1).values('id','type_name')
    return render(request,'project/add_project.html',{'form':form, 'branches':branches, 'project_types':project_types})  

@login_required    
def show_project(request):  
    projects = Project.objects.all()  
    return render(request,"project/show_project.html",{'projects':projects})  

@login_required  
def e_project(request, id):  
    project = Project.objects.get(id=id)  
    branches = Branch.objects.filter(status=1).values('id','branch_name')
    project_types = Project_type.objects.filter(status=1).values('id','type_name')
    return render(request,'project/e_project.html', {'project':project, 'branches':branches, 'project_types':project_types})  

@login_required  
def u_project(request, id):  
    project = Project.objects.get(id=id)  
    form = ProjectForm(request.POST, instance = project)  
    if form.is_valid():  
        form.save()  
        return redirect("show_project")  
    return render(request, 'project/e_project.html', {'project': project})  

@login_required  
def d_project(request, id):  
    project = Project.objects.get(id=id)  
    project.delete()  
    return redirect("show_project")


# Bank
@login_required 
def add_bank(request): 
    print('in function.....') 
    if request.method == "POST":  
        form = BankForm(request.POST) 
        print(form)
        if form.is_valid():
            try:  
                form.save()  
                return redirect('show_bank')  
            except Exception as e:  
                print(e)  
                pass  
    else:  
        form = BankForm() 
    return render(request,'bank/add_bank.html',{'form':form})  

@login_required    
def show_bank(request):  
    banks = Bank.objects.all()  
    return render(request,"bank/show_bank.html",{'banks':banks})  

@login_required  
def e_bank(request, id):  
    bank = Bank.objects.get(id=id) 
    return render(request,'bank/e_bank.html', {'bank':bank})  

@login_required  
def u_bank(request, id):  
    bank = Bank.objects.get(id=id)  
    form = BankForm(request.POST, instance = bank)  
    if form.is_valid():  
        form.save()  
        return redirect("show_bank")  
    return render(request, 'bank/e_bank.html', {'bank': bank})  

@login_required  
def d_bank(request, id):  
    bank = Bank.objects.get(id=id)  
    bank.delete()  
    return redirect("show_bank")

# Bank_guaranty
@login_required 
def add_bank_guaranty(request):  
    if request.method == "POST":  
        form = Bank_guarantyForm(request.POST) 
        print(form)
        if form.is_valid():
            try:  
                form.save()  
                return redirect('show_bank_guaranty')  
            except Exception as e:  
                print(e)  
                pass  
    else:  
        form = Bank_guarantyForm()  
        projects = Project.objects.filter(status=1).values('id','title')
        banks = Bank.objects.filter(status=1).values('id','bank_name')
    return render(request,'bank_guaranty/add_bank_guaranty.html',{'form':form,'projects':projects,'banks':banks})  

@login_required    
def show_bank_guaranty(request):  
    bank_guaranties = Bank_guaranty.objects.all()  
    return render(request,"bank_guaranty/show_bank_guaranty.html",{'bank_guaranties':bank_guaranties})  

@login_required  
def e_bank_guaranty(request, id):  
    bank_guaranty = Bank_guaranty.objects.get(id=id) 
    projects = Project.objects.filter(status=1).values('id','title')
    banks = Bank.objects.filter(status=1).values('id','bank_name')
    return render(request,'bank_guaranty/e_bank_guaranty.html', {'bank_guaranty':bank_guaranty,'projects':projects,'banks':banks})  

@login_required  
def u_bank_guaranty(request, id):  
    bank_guaranty = Bank_guaranty.objects.get(id=id)  
    form = Bank_guarantyForm(request.POST, instance = bank_guaranty)  
    if form.is_valid():  
        form.save()  
        return redirect("show_bank_guaranty")  
    return render(request, 'bank_guaranty/e_bank_guaranty.html', {'bank_guaranty': bank_guaranty})  

@login_required  
def d_bank_guaranty(request, id):  
    bank_guaranty = Bank_guaranty.objects.get(id=id)  
    bank_guaranty.delete()  
    return redirect("show_bank_guaranty")

# Liquidity_damages
@login_required 
def add_liquidity_damages(request):  
    if request.method == "POST":  
        form = Liquidity_damagesForm(request.POST) 
        print(form)
        if form.is_valid():
            try:  
                form.save()  
                return redirect('show_liquidity_damages')  
            except Exception as e:  
                print(e)  
                pass  
    else:  
        form = Liquidity_damagesForm()
        projects = Project.objects.filter(status=1).values('id','title')  
    return render(request,'liquidity_damages/add_liquidity_damages.html',{'form':form,'projects':projects})  

@login_required    
def show_liquidity_damages(request):  
    liquidity_damages = Liquidity_damages.objects.all()  
    return render(request,"liquidity_damages/show_liquidity_damages.html",{'liquidity_damages':liquidity_damages})  

@login_required  
def e_liquidity_damages(request, id):  
    liquidity_damages = Liquidity_damages.objects.get(id=id)
    projects = Project.objects.filter(status=1).values('id','title') 
    return render(request,'liquidity_damages/e_liquidity_damages.html', {'liquidity_damages':liquidity_damages,'projects':projects})  

@login_required  
def u_liquidity_damages(request, id):  
    liquidity_damages = Liquidity_damages.objects.get(id=id)  
    form = Liquidity_damagesForm(request.POST, instance = liquidity_damages)  
    if form.is_valid():  
        form.save()  
        return redirect("show_liquidity_damages")  
    return render(request, 'liquidity_damages/e_liquidity_damages.html', {'liquidity_damages': liquidity_damages})  

@login_required  
def d_liquidity_damages(request, id):  
    liquidity_damages = Liquidity_damages.objects.get(id=id)  
    liquidity_damages.delete()  
    return redirect("show_liquidity_damages")

# Insurance_type
@login_required 
def add_insurance_type(request):  
    if request.method == "POST":  
        form = Insurance_typeForm(request.POST) 
        print(form)
        if form.is_valid():
            try:  
                form.save()  
                return redirect('show_insurance_type')  
            except Exception as e:  
                print(e)  
                pass  
    else:  
        form = Insurance_typeForm()  
    return render(request,'insurance_type/add_insurance_type.html',{'form':form})  

@login_required    
def show_insurance_type(request):  
    insurance_type = Insurance_type.objects.all()  
    return render(request,"insurance_type/show_insurance_type.html",{'insurance_type':insurance_type})  

@login_required  
def e_insurance_type(request, id):  
    insurance_type = Insurance_type.objects.get(id=id) 
    return render(request,'insurance_type/e_insurance_type.html', {'insurance_type':insurance_type})  

@login_required  
def u_insurance_type(request, id):  
    insurance_type = Insurance_type.objects.get(id=id)  
    form = Insurance_typeForm(request.POST, instance = insurance_type)  
    if form.is_valid():  
        form.save()  
        return redirect("show_insurance_type")  
    return render(request, 'insurance_type/e_insurance_type.html', {'insurance_type': insurance_type})  

@login_required  
def d_insurance_type(request, id):  
    insurance_type = Insurance_type.objects.get(id=id)  
    insurance_type.delete()  
    return redirect("show_insurance_type")


# Insurance_detail
@login_required 
def add_insurance_detail(request):  
    if request.method == "POST":  
        form = Insurance_detailForm(request.POST) 
        print(form)
        if form.is_valid():
            try:  
                form.save()  
                return redirect('show_insurance_detail')  
            except Exception as e:  
                print(e)  
                pass  
    else:  
        form = Insurance_detailForm()
        projects = Project.objects.filter(status=1).values('id','title') 
        insurance_types = Insurance_type.objects.filter(status=1).values('id','type_name') 
    return render(request,'insurance_detail/add_insurance_detail.html',{'form':form,'projects':projects,'insurance_types':insurance_types})  

@login_required    
def show_insurance_detail(request):  
    insurance_detail = Insurance_detail.objects.all()  
    return render(request,"insurance_detail/show_insurance_detail.html",{'insurance_detail':insurance_detail})  

@login_required  
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
        return redirect("show_insurance_detail")  
    return render(request, 'insurance_detail/e_insurance_detail.html', {'insurance_detail': insurance_detail})  

@login_required  
def d_insurance_detail(request, id):  
    insurance_detail = Insurance_detail.objects.get(id=id)  
    insurance_detail.delete()  
    return redirect("show_insurance_detail")

# Country
@login_required 
def add_country(request):  
    if request.method == "POST":  
        form = CountryForm(request.POST) 
        print(form)
        if form.is_valid():
            try:  
                form.save()  
                return redirect('show_country')  
            except Exception as e:  
                print(e)  
                pass  
    else:  
        form = CountryForm()  
    return render(request,'country/add_country.html',{'form':form})  

@login_required    
def show_country(request):  
    countries = Country.objects.all()  
    return render(request,"country/show_country.html",{'countries':countries})  

@login_required  
def e_country(request, id):  
    country = Country.objects.get(id=id)
    return render(request,'country/e_country.html', {'country':country})  

@login_required  
def u_country(request, id):  
    country = Country.objects.get(id=id)  
    form = CountryForm(request.POST, instance = country)  
    if form.is_valid():  
        form.save()  
        return redirect("show_country")  
    return render(request, 'country/e_country.html', {'country': country})  

@login_required  
def d_country(request, id):  
    country = Country.objects.get(id=id)  
    country.delete()  
    return redirect("show_country")

# Zone
@login_required 
def add_zone(request):  
    if request.method == "POST":  
        form = ZoneForm(request.POST) 
        print(form)
        if form.is_valid():
            try:  
                form.save()  
                return redirect('show_zone')  
            except Exception as e:  
                print(e)  
                pass  
    else:  
        form = ZoneForm()  
    return render(request,'zone/add_zone.html',{'form':form})  

@login_required    
def show_zone(request):  
    zones = Zone.objects.all()  
    return render(request,"zone/show_zone.html",{'zones':zones})  

@login_required  
def e_zone(request, id):  
    zone = Zone.objects.get(id=id)  
    return render(request,'zone/e_zone.html', {'zone':zone})  

@login_required  
def u_zone(request, id):  
    zone = Zone.objects.get(id=id)  
    form = ZoneForm(request.POST, instance = zone)  
    if form.is_valid():  
        form.save()  
        return redirect("show_zone")  
    return render(request, 'zone/e_zone.html', {'zone': zone})  

@login_required  
def d_zone(request, id):  
    zone = Zone.objects.get(id=id)  
    zone.delete()  
    return redirect("show_zone")

# Area
@login_required 
def add_area(request):  
    if request.method == "POST":  
        form = AreaForm(request.POST) 
        print(form)
        if form.is_valid():
            try:  
                form.save()  
                return redirect('show_area')  
            except Exception as e:  
                print(e)  
                pass  
    else:  
        form = AreaForm()  
    return render(request,'area/add_area.html',{'form':form})  

@login_required    
def show_area(request):  
    areas = Area.objects.all()  
    return render(request,"area/show_area.html",{'areas':areas})  

@login_required  
def e_area(request, id):  
    area = Area.objects.get(id=id)  
    return render(request,'area/e_area.html', {'area':area})  

@login_required  
def u_area(request, id):  
    area = Area.objects.get(id=id)  
    form = AreaForm(request.POST, instance = area)  
    if form.is_valid():  
        form.save()  
        return redirect("show_area")  
    return render(request, 'area/e_area.html', {'area': area})  

@login_required  
def d_area(request, id):  
    area = Area.objects.get(id=id)  
    area.delete()  
    return redirect("show_area")

# Branch
@login_required 
def add_branch(request):  
    if request.method == "POST":  
        form = BranchForm(request.POST) 
        print(form)
        if form.is_valid():
            try:  
                form.save()  
                return redirect('show_branch')  
            except Exception as e:  
                print(e)  
                pass  
    else:  
        form = BranchForm()  
        companies = Company.objects.filter(status=1).values('id','comp_name')
        countries = Country.objects.filter(status=1).values('id','country_name')
        zones = Zone.objects.filter(status=1).values('id','zone_name')
        regions = Region.objects.filter(status=1).values('id','region_name')
        areas = Area.objects.filter(status=1).values('id','area_name')
    return render(request,'branch/add_branch.html',{'form':form, 'companies':companies, 'countries':countries, 'zones':zones, 'regions':regions, 'areas':areas})  

@login_required    
def show_branch(request):  
    branches = Branch.objects.all()  
    return render(request,"branch/show_branch.html",{'branches':branches})  

@login_required  
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
        return redirect("show_branch")  
    return render(request, 'branch/e_branch.html', {'branch': branch})  

@login_required  
def d_branch(request, id):  
    branch = Branch.objects.get(id=id)  
    branch.delete()  
    return redirect("show_branch")

# Module
@login_required 
def add_module(request):  
    if request.method == "POST":  
        form = ModuleForm(request.POST) 
        print(form)
        if form.is_valid():
            try:  
                form.save()  
                return redirect('show_module')  
            except Exception as e:  
                print(e)  
                pass  
    else:  
        form = ModuleForm()  
    return render(request,'module/add_module.html',{'form':form})  

@login_required    
def show_module(request):  
    modules = Module.objects.all()  
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
    module.delete()  
    return redirect("show_module") 


#     select json_array(json_object(
#   'id',e.id 
#  ,'name',e.ename
#  ,'education',json_array(
#                      (select GROUP_CONCAT(
#                                  json_object('id',ed.id,'degree',ed.degree_name,'institue',ed.institute)
#                              )   
#                       from education ed 
#                       where ed.employee_id = e.id))
 

# ,'skills',json_array(
#                      (select GROUP_CONCAT(
#                                  json_object('id',s.id,'skill',s.skill_name)
#                              )   
#                       from skills s 
#                       where s.employee_id = e.id))
# ,'certifications',json_array(
#                      (select GROUP_CONCAT(
#                                  json_object('id',c.id,'certification',c.certification_name)
#                              )   
#                       from certifications c 
#                       where c.employee_id = e.id))   
# ,'employment_record',json_array(
#                      (select GROUP_CONCAT(
#                                  json_object('id',er.id,'organization_name',er.organization_name,'position',er.position,'from',er.from_date,'to',er.to_date,'country',er.country)
#                              )   
#                       from employement_record er 
#                       where er.employee_id = e.id))  
#                    ))                       
#  from employee e




# select e.id 
#     ,e.ename as name
#     ,e.eemail as email
#     , e.econtact as contact
#     ,(select GROUP_CONCAT(json_object('id',ed.id,'degree',ed.degree_name,'institute',ed.institute))  from education ed
#     where ed.employee_id=e.id) as education
#     ,(select GROUP_CONCAT(json_object('id',s.id,'skill',s.skill_name)) from skills s where s.employee_id = e.id) as skills
#     ,(select GROUP_CONCAT(json_object('id',c.id,'certification',c.certification_name)) from certifications c where c.employee_id = e.id) as certifications
#     ,(select GROUP_CONCAT(json_object('id',er.id,'organization_name',er.organization_name,'position',er.position,'from',er.from_date,'to',er.to_date,'country',er.country)) from employement_record er where er.employee_id = e.id) as employment_record
#     from employee e