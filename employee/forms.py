from django import forms  
from employee.models import Employee, Department, Designation, Region, Education, Employment_Record, Certifications, Skills, Company, Module, Mainmenu, Submenu, Role, Company_module, Role_permission, CV_template, Template_column

class EmployeeForm(forms.ModelForm):  
    class Meta:  
        model = Employee  
        fields = ('id','eid','ename','eemail','econtact','department','designation','region','cnic','date_of_joining','dob','qualification_id','e_address','deliverable_task') 

class DepartmentForm(forms.ModelForm):  
    class Meta:  
        model = Department  
        fields = ('id','depart_name')

class DesignationForm(forms.ModelForm):  
    class Meta:  
        model = Designation  
        fields = ('id','design_name')

class RegionForm(forms.ModelForm):  
    class Meta:  
        model = Region  
        fields = ('id','region_name')

class EducationForm(forms.ModelForm):  
    class Meta:  
        model = Education  
        fields = ('id','employee','degree_name','institute','country','from_date','to_date','grade') 

class Employment_RecordForm(forms.ModelForm):  
    class Meta:  
        model = Employment_Record  
        fields = ('id','employee','organization_name','position','country','from_date','to_date','salary','activites','ref_name','ref_email','ref_contact') 

class CertificationsForm(forms.ModelForm):  
    class Meta:  
        model = Certifications  
        fields = ('id','employee','certification_name')

class SkillsForm(forms.ModelForm):  
    class Meta:  
        model = Skills  
        fields = ('id','employee','skill_name')

class CompanyForm(forms.ModelForm):  
    class Meta:  
        model = Company  
        fields = ('id','comp_name')

class ModuleForm(forms.ModelForm):  
    class Meta:  
        model = Module  
        fields = ('id','module_name')

class MainmenuForm(forms.ModelForm):  
    class Meta:  
        model = Mainmenu  
        fields = "__all__"

class SubmenuForm(forms.ModelForm):  
    class Meta:  
        model = Submenu  
        fields = "__all__"

class RoleForm(forms.ModelForm):  
    class Meta:  
        model = Role  
        fields = "__all__"

class Company_moduleForm(forms.ModelForm):  
    class Meta:  
        model = Company_module  
        fields = "__all__"

class Role_permissionForm(forms.ModelForm):  
    class Meta:  
        model = Role_permission  
        fields = "__all__"
        
class CV_templateForm(forms.ModelForm):  
    class Meta:  
        model = CV_template  
        fields = ('id','tendor','title','templete_code')

class Template_columnForm(forms.ModelForm):  
    class Meta:  
        model = Template_column  
        fields = ('id','title','table_name','field_name')




# SELECT table_name FROM information_schema.tables
# WHERE table_schema = 'your_database_name';
        
# SELECT `COLUMN_NAME` FROM `INFORMATION_SCHEMA`.`COLUMNS` WHERE `TABLE_SCHEMA`='doc_management_db' AND `TABLE_NAME`='employee'