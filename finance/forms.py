from django import forms  
from finance.models import Currency, Account_type, Detail_type, Chart_of_accounts, Journal_entry, Payment_mode


class CurrencyForm(forms.ModelForm):  
    class Meta:  
        model = Currency  
        fields = ('id','name', 'country')

class Payment_modeForm(forms.ModelForm):  
    class Meta:  
        model = Payment_mode  
        fields = ('id','title') 

class Account_typeForm(forms.ModelForm):  
    class Meta:  
        model = Account_type  
        fields = ('id','title','short_code')

class Detail_typeForm(forms.ModelForm):  
    class Meta:  
        model = Detail_type  
        fields = ('id','title','short_code','account_type')

class Chart_of_accountsForm(forms.ModelForm):  
    class Meta:  
        model = Chart_of_accounts  
        fields = ('id','title','short_code','account_type','detail_type','parent') 

class Journal_entryForm(forms.ModelForm):  
    class Meta:  
        model = Journal_entry  
        fields = ('id','coaid', 'currency', 'amount','conversion_rate','total_amount', 'transaction_type', 'payment_mode', 'project', 'bank', 'cheque_no', 'branch', 'ref_no', 'receive_person','description','doc_path')