from django.db import models

# Create your models here. 

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

class Region(models.Model):  
    region_name = models.CharField(max_length=100,null=True)  
    status = models.IntegerField(default=1) 
    class Meta:  
        db_table = "region"

class Employee(models.Model):  
    eid = models.CharField(max_length=20,null=True)  
    ename = models.CharField(max_length=100,null=True)  
    eemail = models.EmailField(null=True)  
    econtact = models.CharField(max_length=15,null=True)  
    department =models.ForeignKey(Department, on_delete=models.CASCADE,null=True)
    designation =  models.ForeignKey(Designation, on_delete=models.CASCADE,null=True)
    region =  models.ForeignKey(Region, on_delete=models.CASCADE,null=True)
    cnic = models.CharField(max_length=15,null=True)
    date_of_joining = models.DateField(null=True) 
    dob = models.DateField(null=True) 
    qualification_id = models.CharField(max_length=100,null=True)
    deliverable_task = models.CharField(max_length=1000,null=True)
    e_address = models.CharField(max_length=100,null=True)
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
    grade = models.IntegerField(null=True)
    status = models.IntegerField(default=1) 
    class Meta:  
        db_table = "education"

class Employement_Record(models.Model):  
    employee = models.ForeignKey(Employee, on_delete=models.CASCADE,null=True)
    organization_name = models.CharField(max_length=50,null=True)  
    position = models.CharField(max_length=50,null=True)  
    country = models.CharField(max_length=50,null=True)  
    from_date = models.DateField(null=True) 
    to_date = models.DateField(null=True) 
    salary = models.IntegerField(null=True)
    activites = models.CharField(max_length=1000,null=True)  
    ref_name = models.CharField(max_length=100,null=True)  
    ref_email = models.EmailField(null=True)  
    ref_contact = models.CharField(max_length=15,null=True) 
    status = models.IntegerField(default=1) 
    class Meta:  
        db_table = "employement_record"

class Certifications(models.Model):  
    employee = models.ForeignKey(Employee, on_delete=models.CASCADE,null=True)
    certification_name = models.CharField(max_length=100,null=True)  
    status = models.IntegerField(default=1) 
    class Meta:  
        db_table = "certifications"

class Skills(models.Model):  
    employee = models.ForeignKey(Employee, on_delete=models.CASCADE,null=True)
    skill_name = models.CharField(max_length=100,null=True)  
    status = models.IntegerField(default=1) 
    class Meta:  
        db_table = "skills"


class Company(models.Model):  
    comp_name = models.CharField(max_length=100,null=True)  
    status = models.IntegerField(default=1) 
    class Meta:  
        db_table = "company"

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
