from datetime import datetime
import os
from django.conf import settings
from django.http import JsonResponse
from finance.forms import Chart_of_accountsForm, Journal_entryForm, Payment_modeForm
from finance.models import Chart_of_accounts, Journal_entry, Payment_mode, Account_type, Detail_type, Currency
from employee.models import Project, Bank, Branch
from django.contrib.auth.decorators import login_required, permission_required
from django.shortcuts import get_object_or_404, render, redirect  
from django.db.models import Q
from django.contrib import messages
# Create your views here.
from rest_framework.serializers import ModelSerializer

# Define the serializer
class ProjectSerializer(ModelSerializer):
    class Meta:
        model = Project
        fields = '__all__'

# Chart_of_accounts
@login_required 
@permission_required('finance.add_chart_of_accounts', raise_exception=True)  
def add_coa(request):  
    coas = Chart_of_accounts.objects.filter(status=1,parent_id__isnull=True).values('id','title')
    account_types = Account_type.objects.filter(status=1).values('id','title')
    if request.method == "POST":  
        form = Chart_of_accountsForm(request.POST) 
        title = request.POST.get('title')
        short_code = request.POST.get('short_code')
        coa = Chart_of_accounts.objects.filter(Q(title__iexact=title) | Q(short_code__iexact=short_code), status=1)
        if form.is_valid():
            if coa.exists():
                messages.error(request, "This Chart Of Account title or short code already exist.")
                return render(request,'chart_of_accounts/add_coa.html',{'form':form, 'coas':coas, 'account_types':account_types})  
            else:
                try:  
                    form.save()  
                    messages.success(request, "Data added successfully!") 
                    return redirect('show_coa')  
                except Exception as e:  
                    messages.error(request, f"Internal Server Error: {str(e)}")
                    return render(request,'chart_of_accounts/add_coa.html',{'form':form, 'coas':coas, 'account_types':account_types})  
        else:
            error_messages = form.errors.as_json()
            messages.error(request, f"Form validation failed: {error_messages}")
            return render(request,'chart_of_accounts/add_coa.html',{'form':form, 'coas':coas, 'account_types':account_types})  
    else:  
        form = Chart_of_accountsForm()
        return render(request,'chart_of_accounts/add_coa.html',{'form':form, 'coas':coas, 'account_types':account_types})  

@login_required  
@permission_required('finance.view_chart_of_accounts', raise_exception=True)   
def show_coa(request):  
    coas = Chart_of_accounts.objects.filter(status=1)
    return render(request,"chart_of_accounts/show_coa.html",{'coas':coas})  

@login_required  
@permission_required('finance.change_chart_of_accounts', raise_exception=True) 
def e_coa(request, id):  
    coa = Chart_of_accounts.objects.get(id=id)  
    account_types = Account_type.objects.filter(status=1).values('id','title')
    coas = Chart_of_accounts.objects.filter(status=1,parent_id__isnull=True).values('id','title')
    return render(request,'chart_of_accounts/e_coa.html', {'coa':coa, 'coas':coas, 'account_types':account_types})  

@login_required  
def u_coa(request, id):  
    coa = Chart_of_accounts.objects.get(id=id)
    original_title = coa.title  # Preserve the original title
    original_short_code = coa.short_code
    account_types = Account_type.objects.filter(status=1).values('id','title')
    coas = Chart_of_accounts.objects.filter(status=1,parent_id__isnull=True).values('id','title')
    form = Chart_of_accountsForm(request.POST, instance = coa)  
    title = request.POST.get('title')
    short_code = request.POST.get('short_code')
    # Check for duplicates excluding the current record
    duplicate_title = Chart_of_accounts.objects.filter(title__iexact=title, status=1).exclude(id=id).exists()
    duplicate_short_code = Chart_of_accounts.objects.filter(short_code__iexact=short_code, status=1).exclude(id=id).exists()
    if form.is_valid():  
        if duplicate_title or duplicate_short_code:
            # Revert conflicting fields to their original values
            if duplicate_title:
                form.instance.title = original_title  # Revert to original title
                messages.error(request, "The title already exists and was not updated.")
            if duplicate_short_code:
                form.instance.short_code = original_short_code  # Revert to original short_code
                messages.error(request, "The short code already exists and was not updated.")

        form.save()  
        messages.success(request, "Data updated successfully (except for conflicting fields)!")
        return redirect("show_coa")  
    error_messages = form.errors.as_json()
    messages.error(request, f"Form validation failed: {error_messages}")  
    return render(request,'chart_of_accounts/e_coa.html', {'coa':coa, 'coas':coas, 'account_types':account_types})  

