from django.db import models

# Create your models here. 
class Company(models.Model):  
    comp_name = models.CharField(max_length=100,null=True)  
    status = models.IntegerField(default=1) 
    class Meta:  
        db_table = "company"

class Country(models.Model):
    country_name = models.CharField(max_length=100,null=True)  
    status = models.IntegerField(default=1) 
    class Meta:  
        db_table = "country"

class Zone(models.Model):
    zone_name = models.CharField(max_length=100,null=True)  
    status = models.IntegerField(default=1) 
    class Meta:  
        db_table = "zone"

class Area(models.Model):
    area_name = models.CharField(max_length=100,null=True)  
    status = models.IntegerField(default=1) 
    class Meta:  
        db_table = "area"

class Region(models.Model):  
    region_name = models.CharField(max_length=100,null=True)  
    status = models.IntegerField(default=1) 
    class Meta:  
        db_table = "region"

class Branch(models.Model):
    company = models.ForeignKey(Company, on_delete=models.CASCADE,null=True)
    country = models.ForeignKey(Country, on_delete=models.CASCADE,null=True)
    zone = models.ForeignKey(Zone, on_delete=models.CASCADE,null=True)
    region = models.ForeignKey(Region, on_delete=models.CASCADE,null=True)
    area = models.ForeignKey(Area, on_delete=models.CASCADE,null=True)
    branch_name = models.CharField(max_length=100,null=True) 
    branch_code = models.CharField(max_length=100,null=True) 
    branch_address = models.CharField(max_length=100,null=True)  
    status = models.IntegerField(default=1) 
    class Meta:  
        db_table = "branch"

class Client(models.Model):  
    client_name = models.CharField(max_length=100,null=True) 
    email = models.CharField(max_length=100,null=True) 
    phone = models.CharField(max_length=100,null=True) 
    country = models.ForeignKey(Country, on_delete=models.CASCADE,null=True)
    address = models.CharField(max_length=100,null=True)  
    status = models.IntegerField(default=1) 
    class Meta:  
        db_table = "client"

class Department(models.Model):  
    depart_name = models.CharField(max_length=100,null=True)  
    status = models.IntegerField(default=1) 
    class Meta:  
        db_table = "department"  

class Designation(models.Model):  
    design_name = models.CharField(max_length=100,null=True)  
    status = models.IntegerField(default=1) 
    class Meta:  
        db_table = "designation"  

class Employee(models.Model):  
    eid = models.CharField(max_length=20,null=True)  
    ename = models.CharField(max_length=100,null=True)  
    eemail = models.EmailField(null=True)  
    econtact = models.CharField(max_length=15,null=True)  
    department =models.ForeignKey(Department, on_delete=models.CASCADE,null=True)
    designation =  models.ForeignKey(Designation, on_delete=models.CASCADE,null=True)
    branch =  models.ForeignKey(Branch, on_delete=models.CASCADE,null=True)
    cnic = models.CharField(max_length=15,null=True)
    date_of_joining = models.DateField(null=True) 
    dob = models.DateField(null=True) 
    qualification_id = models.CharField(max_length=100,null=True)
    deliverable_task = models.CharField(max_length=1000,null=True)
    e_address = models.CharField(max_length=100,null=True)
    cv_doc = models.CharField(max_length=255,null=True, blank=True) 
    status = models.IntegerField(default=1) 

    class Meta:  
        db_table = "employee"  

class Education(models.Model):  
    employee = models.ForeignKey(Employee, on_delete=models.CASCADE,null=True)
    degree_name = models.CharField(max_length=50,null=True)  
    institute = models.CharField(max_length=50,null=True)  
    country = models.CharField(max_length=50,null=True)  
    from_date = models.DateField(null=True) 
    to_date = models.DateField(null=True) 
    grade = models.CharField(max_length=50,null=True)  
    degree_doc = models.CharField(max_length=255,null=True, blank=True) 
    status = models.IntegerField(default=1) 
    class Meta:  
        db_table = "education"

class Employment_Record(models.Model):  
    employee = models.ForeignKey(Employee, on_delete=models.CASCADE,null=True)
    organization_name = models.CharField(max_length=50,null=True)  
    position = models.CharField(max_length=50,null=True)  
    country = models.CharField(max_length=50,null=True)  
    from_date = models.DateField(null=True) 
    to_date = models.DateField(null=True) 
    salary = models.FloatField(null=True)
    activites = models.CharField(max_length=1000,null=True)  
    ref_name = models.CharField(max_length=100,null=True)  
    ref_email = models.EmailField(null=True)  
    ref_contact = models.CharField(max_length=15,null=True) 
    status = models.IntegerField(default=1) 
    class Meta:  
        db_table = "employment_record"

