from django.db import models
from employee.models import Project, Bank, Branch
# Create your models here.

class Currency(models.Model): 
    name = models.CharField(max_length=255, null=True)
    country = models.CharField(max_length=255, null=True)
    created_at = models.DateField(auto_now_add=True, null=True)
    updated_at = models.DateField(auto_now=True, null=True)
    deleted_at = models.DateField(null=True, blank=True)
    status = models.IntegerField(default=1) 
    class Meta:  
        db_table = "currency"

class Payment_mode(models.Model): 
    title = models.CharField(max_length=255, null=True)
    created_at = models.DateField(auto_now_add=True, null=True)
    updated_at = models.DateField(auto_now=True, null=True)
    deleted_at = models.DateField(null=True, blank=True)
    status = models.IntegerField(default=1) 
    class Meta:  
        db_table = "payment_mode"

class Account_type(models.Model): 
    title = models.CharField(max_length=255, null=True)
    short_code = models.CharField(max_length=50, null=True)
    created_at = models.DateField(auto_now_add=True, null=True)
    updated_at = models.DateField(auto_now=True, null=True)
    deleted_at = models.DateField(null=True, blank=True)
    status = models.IntegerField(default=1) 
    class Meta:  
        db_table = "account_type"

class Detail_type(models.Model): 
    account_type = models.ForeignKey(Account_type, on_delete=models.CASCADE,null=True, blank=True)
    title = models.CharField(max_length=255, null=True)
    short_code = models.CharField(max_length=50, null=True)
    created_at = models.DateField(auto_now_add=True, null=True)
    updated_at = models.DateField(auto_now=True, null=True)
    deleted_at = models.DateField(null=True, blank=True)
    status = models.IntegerField(default=1) 
    class Meta:  
        db_table = "detail_type"

class Chart_of_accounts(models.Model): 
    account_type = models.ForeignKey(Account_type, on_delete=models.CASCADE,null=True, blank=True)
    detail_type = models.ForeignKey(Detail_type, on_delete=models.CASCADE,null=True, blank=True)
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
    currency = models.ForeignKey(Currency, on_delete=models.CASCADE,null=True, blank=True)
    amount = models.FloatField(null=True) 
    conversion_rate = models.FloatField(null=True) 
    total_amount = models.FloatField(null=True) 
    payment_mode = models.ForeignKey(Payment_mode, on_delete=models.CASCADE,null=True, blank=True)
    project = models.ForeignKey(Project, on_delete=models.CASCADE,null=True, blank=True)
    bank = models.ForeignKey(Bank, on_delete=models.CASCADE,null=True, blank=True)
    cheque_no = models.CharField(max_length=100, null=True, blank=True)
    receive_person = models.CharField(max_length=100, null=True, blank=True)
    transaction_type = models.CharField(max_length=50, null=True)
    branch = models.ForeignKey(Branch, on_delete=models.CASCADE,null=True, blank=True)
    ref_no = models.CharField(max_length=50, null=True, blank=True, unique=True)
    description = models.CharField(max_length=1000, null=True, blank=True)
    doc_path = models.CharField(max_length=100, null=True, blank=True)
    created_at = models.DateField(auto_now_add=True, null=True)
    updated_at = models.DateField(auto_now=True, null=True)
    deleted_at = models.DateField(null=True, blank=True)
    status = models.IntegerField(default=1) 
    class Meta:  
        db_table = "journal_entry"