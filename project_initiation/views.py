from django.http import JsonResponse
from django.shortcuts import redirect, render
from datetime import datetime
import os
from django.conf import settings
from employee.models import Client, Department
from finance.models import Currency
from project_initiation.forms import TaxForm, TendorForm, UnitForm, CategoryForm, ItemForm, HeadingForm, Sub_headingForm, Boq_itemsForm
from project_initiation.models import Tax, Tendor, Unit, Category, Item, Heading, Sub_heading, Boq_items
from django.contrib.auth.decorators import login_required, permission_required
from django.db.models import Q
from django.contrib import messages

# Create your views here.
# tendor
@login_required 
@permission_required('project_initiation.add_tendor', raise_exception=True)  
def add_tendor(request):  
    departments = Department.objects.filter(status=1).values('id','depart_name')
    clients = Client.objects.filter(status=1).values('id','client_name')
    if request.method == "POST":  
        form = TendorForm(request.POST, request.FILES)
        tendor_no = request.POST.get('tendor_no')
        title = request.POST.get('title')
        old_tendor = Tendor.objects.filter(Q(tendor_no__iexact=tendor_no) | Q(title__iexact=title), status=1) 
        try:  
            if form.is_valid():
                if old_tendor.exists():
                    messages.error(request, "This Tendor title or Tendor Number already exist.")
                    return render(request,'tendor/add_tendor.html',{'form':form, 'departments':departments,'clients':clients})  
                else:
                    file_instance = form.save(commit=False)
                    file_instance.save()
                    if 'ad_image' in request.FILES:
                        # Generate folder path dynamically
                        folder_name = str(file_instance.id)
                        folder_path = os.path.join(settings.MEDIA_ROOT,'tendor',folder_name)
                        
                        if not os.path.exists(folder_path):
                            os.makedirs(folder_path)
                        # Generate file path dynamically
                        timestamp = datetime.now().strftime('%Y%m%d%H%M%S')
                        new_file_name = f"{file_instance.id}_{file_instance.tendor_no}_{timestamp}{os.path.splitext(request.FILES['ad_image'].name)[1]}"
                        file_path = os.path.join(folder_path, new_file_name)
                        # Save file to the generated path
                        with open(file_path, 'wb') as f:
                            for chunk in request.FILES['ad_image'].chunks():
                                f.write(chunk)
                        # Update the file field with the relative path to the file
                        file_instance.ad_image = os.path.relpath(file_path, settings.MEDIA_ROOT)
                    file_instance.save() 
                    messages.success(request, "Data added successfully!")   
                    return redirect('show_tendor')
            else:  
                error_messages = form.errors.as_json()
                messages.error(request, f"Form validation failed: {error_messages}")
                return render(request,'tendor/add_tendor.html',{'form':form, 'departments':departments,'clients':clients})  
        except Exception as e:  
            messages.error(request, f"Internal Server Error: {str(e)}")
            return render(request,'tendor/add_tendor.html',{'form':form, 'departments':departments,'clients':clients})  
    else:  
        form = TendorForm() 
        return render(request,'tendor/add_tendor.html',{'form':form, 'departments':departments,'clients':clients})  

@login_required  
@permission_required('project_initiation.view_tendor', raise_exception=True)   
def show_tendor(request):  
    tendors = Tendor.objects.filter(status=1)
    return render(request,"tendor/show_tendor.html",{'tendors':tendors})  

@login_required  
@permission_required('project_initiation.change_tendor', raise_exception=True) 
def e_tendor(request, id):  
    tendor = Tendor.objects.get(id=id)  
    departments = Department.objects.filter(status=1).values('id','depart_name')
    clients = Client.objects.filter(status=1).values('id','client_name')
    return render(request,'tendor/e_tendor.html', {'tendor':tendor, 'departments':departments,'clients':clients})  

