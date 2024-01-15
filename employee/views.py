from django.shortcuts import render, redirect  
from employee.forms import EmployeeForm, DepartmentForm, DesignationForm, RegionForm, EducationForm, Employement_RecordForm, CertificationsForm, SkillsForm
from employee.models import Employee, Department, Designation, Region, Education, Employement_Record, Certifications, Skills
from django.contrib.auth.decorators import login_required

# Create your views here. 
# Employee
@login_required 
def emp(request):  
    if request.method == "POST":  
        form = EmployeeForm(request.POST)  
        if form.is_valid():  
            try:  
                form.save()  
                return redirect('show')  
            except Exception as e:  
                print(e)    
                pass  
    else:  
        form = EmployeeForm()  
    return render(request,'employee/index.html',{'form':form})  

@login_required    
def show(request):  
    employees = Employee.objects.all()  
    return render(request,"employee/show.html",{'employees':employees})  

@login_required  
def edit(request, id):  
    employee = Employee.objects.get(id=id)  
    return render(request,'employee/edit.html', {'employee':employee})  

@login_required  
def update(request, id):  
    employee = Employee.objects.get(id=id)  
    form = EmployeeForm(request.POST, instance = employee)  
    if form.is_valid():  
        form.save()  
        return redirect("show")  
    return render(request, 'employee/edit.html', {'employee': employee})  

@login_required  
def destroy(request, id):  
    employee = Employee.objects.get(id=id)  
    employee.delete()  
    return redirect("show")  


# Department
@login_required 
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
def show_depart(request):  
    departments = Department.objects.all()  
    return render(request,"department/show_depart.html",{'departments':departments})  

@login_required  
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
def d_depart(request, id):  
    department = Department.objects.get(id=id)  
    department.delete()  
    return redirect("show_depart")  


# Designation
@login_required 
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
def show_design(request):  
    designations = Designation.objects.all()  
    return render(request,"designation/show_design.html",{'designations':designations})  

@login_required  
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
def d_design(request, id):  
    designation = Designation.objects.get(id=id)  
    designation.delete()  
    return redirect("show_design")  


# Region
@login_required 
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
def show_region(request):  
    regions = Region.objects.all()  
    return render(request,"region/show_region.html",{'regions':regions})  

@login_required  
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
def d_region(request, id):  
    region = Region.objects.get(id=id)  
    region.delete()  
    return redirect("show_region") 


# Education
@login_required 
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
    return render(request,'education/add_education.html',{'form':form})  

@login_required    
def show_education(request):  
    educations = Education.objects.all()  
    return render(request,"education/show_education.html",{'educations':educations})  

@login_required  
def e_education(request, id):  
    education = Education.objects.get(id=id)  
    return render(request,'education/e_education.html', {'education':education})  

@login_required  
def u_education(request, id):  
    education = Education.objects.get(id=id)  
    form = EducationForm(request.POST, instance = education)  
    if form.is_valid():  
        form.save()  
        return redirect("show_education")  
    return render(request, 'education/e_education.html', {'education': education})  

@login_required  
def d_education(request, id):  
    education = Education.objects.get(id=id)  
    education.delete()  
    return redirect("show_education") 


# Employement_Record
@login_required 
def add_employement_Record(request):  
    if request.method == "POST":  
        form = Employement_RecordForm(request.POST) 
        if form.is_valid():
            try:  
                form.save()  
                return redirect('show_employement_Record')  
            except Exception as e:  
                print(e)  
                pass  
    else:  
        form = Employement_RecordForm()  
    return render(request,'employement_Record/add_employement_Record.html',{'form':form})  

@login_required    
def show_employement_Record(request):  
    employement_Records = Employement_Record.objects.all()  
    return render(request,"employement_Record/show_employement_Record.html",{'employement_Records':employement_Records})  

@login_required  
def e_employement_Record(request, id):  
    employement_Record = Employement_Record.objects.get(id=id)  
    return render(request,'employement_Record/e_employement_Record.html', {'employement_Record':employement_Record})  

@login_required  
def u_employement_Record(request, id):  
    employement_Record = Employement_Record.objects.get(id=id)  
    form = Employement_RecordForm(request.POST, instance = employement_Record)  
    if form.is_valid():  
        form.save()  
        return redirect("show_employement_Record")  
    return render(request, 'employement_Record/e_employement_Record.html', {'employement_Record': employement_Record})  

@login_required  
def d_employement_Record(request, id):  
    employement_Record = Employement_Record.objects.get(id=id)  
    employement_Record.delete()  
    return redirect("show_employement_Record") 

 
# Certifications
@login_required 
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
    return render(request,'certification/add_certification.html',{'form':form})  

@login_required    
def show_certification(request):  
    certifications = Certifications.objects.all()  
    return render(request,"certification/show_certification.html",{'certifications':certifications})  

@login_required  
def e_certification(request, id):  
    certification = Certifications.objects.get(id=id)  
    return render(request,'certification/e_certification.html', {'certification':certification})  

@login_required  
def u_certification(request, id):  
    certification = Certifications.objects.get(id=id)  
    form = CertificationsForm(request.POST, instance = certification)  
    if form.is_valid():  
        form.save()  
        return redirect("show_certification")  
    return render(request, 'certification/e_certification.html', {'certification': certification})  

@login_required  
def d_certification(request, id):  
    certification = Certifications.objects.get(id=id)  
    certification.delete()  
    return redirect("show_certification") 


# Skills
@login_required 
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
    return render(request,'skill/add_skill.html',{'form':form})  

@login_required    
def show_skill(request):  
    skills = Skills.objects.all()  
    return render(request,"skill/show_skill.html",{'skills':skills})  

@login_required  
def e_skill(request, id):  
    skill = Skills.objects.get(id=id)  
    return render(request,'skill/e_skill.html', {'skill':skill})  

@login_required  
def u_skill(request, id):  
    skill = Skills.objects.get(id=id)  
    form = SkillsForm(request.POST, instance = skill)  
    if form.is_valid():  
        form.save()  
        return redirect("show_skill")  
    return render(request, 'skill/e_skill.html', {'skill': skill})  

@login_required  
def d_skill(request, id):  
    skill = Skills.objects.get(id=id)  
    skill.delete()  
    return redirect("show_skill") 