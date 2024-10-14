from django.db import models
from employee.models import Project, Bank, Region
# Create your models here.

class Payment_mode(models.Model): 
    title = models.CharField(max_length=255, null=True)
    created_at = models.DateField(auto_now_add=True, null=True)
    updated_at = models.DateField(auto_now=True, null=True)
    deleted_at = models.DateField(null=True, blank=True)
    status = models.IntegerField(default=1) 
    class Meta:  
        db_table = "payment_mode"

class Chart_of_accounts(models.Model): 
    title = models.CharField(max_length=255, null=True)
    short_code = models.CharField(max_length=50, null=True)
    parent = models.ForeignKey("self", on_delete=models.CASCADE,null=True, blank=True)
    created_at = models.DateField(auto_now_add=True, null=True)
    updated_at = models.DateField(auto_now=True, null=True)
    deleted_at = models.DateField(null=True, blank=True)
    status = models.IntegerField(default=1) 
    class Meta:  
        db_table = "chart_of_accounts"

class Journal_entry(models.Model): 
    coaid = models.ForeignKey(Chart_of_accounts, on_delete=models.CASCADE,null=True, blank=True)
    detail_type = models.IntegerField(null=True, blank=True)
    amount = models.IntegerField(null=True) 
    payment_mode = models.ForeignKey(Payment_mode, on_delete=models.CASCADE,null=True, blank=True)
    project = models.ForeignKey(Project, on_delete=models.CASCADE,null=True, blank=True)
    bank = models.ForeignKey(Bank, on_delete=models.CASCADE,null=True, blank=True)
    cheque_no = models.CharField(max_length=100, null=True, blank=True)
    receive_person = models.CharField(max_length=100, null=True, blank=True)
    transaction_type = models.CharField(max_length=50, null=True)
    region = models.ForeignKey(Region, on_delete=models.CASCADE,null=True, blank=True)
    ref_no = models.CharField(max_length=50, null=True, blank=True, unique=True)
    created_at = models.DateField(auto_now_add=True, null=True)
    updated_at = models.DateField(auto_now=True, null=True)
    deleted_at = models.DateField(null=True, blank=True)
    status = models.IntegerField(default=1) 
    class Meta:  
        db_table = "journal_entry"