@login_required  
def u_tendor(request, id):  
    tendor = Tendor.objects.get(id=id)  
    original_title = tendor.title  # Preserve the original title
    original_tendor_no = tendor.tendor_no
    tendor_no = request.POST.get('tendor_no')
    title = request.POST.get('title')
    old_tendor_no = Tendor.objects.filter(tendor_no__iexact=tendor_no, status=1) 
    old_tendor_title = Tendor.objects.filter(title__iexact=title, status=1) 
    old_path = tendor.ad_image   
    form = TendorForm(request.POST, request.FILES, instance = tendor) 
    try:  
        if form.is_valid():
            if old_tendor_no or old_tendor_title:
                # Revert conflicting fields to their original values
                if old_tendor_title:
                    form.instance.title = original_title  # Revert to original title
                    messages.error(request, "The title already exists and was not updated.")
                if old_tendor_no:
                    form.instance.tendor_no = original_tendor_no  # Revert to original short_code
                    messages.error(request, "The Tendor number already exists and was not updated.")

            file_instance = form.save(commit=False)
            if 'ad_image' in request.FILES:
                # Generate folder path dynamically
                folder_name = str(file_instance.id)
                folder_path = os.path.join(settings.MEDIA_ROOT,'tendor',folder_name)
                
                if not os.path.exists(folder_path):
                    os.makedirs(folder_path)
                # Generate file path dynamically
                timestamp = datetime.now().strftime('%Y%m%d%H%M%S')
                new_file_name = f"{file_instance.id}_{file_instance.tendor_no}_{timestamp}{os.path.splitext(request.FILES['ad_image'].name)[1]}"
                file_path = os.path.join(folder_path, new_file_name)

                if old_path and os.path.exists(os.path.join(settings.MEDIA_ROOT, old_path)):
                        os.remove(os.path.join(settings.MEDIA_ROOT, old_path))
                # Save file to the generated path
                with open(file_path, 'wb') as f:
                    for chunk in request.FILES['ad_image'].chunks():
                        f.write(chunk)
                # Update the file field with the relative path to the file
                file_instance.ad_image = os.path.relpath(file_path, settings.MEDIA_ROOT)
            file_instance.save()
            messages.success(request, "Data updated successfully (except for conflicting fields)!")    
            return redirect('show_tendor')    
        else:
            error_messages = form.errors.as_json()
            messages.error(request, f"Project Form validation failed: {error_messages}")
            return render(request, 'tendor/e_tendor.html', {'tendor': tendor}) 
    except Exception as e: 
        messages.error(request, f"Internal Server Error: {str(e)}") 
        return render(request, 'tendor/e_tendor.html', {'tendor': tendor}) 
  

@login_required  
@permission_required('project_initiation.delete_tendor', raise_exception=True) 
def d_tendor(request, id):  
    tendor = Tendor.objects.get(id=id)  
    tendor.status=0  
    tendor.save()
    messages.success(request, "Data Deleted successfully!")
    return redirect("show_tendor")  


# Unit
@login_required 
@permission_required('project_initiation.add_unit', raise_exception=True)
def add_unit(request): 
    if request.method == "POST":  
        form = UnitForm(request.POST) 
        name = request.POST.get('name').strip().lower()
        old_unit = Unit.objects.filter(name__iexact=name, status=1)
        if form.is_valid():
            if old_unit.exists():
                messages.error(request, "This Unit already exist.")
                return render(request,'unit/add_unit.html',{'form':form})   
            else:
                try:  
                    form.save()  
                    messages.success(request, "Data added successfully!")
                    return redirect('show_unit')  
                except Exception as e:  
                    messages.error(request, f"Internal Server Error: {str(e)}")
                    return render(request,'unit/add_unit.html',{'form':form}) 
        else:
            error_messages = form.errors.as_json()
            messages.error(request, f"Form validation failed: {error_messages}")
            return render(request,'unit/add_unit.html',{'form':form})  
    else:  
        form = UnitForm() 
        return render(request,'unit/add_unit.html',{'form':form})  

@login_required    
@permission_required('project_initiation.view_unit', raise_exception=True)
def show_unit(request):  
    units = Unit.objects.filter(status=1)  
    return render(request,"unit/show_unit.html",{'units':units})  

