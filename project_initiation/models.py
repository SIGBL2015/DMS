from django.db import models
from employee.models import Client, Department, Employee
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

class Item_specification(models.Model): 
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
        db_table = "item_specification"

class Item(models.Model): 
    name = models.CharField(max_length=255, null=True)
    short_name = models.CharField(max_length=50, null=True)
    maker = models.CharField(max_length=50, null=True)
    model = models.CharField(max_length=50, null=True)
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

class Iso_master(models.Model): 
    tendor = models.ForeignKey(Tendor, on_delete=models.CASCADE)
    version = models.FloatField(null=True, blank=True)  
    date = models.DateField(null=True, blank=True)
    delivery_date_committed = models.DateField(null=True, blank=True)
    delivery_date_required = models.DateField(null=True, blank=True)
    payment_term = models.CharField(max_length=50,null=True, blank=True)
    em_percentage = models.FloatField(null=True, blank=True)
    em_amount = models.FloatField(null=True, blank=True)
    bg_percentage = models.FloatField(null=True, blank=True)
    bg_amount = models.FloatField(null=True, blank=True)
    pg_percentage = models.FloatField(null=True, blank=True)
    pg_amount = models.FloatField(null=True, blank=True)
    total_value_iso = models.FloatField(null=True, blank=True)
    total_cost_iso = models.FloatField(null=True, blank=True)
    initial_gp_planned = models.FloatField(null=True, blank=True)
    gp_after_tax = models.FloatField(null=True, blank=True)
    sales_promo = models.FloatField(null=True, blank=True)
    final_gp_after_promo = models.FloatField(null=True, blank=True)
    total_financial_charges = models.FloatField(null=True, blank=True)
    initial_gp_percentage = models.FloatField(null=True, blank=True)
    final_gp_percentage = models.FloatField(null=True, blank=True)
    final_gp_after_financial = models.FloatField(null=True, blank=True)
    client = models.ForeignKey(Client, on_delete=models.CASCADE)
    city = models.CharField(max_length=50,null=True, blank=True)
    shipping_address = models.CharField(max_length=200,null=True, blank=True)
    customer_po_no = models.CharField(max_length=100,null=True, blank=True)
    po_doc = models.CharField(max_length=100,null=True, blank=True)
    mode_of_shipment = models.CharField(max_length=100,null=True, blank=True)
    sales_person = models.ForeignKey(Employee, on_delete=models.CASCADE,null=True, blank=True, related_name='sales_employee')
    approved_by = models.ForeignKey(Employee, on_delete=models.CASCADE,null=True, blank=True, related_name='approval_employee')
    exchange_rate = models.FloatField(null=True, blank=True)
    delivery_type = models.CharField(max_length=50,null=True)
    iso_no = models.CharField(max_length=50,unique=True,null=True, blank=True)
    em_duration = models.FloatField(null=True, blank=True)
    bg_duration = models.FloatField(null=True, blank=True)
    pg_duration = models.FloatField(null=True, blank=True)
    em_fc_amount = models.FloatField(null=True, blank=True)
    bg_fc_amount = models.FloatField(null=True, blank=True)
    pg_fc_amount = models.FloatField(null=True, blank=True)
    fc_markup = models.FloatField(null=True, blank=True)
    fc_amount = models.FloatField(null=True, blank=True)
    advance_percentage = models.FloatField(null=True, blank=True)
    advance_amount = models.FloatField(null=True, blank=True)
    sale_promo_percentage = models.FloatField(null=True, blank=True)
    total_delivery_charges = models.FloatField(null=True, blank=True)
    beneficiary_payorder = models.CharField(max_length=50,null=True, blank=True)
    created_at = models.DateField(auto_now_add=True, null=True)
    updated_at = models.DateField(auto_now=True, null=True)
    deleted_at = models.DateField(null=True, blank=True)
    is_approved = models.IntegerField(default=0) 
    remarks = models.CharField(max_length=1000,null=True, blank=True)
    status = models.IntegerField(default=1) 
    class Meta:  
        db_table = "iso_master"

class Iso_detail(models.Model): 
    iso_master = models.ForeignKey(Iso_master, on_delete=models.CASCADE)
    item = models.ForeignKey(Item, on_delete=models.CASCADE)
    delivery_type = models.CharField(max_length=50,null=True, blank=True)
    sales_tax_category = models.ForeignKey(Tax, on_delete=models.CASCADE)
    gst_percentage = models.FloatField(null=True, blank=True)
    import_factor = models.FloatField(null=True, blank=True)
    currency = models.CharField(max_length=10,null=True, blank=True)
    currency_rate = models.FloatField(null=True, blank=True)
    unit = models.IntegerField(null=True, blank=True)
    unit_weight = models.FloatField(null=True, blank=True)
    per_kg_rate = models.FloatField(null=True, blank=True)
    unit_cost = models.FloatField(null=True, blank=True)
    unit_cost_exchange_rate = models.FloatField(null=True, blank=True)
    total_without_import = models.FloatField(null=True, blank=True)
    total_with_import = models.FloatField(null=True, blank=True)
    gp_calculation = models.FloatField(null=True, blank=True)
    unit_selling_pkr = models.FloatField(null=True, blank=True)
    delivery_charges = models.FloatField(null=True, blank=True)
    total_selling_price = models.FloatField(null=True, blank=True)
    gst_amount = models.FloatField(null=True, blank=True)
    total_with_gst = models.FloatField(null=True, blank=True)
    tax_adjusment_amt = models.FloatField(null=True, blank=True)
    final_amt = models.FloatField(null=True, blank=True)
    gp_percentage = models.FloatField(null=True, blank=True)
    gp_amount = models.FloatField(null=True, blank=True)
    tax_adjusment = models.FloatField(null=True, blank=True)
    created_at = models.DateField(auto_now_add=True, null=True)
    updated_at = models.DateField(auto_now=True, null=True)
    deleted_at = models.DateField(null=True, blank=True)
    status = models.IntegerField(default=1) 
    class Meta:  
        db_table = "iso_detail"

class Setting(models.Model): 
    fc_markup_percentage = models.FloatField(null=True, blank=True)
    em_fc_ratio = models.FloatField(null=True, blank=True) 
    bg_fc_ratio = models.FloatField(null=True, blank=True) 
    per_kg_rate = models.FloatField(null=True, blank=True) 
    created_at = models.DateField(auto_now_add=True, null=True)
    updated_at = models.DateField(auto_now=True, null=True)
    deleted_at = models.DateField(null=True, blank=True)
    status = models.IntegerField(default=1) 
    class Meta:  
        db_table = "setting"    