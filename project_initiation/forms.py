from django import forms  
from project_initiation.models import Tendor, Unit, Category, Item, Heading, Sub_heading, Boq_items

class TendorForm(forms.ModelForm):  
    class Meta:  
        model = Tendor  
        fields = ('id','title', 'tendor_no', 'department','client', 'isadpscheme','adpscheme_no', 'em_percentage', 'bg_percentage', 'ad_description', 'lastdate_to_collect', 'lastdate_of_submission', 'date_of_collection', 'date_of_submission', 'special_instruction', 'tendor_collected_by')

class UnitForm(forms.ModelForm):  
    class Meta:  
        model = Unit  
        fields = ('id','name')

class CategoryForm(forms.ModelForm):  
    class Meta:  
        model = Category  
        fields = ('id','title')

class ItemForm(forms.ModelForm):  
    class Meta:  
        model = Item  
        fields = ('id','name', 'short_name', 'description', 'unit', 'category')

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