@login_required  
@permission_required('project_initiation.change_unit', raise_exception=True)
def e_unit(request, id):  
    unit = Unit.objects.get(id=id) 
    return render(request,'unit/e_unit.html', {'unit':unit})  

@login_required  
def u_unit(request, id):  
    unit = Unit.objects.get(id=id)  
    form = UnitForm(request.POST, instance = unit)  
    name = request.POST.get('name').strip().lower()
    old_unit = Unit.objects.filter(name__iexact=name, status=1)
    if form.is_valid():
        if old_unit.exists():
            messages.error(request, "This Unit already exist.")
            return redirect("show_unit")    
        else:  
            form.save()  
            messages.success(request, "Data Updated successfully!")   
            return redirect("show_unit") 
    error_messages = form.errors.as_json()
    messages.error(request, f"Form validation failed: {error_messages}")   
    return render(request, 'unit/e_unit.html', {'unit': unit})  

@login_required  
@permission_required('project_initiation.delete_unit', raise_exception=True)
def d_unit(request, id):  
    unit = Unit.objects.get(id=id)  
    unit.status=0  
    unit.save()
    messages.success(request, "Data Deleted successfully!")
    return redirect("show_unit")


# Tax
@login_required 
@permission_required('project_initiation.add_tax', raise_exception=True)
def add_tax(request): 
    if request.method == "POST":  
        form = TaxForm(request.POST) 
        name = request.POST.get('name').strip().lower()
        old_tax = Tax.objects.filter(name__iexact=name, status=1)
        if form.is_valid():
            if old_tax.exists():
                messages.error(request, "This Tax already exist.")
                return render(request,'tax/add_tax.html',{'form':form})
            else:
                try:  
                    form.save()
                    messages.success(request, "Data added successfully!")  
                    return redirect('show_tax')  
                except Exception as e: 
                    messages.error(request, f"Internal Server Error: {str(e)}")
                    return render(request,'tax/add_tax.html',{'form':form}) 
        else:
            error_messages = form.errors.as_json()
            messages.error(request, f"Form validation failed: {error_messages}")
            return render(request,'tax/add_tax.html',{'form':form})
    else:  
        form = TaxForm() 
        return render(request,'tax/add_tax.html',{'form':form})  

@login_required    
@permission_required('project_initiation.view_tax', raise_exception=True)
def show_tax(request):  
    taxes = Tax.objects.filter(status=1)  
    return render(request,"tax/show_tax.html",{'taxes':taxes})  

@login_required  
@permission_required('project_initiation.change_tax', raise_exception=True)
def e_tax(request, id):  
    tax = Tax.objects.get(id=id) 
    return render(request,'tax/e_tax.html', {'tax':tax})  

@login_required  
def u_tax(request, id):  
    tax = Tax.objects.get(id=id)  
    original_name = tax.name
    form = TaxForm(request.POST, instance = tax) 
    name = request.POST.get('name').strip().lower()
    old_tax = Tax.objects.filter(name__iexact=name, status=1) 
    if form.is_valid():  
        if old_tax.exists():
            messages.error(request, "This Tax already exist.")
            form.instance.name = original_name  
        
        form.save()  
        messages.success(request, "Data Updated successfully (except for conflicting fields)!")   
        return redirect("show_tax")  
    error_messages = form.errors.as_json()
    messages.error(request, f"Form validation failed: {error_messages}")  
    return render(request, 'tax/e_tax.html', {'tax': tax})  

@login_required  
@permission_required('project_initiation.delete_tax', raise_exception=True)
def d_tax(request, id):  
    tax = Tax.objects.get(id=id)  
    tax.status=0  
    tax.save()
    messages.success(request, "Data Deleted successfully!")
    return redirect("show_tax")