@login_required  
@permission_required('finance.delete_chart_of_accounts', raise_exception=True) 
def d_coa(request, id):  
    coa = Chart_of_accounts.objects.get(id=id)  
    coa.status=0  
    coa.save()
    messages.success(request, "Data Deleted successfully!")
    return redirect("show_coa")  


# Journal_entry Expense
@login_required 
@permission_required('finance.add_journal_entry', raise_exception=True)  
def add_journal_entry(request):  
    coas = Chart_of_accounts.objects.filter(status=1,parent_id__isnull=False).values('id','title')
    currency = Currency.objects.filter(status=1).values('id','name')
    projects = Project.objects.filter(status=1).values('id','title')
    banks = Bank.objects.filter(status=1).values('id','bank_name')
    modes = Payment_mode.objects.filter(status=1).values('id','title')
    branches = Branch.objects.filter(status=1).values('id','branch_name')
    if request.method == "POST":  
        form = Journal_entryForm(request.POST, request.FILES)
        if form.is_valid():
            try: 
                file_instance = form.save(commit=False)
                if 'doc_path' in request.FILES:
                    # Generate folder path dynamically
                    folder_name = str(file_instance.project.id)
                    folder_path = os.path.join(settings.MEDIA_ROOT,'project',folder_name,'expense_document')
                    
                    if not os.path.exists(folder_path):
                        os.makedirs(folder_path)
                    # Generate file path dynamically
                    timestamp = datetime.now().strftime('%Y%m%d%H%M%S')
                    new_file_name = f"{file_instance.project.id}_{file_instance.ref_no}_{timestamp}{os.path.splitext(request.FILES['doc_path'].name)[1]}"
                    file_path = os.path.join(folder_path, new_file_name)
                    # Save file to the generated path
                    with open(file_path, 'wb') as f:
                        for chunk in request.FILES['doc_path'].chunks():
                            f.write(chunk)
                    # Update the file field with the relative path to the file
                    file_instance.doc_path = os.path.relpath(file_path, settings.MEDIA_ROOT)
                file_instance.coa_type ='Expense Payable'
                file_instance.transaction_type ='Debit'
                file_instance.current_status ='Payable'
                # file_instance.status_change_date = datetime.now().date()
                file_instance.save() 
                messages.success(request, "Data added successfully!")   
                return redirect('show_journal_entry')  
            except Exception as e:  
                messages.error(request, f"Internal Server Error: {str(e)}")
                return render(request,'journal_entry/add_journal_entry.html',{'form':form, 'coas':coas, 'projects':projects, 'banks':banks, 'modes':modes,'branches':branches,'currency':currency})  
        else:
            error_messages = form.errors.as_json()
            messages.error(request, f"Form validation failed: {error_messages}")
            return render(request,'journal_entry/add_journal_entry.html',{'form':form, 'coas':coas, 'projects':projects, 'banks':banks, 'modes':modes,'branches':branches,'currency':currency})     
    else:  
        form = Journal_entryForm()  
        return render(request,'journal_entry/add_journal_entry.html',{'form':form, 'coas':coas, 'projects':projects, 'banks':banks, 'modes':modes,'branches':branches,'currency':currency})  

