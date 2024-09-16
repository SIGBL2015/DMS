from finance.forms import Chart_of_accountsForm, Journal_entryForm
from finance.models import Chart_of_accounts, Journal_entry
from django.contrib.auth.decorators import login_required, permission_required
from django.shortcuts import get_object_or_404, render, redirect  
# Create your views here.


# Chart_of_accounts
@login_required 
@permission_required('finance.add_chart_of_accounts', raise_exception=True)  
def add_coa(request):  
    if request.method == "POST":  
        form = Chart_of_accountsForm(request.POST) 
        if form.is_valid():
            try:  
                form.save()  
                return redirect('show_coa')  
            except Exception as e:  
  
                pass  
    else:  
        form = Chart_of_accountsForm()  
        coas = Chart_of_accounts.objects.filter(status=1,parent_id__isnull=True).values('id','title')
    return render(request,'chart_of_accounts/add_coa.html',{'form':form, 'coas':coas})  

@login_required  
@permission_required('finance.view_chart_of_accounts', raise_exception=True)   
def show_coa(request):  
    coas = Chart_of_accounts.objects.filter(status=1)
    return render(request,"chart_of_accounts/show_coa.html",{'coas':coas})  

@login_required  
@permission_required('finance.change_chart_of_accounts', raise_exception=True) 
def e_coa(request, id):  
    coa = Chart_of_accounts.objects.get(id=id)  
    coas = Chart_of_accounts.objects.filter(status=1,parent_id__isnull=True).values('id','title')
    return render(request,'chart_of_accounts/e_coa.html', {'coa':coa, 'coas':coas})  

@login_required  
def u_coa(request, id):  
    coa = Chart_of_accounts.objects.get(id=id)  
    form = Chart_of_accountsForm(request.POST, instance = coa)  
    if form.is_valid():  
        form.save()  
        return redirect("show_coa")  
    return render(request, 'chart_of_accounts/e_coa.html', {'coa': coa})  

@login_required  
@permission_required('finance.delete_chart_of_accounts', raise_exception=True) 
def d_coa(request, id):  
    coa = Chart_of_accounts.objects.get(id=id)  
    coa.status=0  
    coa.save()
    return redirect("show_coa")  


# Journal_entry
@login_required 
@permission_required('finance.add_journal_entry', raise_exception=True)  
def add_journal_entry(request):  
    if request.method == "POST":  
        form = Journal_entryForm(request.POST) 
        if form.is_valid():
            try:  
                form.save()  
                return redirect('show_journal_entry')  
            except Exception as e:  
  
                pass  
    else:  
        form = Journal_entryForm()  
        coas = Chart_of_accounts.objects.filter(status=1,parent_id__isnull=False).values('id','title')
    return render(request,'journal_entry/add_journal_entry.html',{'form':form, 'coas':coas})  

@login_required  
@permission_required('finance.view_journal_entry', raise_exception=True)   
def show_journal_entry(request):  
    journal_entries = Journal_entry.objects.filter(status=1)
    return render(request,"journal_entry/show_journal_entry.html",{'journal_entries':journal_entries})  

@login_required  
@permission_required('finance.change_journal_entry', raise_exception=True) 
def e_journal_entry(request, id):  
    journal_entry = Journal_entry.objects.get(id=id)  
    coas = Chart_of_accounts.objects.filter(status=1,parent_id__isnull=False).values('id','title')
    return render(request,'journal_entry/e_journal_entry.html', {'journal_entry':journal_entry, 'coas':coas})  

@login_required  
def u_journal_entry(request, id):  
    journal_entry = Journal_entry.objects.get(id=id)  
    form = Journal_entryForm(request.POST, instance = journal_entry)  
    if form.is_valid():  
        form.save()  
        return redirect("show_journal_entry")  
    return render(request, 'journal_entry/e_journal_entry.html', {'journal_entry': journal_entry})  

@login_required  
@permission_required('finance.delete_journal_entry', raise_exception=True) 
def d_journal_entry(request, id):  
    journal_entry = Journal_entry.objects.get(id=id)  
    journal_entry.status=0  
    journal_entry.save()
    return redirect("show_journal_entry")  