# Category
@login_required 
@permission_required('project_initiation.add_category', raise_exception=True)
def add_category(request): 
    if request.method == "POST":  
        form = CategoryForm(request.POST) 
        title = request.POST.get('title').strip().lower()
        cat = Category.objects.filter(title__iexact=title, status=1)
        if form.is_valid():
            if cat.exists():
                messages.error(request, "This Category already exist.")
                return render(request,'category/add_category.html',{'form':form})   
            else:
                try:  
                    form.save()  
                    messages.success(request, "Data added successfully!")
                    return redirect('show_category')  
                except Exception as e:  
                    messages.error(request, f"Internal Server Error: {str(e)}")
                    return render(request,'category/add_category.html',{'form':form})
        else:
            error_messages = form.errors.as_json()
            messages.error(request, f"Form validation failed: {error_messages}")
            return render(request,'category/add_category.html',{'form':form})  
    else:  
        form = CategoryForm()
        return render(request,'category/add_category.html',{'form':form})  

@login_required    
@permission_required('project_initiation.view_category', raise_exception=True)
def show_category(request):  
    categories = Category.objects.filter(status=1)  
    return render(request,"category/show_category.html",{'categories':categories})  

@login_required  
@permission_required('project_initiation.change_category', raise_exception=True)
def e_category(request, id):  
    category = Category.objects.get(id=id) 
    return render(request,'category/e_category.html', {'category':category})  

@login_required  
def u_category(request, id):  
    category = Category.objects.get(id=id)  
    form = CategoryForm(request.POST, instance = category)
    title = request.POST.get('title').strip().lower()
    cat = Category.objects.filter(title__iexact=title, status=1)  
    if form.is_valid():  
        if cat.exists():
            messages.error(request, "This Category already exist.")
            return redirect("show_category")
        else:
            form.save()  
            messages.success(request, "Data Updated successfully!")   
            return redirect("show_category")  
    error_messages = form.errors.as_json()
    messages.error(request, f"Form validation failed: {error_messages}")  
    return render(request, 'category/e_category.html', {'category': category})  

@login_required  
@permission_required('project_initiation.delete_category', raise_exception=True)
def d_category(request, id):  
    category = Category.objects.get(id=id)  
    category.status=0  
    category.save()
    messages.success(request, "Data Deleted successfully!")
    return redirect("show_category")


# Item
@login_required 
@permission_required('project_initiation.add_item', raise_exception=True)
def add_item(request): 
    units = Unit.objects.filter(status=1).values('id','name')
    categories = Category.objects.filter(status=1).values('id','title')
    if request.method == "POST":  
        form = ItemForm(request.POST) 
        name = request.POST.get('name')
        short_name = request.POST.get('short_name')
        itm = Item.objects.filter(Q(name__iexact=name) | Q(short_name__iexact=short_name), status=1)
        if form.is_valid():
            if itm.exists():
                messages.error(request, "This Item title or short name already exist.")
                return render(request,'item/add_item.html',{'form':form, 'units':units, 'categories':categories})  
            else:
                try:  
                    form.save()  
                    messages.success(request, "Data added successfully!") 
                    return redirect('show_item')  
                except Exception as e:  
                    messages.error(request, f"Internal Server Error: {str(e)}")
                    return render(request,'item/add_item.html',{'form':form, 'units':units, 'categories':categories})
        else:
            error_messages = form.errors.as_json()
            messages.error(request, f"Form validation failed: {error_messages}")  
            return render(request,'item/add_item.html',{'form':form, 'units':units, 'categories':categories})
    else:  
        form = ItemForm()
        return render(request,'item/add_item.html',{'form':form, 'units':units, 'categories':categories})  

@login_required    
@permission_required('project_initiation.view_item', raise_exception=True)
def show_item(request):  
    items = Item.objects.filter(status=1)  
    return render(request,"item/show_item.html",{'items':items})  

@login_required  
@permission_required('project_initiation.change_item', raise_exception=True)
def e_item(request, id):  
    item = Item.objects.get(id=id) 
    units = Unit.objects.filter(status=1).values('id','name')
    categories = Category.objects.filter(status=1).values('id','title')
    return render(request,'item/e_item.html', {'item':item, 'units':units, 'categories':categories})  