@login_required 
@permission_required('finance.add_journal_entry', raise_exception=True)  
def add_revenue_entry(request):  
    coas = Chart_of_accounts.objects.filter(status=1,parent_id__isnull=False).values('id','title')
    currency = Currency.objects.filter(status=1).values('id','name')
    projects = Project.objects.filter(status=1).values('id','title')
    banks = Bank.objects.filter(status=1).values('id','bank_name')
    modes = Payment_mode.objects.filter(status=1).values('id','title')
    branches = Branch.objects.filter(status=1).values('id','branch_name')
    if request.method == "POST":  
        form = Journal_entryForm(request.POST, request.FILES)
        if form.is_valid():
            try: 
                file_instance = form.save(commit=False)
                if 'doc_path' in request.FILES:
                    # Generate folder path dynamically
                    folder_name = str(file_instance.project.id)
                    folder_path = os.path.join(settings.MEDIA_ROOT,'project',folder_name,'expense_document')
                    
                    if not os.path.exists(folder_path):
                        os.makedirs(folder_path)
                    # Generate file path dynamically
                    timestamp = datetime.now().strftime('%Y%m%d%H%M%S')
                    new_file_name = f"{file_instance.project.id}_{file_instance.ref_no}_{timestamp}{os.path.splitext(request.FILES['doc_path'].name)[1]}"
                    file_path = os.path.join(folder_path, new_file_name)
                    # Save file to the generated path
                    with open(file_path, 'wb') as f:
                        for chunk in request.FILES['doc_path'].chunks():
                            f.write(chunk)
                    # Update the file field with the relative path to the file
                    file_instance.doc_path = os.path.relpath(file_path, settings.MEDIA_ROOT)
                file_instance.coa_type ='Revenue Receivable'
                file_instance.transaction_type ='Credit'
                file_instance.current_status ='Receivable'
                # file_instance.status_change_date = datetime.now().date()
                file_instance.save() 
                messages.success(request, "Data added successfully!")   
                return redirect('show_revenue_entry')  
            except Exception as e:  
                messages.error(request, f"Internal Server Error: {str(e)}")
                return render(request,'journal_entry/add_revenue_entry.html',{'form':form, 'coas':coas, 'projects':projects, 'banks':banks, 'modes':modes,'branches':branches,'currency':currency})  
        else:
            error_messages = form.errors.as_json()
            messages.error(request, f"Form validation failed: {error_messages}")
            return render(request,'journal_entry/add_revenue_entry.html',{'form':form, 'coas':coas, 'projects':projects, 'banks':banks, 'modes':modes,'branches':branches,'currency':currency})     
    else:  
        form = Journal_entryForm()  
        return render(request,'journal_entry/add_revenue_entry.html',{'form':form, 'coas':coas, 'projects':projects, 'banks':banks, 'modes':modes,'branches':branches,'currency':currency})  


@login_required  
@permission_required('finance.view_journal_entry', raise_exception=True)   
def show_journal_entry(request):  
    journal_entries = Journal_entry.objects.filter(coa_type='Expense Payable',status=1)
    return render(request,"journal_entry/show_journal_entry.html",{'journal_entries':journal_entries})

@login_required  
@permission_required('finance.view_journal_entry', raise_exception=True)   
def show_revenue_entry(request):  
    journal_entries = Journal_entry.objects.filter(coa_type='Revenue Receivable',status=1)
    return render(request,"journal_entry/show_revenue_entry.html",{'journal_entries':journal_entries})  

@login_required  
@permission_required('finance.change_journal_entry', raise_exception=True) 
def e_journal_entry(request, id):  
    journal_entry = Journal_entry.objects.get(id=id)  
    coas = Chart_of_accounts.objects.filter(status=1,parent_id__isnull=False).values('id','title')
    projects = Project.objects.filter(status=1).values('id','title')
    banks = Bank.objects.filter(status=1).values('id','bank_name')
    modes = Payment_mode.objects.filter(status=1).values('id','title')
    branches = Branch.objects.filter(status=1).values('id','branch_name')
    return render(request,'journal_entry/e_journal_entry.html', {'journal_entry':journal_entry, 'coas':coas, 'projects':projects, 'banks':banks, 'modes':modes,'branches':branches})  

@login_required  
def u_journal_entry(request, id):  
    journal_entry = Journal_entry.objects.get(id=id)  
    form = Journal_entryForm(request.POST, instance = journal_entry)  
    if form.is_valid():  
        form.save()  
        messages.success(request, "Data Updated successfully!")  
        return redirect("show_journal_entry")  
    error_messages = form.errors.as_json()
    messages.error(request, f"Form validation failed: {error_messages}")
    return render(request, 'journal_entry/e_journal_entry.html', {'journal_entry': journal_entry})

