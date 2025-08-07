from django import forms  
from project_initiation.models import Tax, Tendor, Unit, Category, Item, Heading, Sub_heading, Boq_items, Iso_detail, Iso_master

class TendorForm(forms.ModelForm):  
    class Meta:  
        model = Tendor  
        fields = ('id','title', 'tendor_no', 'department','client', 'isadpscheme','adpscheme_no', 'em_percentage', 'bg_percentage', 'ad_description', 'lastdate_to_collect', 'lastdate_of_submission', 'date_of_collection', 'date_of_submission', 'special_instruction', 'tendor_collected_by')

class UnitForm(forms.ModelForm):  
    class Meta:  
        model = Unit  
        fields = ('id','name')

class TaxForm(forms.ModelForm):  
    class Meta:  
        model = Tax  
        fields = ('id','name','percentage')

class CategoryForm(forms.ModelForm):  
    class Meta:  
        model = Category  
        fields = ('id','title')

class ItemForm(forms.ModelForm):  
    class Meta:  
        model = Item  
        fields = ('id','name', 'short_name', 'description', 'unit', 'category', 'maker', 'model')

class HeadingForm(forms.ModelForm):  
    class Meta:  
        model = Heading  
        fields = ('id','title', 'tendor')

class Sub_headingForm(forms.ModelForm):  
    class Meta:  
        model = Sub_heading  
        fields = ('id','title', 'heading', 'tendor', 'isgroup')

class Boq_itemsForm(forms.ModelForm):  
    class Meta:  
        model = Boq_items  
        fields = ('id','item', 'heading', 'sub_heading', 'tendor', 'groupid', 'unit', 'unit_price', 'quantity', 'total_amount', 'is_imported', 'currency', 'conversion_rate')

class Iso_masterForm(forms.ModelForm):  
    class Meta:  
        model = Iso_master  
        fields = ('id','tendor', 'version', 'date', 'delivery_date_committed', 'delivery_date_required', 'payment_term', 'em_percentage', 'em_amount', 'bg_percentage', 'bg_amount', 'pg_percentage', 'pg_amount', 'total_value_iso', 'total_cost_iso', 'initial_gp_planned', 'gp_after_tax', 'sales_promo', 'final_gp_after_promo', 'total_financial_charges', 'initial_gp_percentage', 'final_gp_percentage', 'final_gp_after_financial', 'client', 'city', 'shipping_address', 'customer_po_no', 'po_doc', 'mode_of_shipment', 'sales_person', 'approved_by', 'exchange_rate', 'delivery_type')

class Iso_detailForm(forms.ModelForm):  
    class Meta:  
        model = Iso_detail  
        fields = ('id','iso_master','item', 'delivery_type', 'sales_tax_category', 'gst_percentage', 'import_factor', 'currency', 'currency_rate', 'unit', 'unit_cost', 'unit_cost_exchange_rate', 'total_without_import', 'total_with_import', 'gp_calculation', 'unit_selling_pkr', 'delivery_charges', 'total_selling_price', 'gst_amount', 'total_with_gst', 'tax_adjusment_amt', 'gp_percentage', 'gp_amount','remarks')