class Certifications(models.Model):  
    employee = models.ForeignKey(Employee, on_delete=models.CASCADE,null=True)
    certification_name = models.CharField(max_length=100,null=True)  
    certification_doc = models.CharField(max_length=255,null=True, blank=True) 
    expiry_date = models.DateField(null=True) 
    status = models.IntegerField(default=1) 
    class Meta:  
        db_table = "certifications"

class Skills(models.Model):  
    employee = models.ForeignKey(Employee, on_delete=models.CASCADE,null=True)
    skill_name = models.CharField(max_length=100,null=True)  
    status = models.IntegerField(default=1) 
    class Meta:  
        db_table = "skills"

class Project_type(models.Model):  
    type_name = models.CharField(max_length=100,null=True)  
    status = models.IntegerField(default=1) 
    class Meta:  
        db_table = "project_type"

class Leads(models.Model): 
    title = models.CharField(max_length=100,null=True) 
    sale_person = models.ForeignKey(Employee, on_delete=models.CASCADE,null=True)
    client = models.ForeignKey(Client, on_delete=models.CASCADE,null=True)
    lead_date = models.DateField(null=True)
    lead_type = models.CharField(max_length=100,null=True) 
    convert_date = models.DateField(null=True)
    created_at = models.DateField(auto_now_add=True, null=True)
    updated_at = models.DateField(auto_now=True, null=True)
    deleted_at = models.DateField(null=True, blank=True)
    status = models.IntegerField(default=1) 
    class Meta:  
        db_table = "leads"

class Project(models.Model):  
    branch =  models.ForeignKey(Branch, on_delete=models.CASCADE,null=True)
    project_type = models.ForeignKey(Project_type, on_delete=models.CASCADE,null=True)
    title = models.CharField(max_length=100,null=True)  
    client = models.ForeignKey(Client, on_delete=models.CASCADE,null=True, blank=True)
    country = models.ForeignKey(Country, on_delete=models.CASCADE,null=True, blank=True)
    start_date = models.DateField(null=True, blank=True) 
    end_date = models.DateField(null=True, blank=True)
    duration = models.IntegerField(null=True, blank=True)
    amount = models.FloatField(null=True, blank=True)
    tax = models.FloatField(null=True, blank=True)
    total = models.FloatField(null=True, blank=True)
    advance_tax = models.FloatField(null=True, blank=True)
    advance_amount = models.FloatField(null=True, blank=True)
    earnest_money = models.FloatField(null=True, blank=True)
    em_instrument_no = models.CharField(max_length=100,null=True, blank=True)
    em_expire_date = models.DateField(null=True, blank=True)
    em_doc = models.CharField(max_length=255,null=True, blank=True)
    pg_start_date = models.DateField(null=True, blank=True) 
    pg_end_date = models.DateField(null=True, blank=True)
    pg_validity = models.DateField(null=True, blank=True) 
    pg_percentage = models.FloatField(null=True, blank=True)
    pg_amount = models.FloatField(null=True, blank=True)
    pg_instrument_no = models.CharField(max_length=100,null=True, blank=True)
    keywords = models.CharField(max_length=1000,null=True, blank=True)
    pg_doc = models.CharField(max_length=255,null=True, blank=True)
    project_doc = models.CharField(max_length=255,null=True, blank=True)
    project_status = models.CharField(max_length=100,null=True, blank=True)
    status = models.IntegerField(default=1) 
    scope = models.CharField(max_length=100,null=True, blank=True)
    sector = models.CharField(max_length=100,null=True, blank=True)
    po_scan_doc = models.CharField(max_length=255,null=True, blank=True)
    em_received = models.CharField(max_length=100,null=True, blank=True)
    em_receive_date = models.DateField(null=True, blank=True)
    initiated_by = models.CharField(max_length=100,null=True, blank=True)
    manager = models.ForeignKey(Employee, on_delete=models.CASCADE,null=True, blank=True)
    lead = models.ForeignKey(Leads, on_delete=models.CASCADE,null=True, blank=True)
    team_id = models.IntegerField(null=True, blank=True)
    close_date = models.DateField(null=True, blank=True)
    closing_doc = models.CharField(max_length=255,null=True, blank=True)
    closing_remarks = models.CharField(max_length=1000,null=True, blank=True)
    class Meta:  
        db_table = "project"

