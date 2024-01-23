from django.db import models

# Create your models here. 
class Employee(models.Model):  
    eid = models.CharField(max_length=20)  
    ename = models.CharField(max_length=100)  
    eemail = models.EmailField()  
    econtact = models.CharField(max_length=15)  
    depart_id = models.IntegerField() 
    designation_id = models.IntegerField() 
    region_id = models.IntegerField() 
    cnic = models.CharField(max_length=15)
    date_of_joining = models.DateField() 
    dob = models.DateField() 
    qualification_id = models.IntegerField() 
    deliverable_task = models.CharField(max_length=1000)
    e_address = models.CharField(max_length=100)
    status = models.IntegerField(default=1) 
    class Meta:  
        db_table = "employee"  

class Department(models.Model):  
    depart_name = models.CharField(max_length=100)  
    status = models.IntegerField(default=1) 
    class Meta:  
        db_table = "department"  

class Designation(models.Model):  
    design_name = models.CharField(max_length=100)  
    status = models.IntegerField(default=1) 
    class Meta:  
        db_table = "designation"  

class Region(models.Model):  
    region_name = models.CharField(max_length=100)  
    status = models.IntegerField(default=1) 
    class Meta:  
        db_table = "region"

class Education(models.Model):  
    emp_id = models.IntegerField()  
    degree_name = models.CharField(max_length=50)  
    institute = models.CharField(max_length=50)  
    country = models.CharField(max_length=50)  
    from_date = models.DateField() 
    to_date = models.DateField() 
    grade = models.IntegerField()
    status = models.IntegerField(default=1) 
    class Meta:  
        db_table = "education"

class Employement_Record(models.Model):  
    emp_id = models.IntegerField()  
    organization_name = models.CharField(max_length=50)  
    position = models.CharField(max_length=50)  
    country = models.CharField(max_length=50)  
    from_date = models.DateField() 
    to_date = models.DateField() 
    salary = models.IntegerField()
    activites = models.CharField(max_length=1000)  
    ref_name = models.CharField(max_length=100)  
    ref_email = models.EmailField()  
    ref_contact = models.CharField(max_length=15) 
    status = models.IntegerField(default=1) 
    class Meta:  
        db_table = "employement_record"

class Certifications(models.Model):  
    emp_id = models.IntegerField()  
    certification_name = models.CharField(max_length=100)  
    status = models.IntegerField(default=1) 
    class Meta:  
        db_table = "certifications"

class Skills(models.Model):  
    emp_id = models.IntegerField()  
    skill_name = models.CharField(max_length=100)  
    status = models.IntegerField(default=1) 
    class Meta:  
        db_table = "skills"


class Company(models.Model):  
    comp_name = models.CharField(max_length=100)  
    status = models.IntegerField(default=1) 
    class Meta:  
        db_table = "company"

class Module(models.Model):
    module_name = models.CharField(max_length=100)  
    status = models.IntegerField(default=1) 
    class Meta:  
        db_table = "module"

class Mainmenu(models.Model):
    module_id = models.IntegerField()  
    mainmenu_name = models.CharField(max_length=100) 
    mainmenu_link = models.CharField(max_length=100) 
    mainmenu_seq = models.CharField(max_length=100)  
    status = models.IntegerField(default=1) 
    class Meta:  
        db_table = "mainmenu"

class Submenu(models.Model):
    mainmenu_id = models.IntegerField()  
    submenu_name = models.CharField(max_length=100) 
    submenu_link = models.CharField(max_length=100) 
    submenu_seq = models.CharField(max_length=100)  
    status = models.IntegerField(default=1) 
    class Meta:  
        db_table = "submenu"

class Role(models.Model):
    role_name = models.CharField(max_length=100)  
    status = models.IntegerField(default=1) 
    class Meta:  
        db_table = "role"

class Company_module(models.Model):
    company_id = models.IntegerField() 
    module_id = models.IntegerField()   
    status = models.IntegerField(default=1) 
    class Meta:  
        db_table = "company_module"

class Role_permission(models.Model):
    module_id = models.IntegerField() 
    mainmenu_id = models.IntegerField()
    submenu_id = models.IntegerField()
    role_id = models.IntegerField()
    status = models.IntegerField(default=1) 
    class Meta:  
        db_table = "role_permission"