from django.shortcuts import render, redirect  
from employee.forms import EmployeeForm, DepartmentForm, DesignationForm, RegionForm, EducationForm, Employement_RecordForm, CertificationsForm, SkillsForm, CompanyForm, ModuleForm, MainmenuForm, SubmenuForm, RoleForm, Company_moduleForm, Role_permissionForm, CV_templateForm, Template_columnForm
from employee.models import Employee, Department, Designation, Region, Education, Employement_Record, Certifications, Skills, Company, Module, Mainmenu, Submenu, Role, Company_module, Role_permission, CV_template, Template_column
from django.contrib.auth.decorators import login_required, permission_required
import re
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
        regions = Region.objects.filter(status=1).values('id','region_name')

    return render(request,'employee/index.html',{'departs':departs,'designs':designs,'regions':regions})  
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
    regions = Region.objects.filter(status=1).values('id','region_name')
    employee = Employee.objects.get(id=id)  
    return render(request,'employee/edit.html', {'employee':employee,'departs':departs,'designs':designs,'regions':regions})  

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
        form = Employement_RecordForm(request.POST) 
        if form.is_valid():
            try:  
                form.save()  
                return redirect('show_employement_record')  
            except Exception as e:  
                print(e)  
                pass  
    else:  
        form = Employement_RecordForm()
        employees = Employee.objects.filter(status=1).values('id','ename')  
    return render(request,'employement_record/add_employement_record.html',{'form':form,'employees':employees})  

@login_required 
@permission_required('employee.view_employement_record', raise_exception=True)   
def show_employement_Record(request):  
    employement_Records = Employement_Record.objects.all()  
    return render(request,"employement_record/show_employement_record.html",{'employement_Records':employement_Records})  

@login_required  
@permission_required('employee.change_employement_record', raise_exception=True)
def e_employement_Record(request, id):  
    employement_Record = Employement_Record.objects.get(id=id) 
    employees = Employee.objects.filter(status=1).values('id','ename') 
    return render(request,'employement_record/e_employement_record.html', {'employement_Record':employement_Record,'employees':employees})  

@login_required  
def u_employement_Record(request, id):  
    employement_Record = Employement_Record.objects.get(id=id)  
    form = Employement_RecordForm(request.POST, instance = employement_Record)  
    if form.is_valid():  
        form.save()  
        return redirect("show_employement_record")  
    return render(request, 'employement_record/e_employement_record.html', {'employement_Record': employement_Record})  

@login_required  
@permission_required('employee.delete_employement_record', raise_exception=True)
def d_employement_Record(request, id):  
    employement_Record = Employement_Record.objects.get(id=id)  
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

@login_required    
def generate(request):  
    # print (request.POST.get('employee'))
    employee = Employee.objects.get(id=request.POST.get('employee'))
    template = CV_template.objects.get(id=request.POST.get('template'))
    columns = Template_column.objects.all()  #.get(status=1).values('title','field_name')
    _columns = {}
    print(employee.ename)
    for column in columns:
        _columns[column.title] = column.field_name 
    

    fields = re.findall('{{(.+?)}}+',template.templete_code)
    for field in fields:
        template.templete_code = template.templete_code.replace('{{' + field + '}}',getattr(employee,_columns['{{' + field + '}}']))
    

    return render(request,"cv_template/cv.html",{'employee':employee,'template':template,'columns': columns})

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