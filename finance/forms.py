from django import forms  
from finance.models import Chart_of_accounts, Journal_entry, Payment_mode


class Payment_modeForm(forms.ModelForm):  
    class Meta:  
        model = Payment_mode  
        fields = ('id','title') 

class Chart_of_accountsForm(forms.ModelForm):  
    class Meta:  
        model = Chart_of_accounts  
        fields = ('id','title','short_code','parent') 

class Journal_entryForm(forms.ModelForm):  
    class Meta:  
        model = Journal_entry  
        fields = ('id','coaid', 'category_type', 'amount', 'transaction_type', 'payment_mode', 'project', 'bank', 'cheque_no', 'receive_person')