@login_required  
def u_status(request):  
    journal_entry = Journal_entry.objects.get(id=request.POST.get('lead')) 
    status ='' 
    if request.POST.get('check') =='revenue':
        status='Received'   
    else:
        status='Paid'
    journal_entry.current_status=status
    journal_entry.status_change_date= request.POST.get('status_change_date')
    journal_entry.save()
    messages.success(request, "Data Updated successfully!")  
    return JsonResponse({'status': 'success'}, status=200) 
    

@login_required  
@permission_required('finance.delete_journal_entry', raise_exception=True) 
def d_journal_entry(request, id):  
    journal_entry = Journal_entry.objects.get(id=id)  
    journal_entry.status=0  
    journal_entry.save()
    messages.success(request, "Data Deleted successfully!")
    return redirect("show_journal_entry")  

def generate_refno(request):
    ref = Journal_entry.objects.filter(status=1).values('ref_no').last()
    # Get the current date in 'YYYYMMDD' format
    current_date = datetime.now().strftime('%Y%m%d')
    if(ref != None):

        last=ref['ref_no']
        
        # Split the input string by '-'
        parts =last.split('-')
        
        # The last part (e.g., '001') needs to be incremented
        last_ref = parts[-1]
        
        # Convert the last part to an integer, increment it by 1
        incremented_ref = str(int(last_ref) + 1).zfill(3)  # zfill(3) ensures it's always 3 digits
        
        # Reconstruct the string by joining the parts with '-'
        new_string = '-'.join(['SIGBL',current_date,incremented_ref])
    else:
        # Reconstruct the string by joining the parts with '-'
        new_string = '-'.join(['SIGBL',current_date,'001'])
    return JsonResponse({'generated_code': new_string})

#Generate Report
@login_required 
# @permission_required('employee.add_employee_project', raise_exception=True)
def generate_pnl(request):  
    if request.method == "POST":    
        # Initialize the queryset
        project = request.POST.get('project')
        from_date = request.POST.get('from_date')
        to_date = request.POST.get('to_date')
        query = Journal_entry.objects.filter(created_at__range=[from_date, to_date],project=project)
        cost = Project.objects.get(id=project)

        total = sum([item.total_amount for item in query])
        pnl= cost.amount - total
        return render(request, 'journal_entry/generate_pnl.html', {'data': query, 'cost':cost.amount,'pnl':pnl, 'project':cost})
    else:  
        projects = Project.objects.filter(status=1).values('id','title')
    return render(request,'journal_entry/pnl_report.html',{'projects':projects})

def load_detail(request):
    account_type = request.GET.get('account_type')
    detail_type = Detail_type.objects.filter(account_type=account_type,status=1).order_by('title')
    return JsonResponse(list(detail_type.values('id', 'title')), safe=False)

def load_account(request):
    coaid = request.GET.get('coaid')
    account = Chart_of_accounts.objects.get(id=coaid,status=1)
    return JsonResponse({"account":account.account_type.title,"detail":account.detail_type.title}, safe=False)

#Generate Report
@login_required 
# @permission_required('employee.add_employee_project', raise_exception=True)
def generate_balance_sheet(request):  
    if request.method == "POST":    
        # Initialize the queryset
        project = request.POST.get('project')
        from_date = request.POST.get('from_date')
        to_date = request.POST.get('to_date')
        query = Journal_entry.objects.filter(project=project)
        # print(query[0].bank.bank_name)
        _project = Project.objects.get(id=project)
        # Use the serializer
        project_data = ProjectSerializer(_project).data
        total = sum([item.total_amount for item in query])
        pnl= _project.amount - total
        query_data = list(query.values())
        data ={'data': query_data, 'cost':_project.amount,'pnl':pnl, 'project':project_data}
        # print(data)
        return JsonResponse({'status': 'success', 'final_data': data}, status=200)
        return render(request, 'journal_entry/generate_pnl.html', {'data': query, 'cost':cost.amount,'pnl':pnl, 'project':cost})
    else:  
        projects = Project.objects.filter(status=1).values('id','title')
    return render(request,'journal_entry/balance_sheet.html',{'projects':projects})