@login_required  
def u_item(request, id):  
    units = Unit.objects.filter(status=1).values('id','name')
    categories = Category.objects.filter(status=1).values('id','title')
    item = Item.objects.get(id=id)
    original_name = item.name  # Preserve the original title
    original_short_name = item.short_name 
    name = request.POST.get('name')
    short_name = request.POST.get('short_name') 
    duplicate_name = Item.objects.filter(name__iexact=name, status=1).exclude(id=id).exists()
    duplicate_short_name = Item.objects.filter(short_name__iexact=short_name, status=1).exclude(id=id).exists()
    form = ItemForm(request.POST, instance = item)  
    if form.is_valid():
        if duplicate_name or duplicate_short_name:
            # Revert conflicting fields to their original values
            if duplicate_name:
                form.instance.name = original_name  # Revert to original title
                messages.error(request, "The item name already exists and was not updated.")
            if duplicate_short_name:
                form.instance.short_name = original_short_name  # Revert to original short_code
                messages.error(request, "The item short name already exists and was not updated.")  
        form.save()  
        messages.success(request, "Data updated successfully (except for conflicting fields)!")
        return redirect("show_item")
    error_messages = form.errors.as_json()
    messages.error(request, f"Form validation failed: {error_messages}")    
    return render(request,'item/e_item.html', {'item':item, 'units':units, 'categories':categories})    

@login_required  
@permission_required('project_initiation.delete_item', raise_exception=True)
def d_item(request, id):  
    item = Item.objects.get(id=id)  
    item.status=0  
    item.save()
    messages.success(request, "Data Deleted successfully!")
    return redirect("show_item")


# Heading
@login_required 
@permission_required('project_initiation.add_heading', raise_exception=True)
def add_heading(request): 
    tendors = Tendor.objects.filter(status=1).values('id','title')
    if request.method == "POST":  
        form = HeadingForm(request.POST) 
        title = request.POST.get('title').strip().lower()
        if form.is_valid():
            head = Heading.objects.filter(title__iexact=title, tendor= request.POST.get('tendor'), status=1)
            if head.exists():
                messages.error(request, "This Heading against this tendor is already exist.")
                return render(request,'heading/add_heading.html',{'form':form, 'tendors':tendors})  
            else:
                try:  
                    form.save()  
                    messages.success(request, "Data added successfully!")
                    return redirect('show_heading')  
                except Exception as e:  
                    messages.error(request, f"Internal Server Error: {str(e)}")
                    return render(request,'heading/add_heading.html',{'form':form, 'tendors':tendors})  
        else:
            error_messages = form.errors.as_json()
            messages.error(request, f"Form validation failed: {error_messages}")  
            return render(request,'heading/add_heading.html',{'form':form, 'tendors':tendors})  
    else:  
        form = HeadingForm() 
        tendors = Tendor.objects.filter(status=1).values('id','title')
        return render(request,'heading/add_heading.html',{'form':form, 'tendors':tendors})  

@login_required    
@permission_required('project_initiation.view_heading', raise_exception=True)
def show_heading(request):  
    headings = Heading.objects.filter(status=1)  
    return render(request,"heading/show_heading.html",{'headings':headings})  

@login_required  
@permission_required('project_initiation.change_heading', raise_exception=True)
def e_heading(request, id):  
    heading = Heading.objects.get(id=id) 
    tendors = Tendor.objects.filter(status=1).values('id','title')
    return render(request,'heading/e_heading.html', {'heading':heading, 'tendors':tendors})  

@login_required  
def u_heading(request, id):  
    heading = Heading.objects.get(id=id) 
    tendors = Tendor.objects.filter(status=1).values('id','title') 
    form = HeadingForm(request.POST, instance = heading)  
    title = request.POST.get('title').strip().lower()
    if form.is_valid():
        head = Heading.objects.filter(title__iexact=title, tendor= request.POST.get('tendor'), status=1)
        if head.exists():
            messages.error(request, "This Heading against this tendor is already exist.")
            return redirect("show_heading") 
        else:  
            form.save()  
            messages.success(request, "Data Updated successfully!")   
            return redirect("show_heading")  
    error_messages = form.errors.as_json()
    messages.error(request, f"Form validation failed: {error_messages}")  
    return render(request,'heading/e_heading.html', {'heading':heading, 'tendors':tendors})  

