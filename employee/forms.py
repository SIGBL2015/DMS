from django import forms  
from employee.models import Employee, Department, Designation, Region, Education,Project, Employment_Record, Certifications, Skills, Company, Module, Mainmenu, Submenu, Role, Company_module, Role_permission, CV_template, Template_column, Project_type, Project, Bank, Bank_guaranty, Liquidity_damages, Insurance_type, Insurance_detail, Country, Zone, Area, Branch, Client, Document_type, Project_document, Sales, Leads,Quarters, Employee_target, Vendor, Employee_project

class EmployeeForm(forms.ModelForm):  
    class Meta:  
        model = Employee  
        fields = ('id','eid','ename','eemail','econtact','department','designation','branch','cnic','date_of_joining','dob','qualification_id','e_address','deliverable_task','cv_doc') 

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
        fields = ('id','employee','degree_name','institute','country','from_date','to_date','grade','degree_doc') 

class Employment_RecordForm(forms.ModelForm):  
    class Meta:  
        model = Employment_Record  
        fields = ('id','employee','organization_name','position','country','from_date','to_date','salary','activites','ref_name','ref_email','ref_contact') 

class CertificationsForm(forms.ModelForm):  
    class Meta:  
        model = Certifications  
        fields = ('id','employee','certification_name','certification_doc')

class SkillsForm(forms.ModelForm):  
    class Meta:  
        model = Skills  
        fields = ('id','employee','skill_name')

class CompanyForm(forms.ModelForm):  
    class Meta:  
        model = Company  
        fields = ('id','comp_name')

class Project_typeForm(forms.ModelForm):  
    class Meta:  
        model = Project_type  
        fields = ('id','type_name')

class ProjectForm(forms.ModelForm):  
    class Meta:  
        model = Project  
        fields = ('id','lead','branch','project_type','title','client','start_date','end_date','duration','amount','tax','advance_tax','advance_amount','earnest_money','em_instrument_no','em_expire_date','pg_start_date','pg_end_date','pg_validity','pg_percentage','pg_amount','pg_instrument_no','keywords','project_status','scope','sector','initiated_by','em_receive_date','em_received','country','close_date','closing_doc','closing_remarks')

class BankForm(forms.ModelForm):  
    class Meta:  
        model = Bank  
        fields = ('id','bank_name','branch_code','city','address')

class Bank_guarantyForm(forms.ModelForm):  
    class Meta:  
        model = Bank_guaranty  
        fields = ('id','project','bank','duration','instrument_no','bg_start_date','bg_end_date','bg_validity','bg_percentage','bg_amount','bg_doc')

class Liquidity_damagesForm(forms.ModelForm):  
    class Meta:  
        model = Liquidity_damages  
        fields = ('id','project','unit','percentage','max_percentage','ld_doc')

class Insurance_typeForm(forms.ModelForm):  
    class Meta:  
        model = Insurance_type  
        fields = ('id','type_name')

class Insurance_detailForm(forms.ModelForm):  
    class Meta:  
        model = Insurance_detail  
        fields = ('id','project','insurance_type','issued_date','expire_date','amount','vendor','instrument_no')

class CountryForm(forms.ModelForm):  
    class Meta:  
        model = Country  
        fields = ('id','country_name')

class ZoneForm(forms.ModelForm):  
    class Meta:  
        model = Zone  
        fields = ('id','zone_name')

class AreaForm(forms.ModelForm):  
    class Meta:  
        model = Area  
        fields = ('id','area_name')

class BranchForm(forms.ModelForm):  
    class Meta:  
        model = Branch  
        fields = ('id','company','country','zone','region','area','branch_name','branch_code','branch_address')

class ClientForm(forms.ModelForm):  
    class Meta:  
        model = Client  
        fields = ('id','client_name','email','phone','country','address')

class VendorForm(forms.ModelForm):  
    class Meta:  
        model = Vendor  
        fields = ('id','vendor_name','email','phone','country','address')

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

class Document_typeForm(forms.ModelForm):  
    class Meta:  
        model = Document_type  
        fields = ('id','title')

class Project_documentForm(forms.ModelForm):  
    class Meta:  
        model = Project_document  
        fields = ('id','project','document_type','doc_path','remarks','ref_no','issuance_date')

class QuartersForm(forms.ModelForm):  
    class Meta:  
        model = Quarters  
        fields = ('id','title','short_name','year','start_date','end_date')

class Employee_targetForm(forms.ModelForm):  
    class Meta:  
        model = Employee_target  
        fields = ('id','employee','currency','sales_target')

class LeadsForm(forms.ModelForm):  
    class Meta:  
        model = Leads  
        fields = ('id','title','client','sale_person','lead_date','lead_type')

class Employee_projectForm(forms.ModelForm):  
    class Meta:  
        model = Employee_project  
        fields = ('id','employee','project','is_key_acc_mgr')

class SalesForm(forms.ModelForm):  
    class Meta:  
        model = Sales  
        fields = ('id','lead','amount')

# SELECT table_name FROM information_schema.tables
# WHERE table_schema = 'your_database_name';
        
# SELECT `COLUMN_NAME` FROM `INFORMATION_SCHEMA`.`COLUMNS` WHERE `TABLE_SCHEMA`='doc_management_db' AND `TABLE_NAME`='employee'