class Employee_project(models.Model):  
    employee = models.ForeignKey(Employee, on_delete=models.CASCADE,null=True)
    project = models.ForeignKey(Project, on_delete=models.CASCADE,null=True)
    is_key_acc_mgr = models.IntegerField(null=True)
    status = models.IntegerField(default=1) 
    class Meta:  
        db_table = "employee_project"

class Bank(models.Model):  
    bank_name = models.CharField(max_length=100,null=True)   
    branch_code = models.CharField(max_length=100,null=True)
    city = models.CharField(max_length=100,null=True)
    address = models.CharField(max_length=100,null=True) 
    status = models.IntegerField(default=1) 
    class Meta:  
        db_table = "bank"

class Bank_guaranty(models.Model):  
    guarantee_type = models.CharField(max_length=50,null=True, blank=True)
    project = models.ForeignKey(Project, on_delete=models.CASCADE,null=True)
    bank = models.ForeignKey(Bank, on_delete=models.CASCADE,null=True)   
    duration = models.IntegerField(null=True)
    instrument_no = models.CharField(max_length=100,null=True)
    bg_start_date = models.DateField(null=True) 
    bg_end_date = models.DateField(null=True)
    bg_validity = models.DateField(null=True) 
    bg_percentage = models.FloatField(null=True)
    bg_amount = models.FloatField(null=True)
    bg_doc = models.CharField(max_length=255,null=True, blank=True)
    addendum = models.CharField(max_length=100,null=True)
    status = models.IntegerField(default=1) 
    class Meta:  
        db_table = "bank_guaranty"

class Liquidity_damages(models.Model):  
    project = models.ForeignKey(Project, on_delete=models.CASCADE,null=True)
    unit = models.IntegerField(null=True)
    percentage = models.FloatField(null=True)
    max_percentage = models.FloatField(null=True)
    ld_doc = models.CharField(max_length=255,null=True, blank=True) 
    addendum = models.CharField(max_length=100,null=True)
    status = models.IntegerField(default=1) 
    class Meta:  
        db_table = "liquidity_damages"

class Insurance_type(models.Model):  
    type_name = models.CharField(max_length=100,null=True)
    status = models.IntegerField(default=1) 
    class Meta:  
        db_table = "insurance_type"

class Insurance_detail(models.Model):  
    project = models.ForeignKey(Project, on_delete=models.CASCADE,null=True)
    insurance_type = models.ForeignKey(Insurance_type, on_delete=models.CASCADE,null=True)
    issued_date = models.DateField(null=True) 
    expire_date = models.DateField(null=True)
    amount = models.FloatField(default=1) 
    vendor = models.CharField(max_length=100,null=True)
    instrument_no = models.CharField(max_length=100,null=True)
    status = models.IntegerField(default=1) 
    class Meta:  
        db_table = "insurance_detail"


class Module(models.Model):
    module_name = models.CharField(max_length=100,null=True)  
    status = models.IntegerField(default=1) 
    class Meta:  
        db_table = "module"

class Mainmenu(models.Model):
    module_id = models.IntegerField()  
    mainmenu_name = models.CharField(max_length=100,null=True) 
    mainmenu_link = models.CharField(max_length=100,null=True) 
    mainmenu_seq = models.CharField(max_length=100,null=True)  
    status = models.IntegerField(default=1) 
    class Meta:  
        db_table = "mainmenu"

class Submenu(models.Model):
    mainmenu_id = models.IntegerField()  
    submenu_name = models.CharField(max_length=100,null=True) 
    submenu_link = models.CharField(max_length=100,null=True) 
    submenu_seq = models.CharField(max_length=100,null=True)  
    status = models.IntegerField(default=1) 
    class Meta:  
        db_table = "submenu"

class Role(models.Model):
    role_name = models.CharField(max_length=100,null=True)  
    status = models.IntegerField(default=1) 
    class Meta:  
        db_table = "role"

class Company_module(models.Model):
    company_id = models.IntegerField(null=True) 
    module_id = models.IntegerField(null=True)   
    status = models.IntegerField(default=1) 
    class Meta:  
        db_table = "company_module"