@login_required  
@permission_required('project_initiation.delete_heading', raise_exception=True)
def d_heading(request, id):  
    heading = Heading.objects.get(id=id)  
    heading.status=0  
    heading.save()
    messages.success(request, "Data Deleted successfully!")
    return redirect("show_heading")


# Sub_Heading
@login_required 
@permission_required('project_initiation.add_sub_heading', raise_exception=True)
def add_sub_heading(request):
    tendors = Tendor.objects.filter(status=1).values('id','title')
    headings = Heading.objects.filter(status=1).values('id','title') 
    if request.method == "POST":  
        form = Sub_headingForm(request.POST) 
        title = request.POST.get('title').strip().lower()
        if form.is_valid():
            subhead = Sub_heading.objects.filter(title__iexact=title, heading= request.POST.get('heading'), tendor= request.POST.get('tendor'), status=1)
            if subhead.exists():
                messages.error(request, "This Sub Heading against this tendor is already exist.")
                return render(request,'sub_heading/add_sub_heading.html',{'form':form, 'tendors':tendors, 'headings':headings})  
            else:
                try:  
                    form.save() 
                    messages.success(request, "Data added successfully!") 
                    return redirect('show_sub_heading')  
                except Exception as e:  
                    messages.error(request, f"Internal Server Error: {str(e)}")
                    return render(request,'sub_heading/add_sub_heading.html',{'form':form, 'tendors':tendors, 'headings':headings})  
        else:
            error_messages = form.errors.as_json()
            messages.error(request, f"Form validation failed: {error_messages}")
            return render(request,'sub_heading/add_sub_heading.html',{'form':form, 'tendors':tendors, 'headings':headings})  
    else:  
        form = Sub_headingForm()
        return render(request,'sub_heading/add_sub_heading.html',{'form':form, 'tendors':tendors, 'headings':headings})  

@login_required    
@permission_required('project_initiation.view_sub_heading', raise_exception=True)
def show_sub_heading(request):  
    sub_headings = Sub_heading.objects.filter(status=1)  
    return render(request,"sub_heading/show_sub_heading.html",{'sub_headings':sub_headings})  

@login_required  
@permission_required('project_initiation.change_sub_heading', raise_exception=True)
def e_sub_heading(request, id):  
    sub_heading = Sub_heading.objects.get(id=id) 
    tendors = Tendor.objects.filter(status=1).values('id','title')
    headings = Heading.objects.filter(status=1).values('id','title')
    return render(request,'sub_heading/e_sub_heading.html', {'sub_heading':sub_heading, 'tendors':tendors, 'headings':headings})  

@login_required  
def u_sub_heading(request, id):  
    sub_heading = Sub_heading.objects.get(id=id)  
    tendors = Tendor.objects.filter(status=1).values('id','title')
    headings = Heading.objects.filter(status=1).values('id','title')
    form = Sub_headingForm(request.POST, instance = sub_heading)  
    title = request.POST.get('title').strip().lower()
    if form.is_valid():  
        subhead = Sub_heading.objects.filter(title__iexact=title, heading= request.POST.get('heading'), tendor= request.POST.get('tendor'), status=1)
        if subhead.exists():
            messages.error(request, "This Sub Heading against this tendor is already exist.")
            return redirect("show_sub_heading")
        else:
            form.save()  
            messages.success(request, "Data added successfully!") 
            return redirect("show_sub_heading") 
    error_messages = form.errors.as_json()
    messages.error(request, f"Form validation failed: {error_messages}")   
    return render(request,'sub_heading/e_sub_heading.html', {'sub_heading':sub_heading, 'tendors':tendors, 'headings':headings}) 

@login_required  
@permission_required('project_initiation.delete_sub_heading', raise_exception=True)
def d_sub_heading(request, id):  
    sub_heading = Sub_heading.objects.get(id=id)  
    sub_heading.status=0  
    sub_heading.save()
    messages.success(request, "Data Deleted successfully!")
    return redirect("show_sub_heading")

def load_heading(request):
    tendor = request.GET.get('tendor')
    heading = Heading.objects.filter(tendor=tendor,status=1).order_by('title')
    return JsonResponse(list(heading.values('id', 'title')), safe=False)

