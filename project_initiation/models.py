from django.db import models
from employee.models import Client, Department
from finance.models import Currency

# Create your models here.
class Tendor(models.Model): 
    title = models.CharField(max_length=255, null=True)
    tendor_no = models.CharField(max_length=255, null=True)
    department = models.ForeignKey(Department, on_delete=models.CASCADE,null=True, blank=True)
    client = models.ForeignKey(Client, on_delete=models.CASCADE,null=True, blank=True)
    isadpscheme = models.IntegerField(null=True) 
    adpscheme_no = models.CharField(max_length=100, null=True)
    em_percentage = models.FloatField(null=True) 
    bg_percentage = models.FloatField(null=True) 
    ad_image = models.CharField(max_length=255, null=True)
    ad_description = models.CharField(max_length=255, null=True)
    lastdate_to_collect = models.DateField(null=True) 
    lastdate_of_submission = models.DateField(null=True) 
    date_of_collection = models.DateField(null=True) 
    date_of_submission = models.DateField(null=True) 
    special_instruction = models.CharField(max_length=255,null=True) 
    tendor_collected_by = models.CharField(max_length=255,null=True) 
    created_at = models.DateField(auto_now_add=True, null=True)
    updated_at = models.DateField(auto_now=True, null=True)
    deleted_at = models.DateField(null=True, blank=True)
    status = models.IntegerField(default=1) 
    class Meta:  
        db_table = "tendor"

class Unit(models.Model): 
    name = models.CharField(max_length=255, null=True)
    created_at = models.DateField(auto_now_add=True, null=True)
    updated_at = models.DateField(auto_now=True, null=True)
    deleted_at = models.DateField(null=True, blank=True)
    status = models.IntegerField(default=1) 
    class Meta:  
        db_table = "unit"

class Tax(models.Model): 
    name = models.CharField(max_length=255, null=True)
    percentage = models.FloatField(null=True, blank=True) 
    created_at = models.DateField(auto_now_add=True, null=True)
    updated_at = models.DateField(auto_now=True, null=True)
    deleted_at = models.DateField(null=True, blank=True)
    status = models.IntegerField(default=1) 
    class Meta:  
        db_table = "tax"

class Category(models.Model): 
    title = models.CharField(max_length=255, null=True)
    created_at = models.DateField(auto_now_add=True, null=True)
    updated_at = models.DateField(auto_now=True, null=True)
    deleted_at = models.DateField(null=True, blank=True)
    status = models.IntegerField(default=1) 
    class Meta:  
        db_table = "category"

class Item(models.Model): 
    name = models.CharField(max_length=255, null=True)
    short_name = models.CharField(max_length=50, null=True)
    description = models.CharField(max_length=1000, null=True)
    unit = models.ForeignKey(Unit, on_delete=models.CASCADE,null=True)
    category = models.ForeignKey(Category, on_delete=models.CASCADE,null=True, blank=True)
    created_at = models.DateField(auto_now_add=True, null=True)
    updated_at = models.DateField(auto_now=True, null=True)
    deleted_at = models.DateField(null=True, blank=True)
    status = models.IntegerField(default=1) 
    class Meta:  
        db_table = "item"

class Heading(models.Model): 
    title = models.CharField(max_length=255, null=True)
    tendor = models.ForeignKey(Tendor, on_delete=models.CASCADE,null=True)
    created_at = models.DateField(auto_now_add=True, null=True)
    updated_at = models.DateField(auto_now=True, null=True)
    deleted_at = models.DateField(null=True, blank=True)
    status = models.IntegerField(default=1) 
    class Meta:  
        db_table = "heading"

class Sub_heading(models.Model): 
    title = models.CharField(max_length=255, null=True)
    heading = models.ForeignKey(Heading, on_delete=models.CASCADE,null=True)
    tendor = models.ForeignKey(Tendor, on_delete=models.CASCADE,null=True)
    isgroup = models.IntegerField(default=0) 
    created_at = models.DateField(auto_now_add=True, null=True)
    updated_at = models.DateField(auto_now=True, null=True)
    deleted_at = models.DateField(null=True, blank=True)
    status = models.IntegerField(default=1) 
    class Meta:  
        db_table = "sub_heading"

class Boq_master(models.Model): 
    tendor = models.ForeignKey(Tendor, on_delete=models.CASCADE)
    amount = models.FloatField(null=True)  
    tax_amount = models.FloatField(null=True)
    total_amount = models.FloatField(null=True)
    level = models.IntegerField(null=True, blank=True) 
    created_at = models.DateField(auto_now_add=True, null=True)
    updated_at = models.DateField(auto_now=True, null=True)
    deleted_at = models.DateField(null=True, blank=True)
    status = models.IntegerField(default=1) 
    class Meta:  
        db_table = "boq_master"

class Boq_items(models.Model): 
    boq_master = models.ForeignKey(Boq_master, on_delete=models.CASCADE,null=True)
    root = models.ForeignKey("self", on_delete=models.CASCADE,null=True, blank=True,related_name='Boq_items')
    parent = models.ForeignKey("self", on_delete=models.CASCADE,null=True, blank=True)
    item = models.ForeignKey(Item, on_delete=models.CASCADE,null=True, blank=True)
    heading = models.ForeignKey(Heading, on_delete=models.CASCADE,null=True, blank=True)
    sub_heading = models.ForeignKey(Sub_heading, on_delete=models.CASCADE,null=True, blank=True)
    tendor = models.ForeignKey(Tendor, on_delete=models.CASCADE,null=True, blank=True)
    groupid = models.CharField(max_length=10, null=True)
    unit = models.ForeignKey(Unit, on_delete=models.CASCADE,null=True, blank=True)
    unit_price = models.FloatField(null=True) 
    quantity = models.IntegerField(null=True)
    total_amount = models.FloatField(null=True)  
    is_imported = models.IntegerField(default=0) 
    currency = models.ForeignKey(Currency, on_delete=models.CASCADE,null=True, blank=True)
    conversion_rate = models.FloatField(null=True) 
    created_at = models.DateField(auto_now_add=True, null=True)
    updated_at = models.DateField(auto_now=True, null=True)
    deleted_at = models.DateField(null=True, blank=True)
    status = models.IntegerField(default=1) 
    class Meta:  
        db_table = "boq_items"