class Role_permission(models.Model):
    module_id = models.IntegerField(null=True) 
    mainmenu_id = models.IntegerField(null=True)
    submenu_id = models.IntegerField(null=True)
    role_id = models.IntegerField(null=True)
    status = models.IntegerField(default=1) 
    class Meta:  
        db_table = "role_permission"

class CV_template(models.Model): 
    tendor = models.CharField(max_length=100, null=True)
    title = models.CharField(max_length=100, null=True)
    templete_code = models.CharField(max_length=2000, null=True)
    status = models.IntegerField(default=1) 
    class Meta:  
        db_table = "cv_template"

class Template_column(models.Model): 
    title = models.CharField(max_length=100, null=True)
    table_name = models.CharField(max_length=100, null=True)
    field_name = models.CharField(max_length=100, null=True)
    status = models.IntegerField(default=1) 
    class Meta:  
        db_table = "template_column"

class Document_type(models.Model): 
    title = models.CharField(max_length=100, null=True)
    created_at = models.DateField(auto_now_add=True, null=True)
    updated_at = models.DateField(auto_now=True,null=True)
    deleted_at = models.DateField(null=True)
    status = models.IntegerField(default=1) 
    class Meta:  
        db_table = "document_type"

class Project_document(models.Model): 
    project = models.ForeignKey(Project, on_delete=models.CASCADE,null=True)
    document_type = models.ForeignKey(Document_type, on_delete=models.CASCADE,null=True)
    doc_path = models.CharField(max_length=255, null=True, blank=True)
    remarks = models.CharField(max_length=255, null=True)
    ref_no = models.CharField(max_length=100, null=True)
    issuance_date = models.DateField(null=True)
    created_at = models.DateField(auto_now_add=True, null=True)
    updated_at = models.DateField(auto_now=True, null=True)
    deleted_at = models.DateField(null=True, blank=True)
    status = models.IntegerField(default=1) 
    class Meta:  
        db_table = "project_document"

class Quarters(models.Model): 
    title = models.CharField(max_length=255, null=True)
    short_name = models.CharField(max_length=50, null=True)
    year = models.CharField(max_length=50, null=True)
    start_date = models.DateField(null=True)
    end_date = models.DateField(null=True)
    created_at = models.DateField(auto_now_add=True, null=True)
    updated_at = models.DateField(auto_now=True, null=True)
    deleted_at = models.DateField(null=True, blank=True)
    status = models.IntegerField(default=1) 
    class Meta:  
        db_table = "quarters"

class Employee_target(models.Model): 
    employee = models.ForeignKey(Employee, on_delete=models.CASCADE,null=True)
    financial_year = models.CharField(max_length=255, null=True)
    currency = models.CharField(max_length=255, null=True)
    quarter = models.ForeignKey(Quarters, on_delete=models.CASCADE,null=True)
    sales_target = models.FloatField(null=True)
    created_at = models.DateField(auto_now_add=True, null=True)
    updated_at = models.DateField(auto_now=True, null=True)
    deleted_at = models.DateField(null=True, blank=True)
    status = models.IntegerField(default=1) 
    class Meta:  
        db_table = "employee_target"

class Sales(models.Model): 
    sale_person = models.ForeignKey(Employee, on_delete=models.CASCADE,null=True)
    sale_date = models.DateField(null=True)
    project = models.ForeignKey(Project, on_delete=models.CASCADE,null=True)
    quarter = models.ForeignKey(Quarters, on_delete=models.CASCADE,null=True)
    lead = models.ForeignKey(Leads, on_delete=models.CASCADE,null=True)
    amount = models.FloatField(null=True) 
    created_at = models.DateField(auto_now_add=True, null=True)
    updated_at = models.DateField(auto_now=True, null=True)
    deleted_at = models.DateField(null=True, blank=True)
    status = models.IntegerField(default=1) 
    class Meta:  
        db_table = "sales"

class Vendor(models.Model):  
    vendor_name = models.CharField(max_length=100,null=True) 
    email = models.CharField(max_length=100,null=True) 
    phone = models.CharField(max_length=100,null=True) 
    country = models.ForeignKey(Country, on_delete=models.CASCADE,null=True)
    address = models.CharField(max_length=100,null=True)  
    status = models.IntegerField(default=1) 
    class Meta:  
        db_table = "vendor"