# Boq_items
@login_required 
@permission_required('project_initiation.add_boq_items', raise_exception=True)
def add_boq_items(request): 
    if request.method == "POST":  
        form = Boq_itemsForm(request.POST) 
        if form.is_valid():
            try:  
                form.save()  
                return JsonResponse({'status': 'success'}, status=200)
            except Exception as e:  
  
                return JsonResponse({'status': 'error', 'message': 'Unhandled request method'}, status=400) 
    else:  
        form = Boq_itemsForm() 
        tendors = Tendor.objects.filter(status=1).values('id','title')
        headings = Heading.objects.filter(status=1).values('id','title')
        subheadings = Sub_heading.objects.filter(status=1).values('id','title')
        items = Item.objects.filter(status=1).values('id','name')
        units = Unit.objects.filter(status=1).values('id','name')
        currencies = Currency.objects.filter(status=1).values('id','name')
    return render(request,'boq_items/add_boq_items.html',{'form':form, 'tendors':tendors, 'headings':headings, 'subheadings':subheadings, 'items':items, 'units':units, 'currencies':currencies})  

@login_required    
@permission_required('project_initiation.view_boq_items', raise_exception=True)
def show_boq_items(request):  
    boq_items = Boq_items.objects.filter(status=1)  
    return render(request,"boq_items/show_boq_items.html",{'boq_items':boq_items})  

@login_required  
@permission_required('project_initiation.change_boq_items', raise_exception=True)
def e_boq_items(request, id):  
    boq_items = Boq_items.objects.get(id=id) 
    tendors = Tendor.objects.filter(status=1).values('id','title')
    headings = Heading.objects.filter(status=1).values('id','title')
    subheadings = Sub_heading.objects.filter(status=1).values('id','title')
    items = Item.objects.filter(status=1).values('id','name')
    units = Unit.objects.filter(status=1).values('id','name')
    currencies = Currency.objects.filter(status=1).values('id','name')
    return render(request,'boq_items/e_boq_items.html', {'boq_items':boq_items, 'tendors':tendors, 'headings':headings, 'subheadings':subheadings, 'items':items, 'units':units, 'currencies':currencies})  

@login_required  
def u_boq_items(request, id):  
    boq_items = Boq_items.objects.get(id=id)  
    form = Boq_itemsForm(request.POST, instance = boq_items)  
    if form.is_valid():  
        form.save()  
        return redirect("show_boq_items")  
    return render(request, 'boq_items/e_boq_items.html', {'boq_items': boq_items})  

@login_required  
@permission_required('project_initiation.delete_boq_items', raise_exception=True)
def d_boq_items(request, id):  
    boq_items = Boq_items.objects.get(id=id)  
    boq_items.status=0  
    boq_items.save()
    return redirect("show_boq_items")

def load_sub_heading(request):
    heading = request.GET.get('heading')
    sub_heading = Sub_heading.objects.filter(heading=heading,status=1).order_by('title')
    return JsonResponse(list(sub_heading.values('id', 'title')), safe=False)

def load_boq_items(request):
    boq_items = Boq_items.objects.filter(status=1) 
    return JsonResponse(list(boq_items.values('id', 'tendor', 'heading')), safe=False)

def test(request):  
    tendors = Tendor.objects.filter(status=1).values('id','title')
    items = Item.objects.filter(status=1).values('id','name')
    units = Unit.objects.filter(status=1).values('id','name')
    taxes = Tax.objects.filter(status=1).values('id','name')
    currencies = Currency.objects.filter(status=1).values('id','name')
    return render(request,"boq_items/test.html", {'tendors':tendors, 'items':items, 'units':units, 'taxes':taxes, 'currencies':currencies})  



# SELECT 
#         id, unit_price, quantity, total_amount, tendor_id, parent_id
#     FROM 
#         boq_items
#     WHERE 
#         id >= (SELECT MIN(id) FROM boq_items WHERE tendor_id = 2) 
#     ORDER BY id,parent_id;