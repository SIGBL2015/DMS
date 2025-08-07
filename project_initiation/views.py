from collections import defaultdict
import json
from django.forms import  ValidationError
from django.http import JsonResponse
from django.shortcuts import redirect, render
from datetime import datetime
from django.utils import timezone
import os
from django.conf import settings
from employee.validator import validate_allowed_file_type
from employee.models import Client, Department, Employee
from finance.models import Currency
from project_initiation.forms import TaxForm, TendorForm, UnitForm, CategoryForm, ItemForm, HeadingForm, Sub_headingForm, Boq_itemsForm, Iso_masterForm, Iso_detailForm
from project_initiation.models import Item_spec_values, Setting, Tax, Tendor, Unit, Category, Item, Heading, Sub_heading, Boq_items, Iso_master, Iso_detail, Component, Specs, Spec_values
from django.contrib.auth.decorators import login_required, permission_required
from django.db.models import Q
from django.contrib import messages
from django.forms.models import model_to_dict
from django.views.decorators.csrf import csrf_exempt
from django.contrib.auth.models import User
from django.db.models.functions import Substr, Cast
from django.db.models import IntegerField

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
                    if 'ad_image' in request.FILES:
                        file = request.FILES.get('ad_image')
                        try:
                            validate_allowed_file_type(file)
                        except ValidationError as e:
                            messages.error(request, str(e))
                            return render(request,'tendor/add_tendor.html',{'form':form, 'departments':departments,'clients':clients})  
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
    departments = Department.objects.filter(status=1).values('id','depart_name')
    clients = Client.objects.filter(status=1).values('id','client_name')  
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
            file = request.FILES.get('ad_image')
            if file:
                try:
                    validate_allowed_file_type(file)
                except ValidationError as e:
                    messages.error(request, str(e))
                    return render(request, 'tendor/e_tendor.html', {'tendor': tendor, 'departments':departments,'clients':clients})
            file_instance = form.save(commit=False)
            if file:
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
            return render(request, 'tendor/e_tendor.html', {'tendor': tendor, 'departments':departments,'clients':clients}) 
    except Exception as e: 
        messages.error(request, f"Internal Server Error: {str(e)}") 
        return render(request, 'tendor/e_tendor.html', {'tendor': tendor, 'departments':departments,'clients':clients}) 
  

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
@permission_required('project_initiation.change_item', raise_exception=True)
def add_specs(request, id):  
    item = Item.objects.get(id=id)
    if request.method == "POST":
        data = defaultdict(dict)

        for key, value in request.POST.items():
            if key.startswith('spec_'):
                # Expect key format: spec_<spec_id>
                spec_id = key.split('_')[1]
                spec = Specs.objects.get(id=spec_id)
                component_name = spec.component.comp_title  # assuming FK to Component

                data[component_name][spec.specs_name] = value
        json_data = json.dumps(dict(data))
        Item_spec_values.objects.create(
                    item_id=item.id,
                    specifications=json_data,  # Save directly as text
                )
        messages.success(request, "Data added successfully!") 
        return redirect('show_item')
    else:
        unit = Unit.objects.get(id=item.unit_id)
        category = Category.objects.get(id=item.category_id)
        components_data = []
        components = Component.objects.filter(category_id=item.category_id)

        for component in components:
            specs_data = []
            specs = Specs.objects.filter(component=component)
            for spec in specs:
                values = list(Spec_values.objects.filter(specs_id=spec).values_list('spec_value', flat=True)) if spec.data_type == 'select' else []
                specs_data.append({
                    'id': spec.id,
                    'name': spec.specs_name,
                    'datatype': spec.data_type,
                    'values': values
                })
            components_data.append({
                'component': component.comp_title,
                'specs': specs_data
            })
        specs = Item_spec_values.objects.filter(item_id=item.id)
        specs_list = list(specs.values('id','specifications'))
        # Parse specifications JSON string into dict
        for spec in specs_list:
            try:
                spec['specifications'] = json.loads(spec['specifications'])
            except Exception:
                spec['specifications'] = {}
        return render(request,'item/add_specs.html', {'item':item, 'unit':unit.name, 'category':category.title, 'components_data': components_data, 'specs':specs_list})  

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


# iso
@login_required 
@permission_required('project_initiation.add_iso', raise_exception=True)
def add_iso(request): 
    if request.method == "POST":  
        # Parse incoming JSON data
        data = json.loads(request.body)
        # Retrieve Tendor instance based on the provided ID
        tendor_id = data['formFields'].get('tendor')
        try:
            tendor_instance = Tendor.objects.get(id=tendor_id)
        except Tendor.DoesNotExist:
            return JsonResponse({'error': 'Tendor with given ID does not exist'}, status=400)

        # Retrieve Client instance based on the provided ID
        client_id = data['formFields'].get('client')
        try:
            client_instance = Client.objects.get(id=client_id)
        except Client.DoesNotExist:
            return JsonResponse({'error': 'Client with given ID does not exist'}, status=400)
        
         # Retrieve Client instance based on the provided ID
        sales_person_id = data['formFields'].get('sales_person')
        try:
            sales_person_instance = Employee.objects.get(id=sales_person_id)
        except Client.DoesNotExist:
            return JsonResponse({'error': 'Sales person with given ID does not exist'}, status=400)

        # Remove 'tendor' and 'client' from formFields to avoid passing them twice
        data['formFields'].pop('tendor', None)
        data['formFields'].pop('client', None)
        data['formFields'].pop('sales_person', None)
        data['formFields'].pop('csrfmiddlewaretoken', None)
        data['formFields'].pop('isoTable_length', None)

        # Save ISO Master with the Tendor and Client instances
        master = Iso_master.objects.create(
            tendor=tendor_instance,
            client=client_instance,
            sales_person=sales_person_instance,
            **data['formFields']
        )

         # Save ISO Details
        for item in data['tableRows']:
             # Remove frontend calculation fields before saving to Iso_detail
            frontend_fields = ['category', 'isimported', 'import_amt', 'est_gp_perc', 'est_unit_gp_amt', 'est_gp_amt']
            for field in frontend_fields:
                if field in item:
                    del item[field]  # Remove these fields from the data

            # Ensure 'iso_master' is explicitly passed to Iso_detail
            item['iso_master'] = master  # Add the iso_master to each item

            # Fetch Item instance if item ID is provided
            item_id = item.get('item')
            if item_id:
                try:
                    item_instance = Item.objects.get(id=item_id)
                    item['item'] = item_instance  # Assign the Item instance to 'item'
                except Item.DoesNotExist:
                    return JsonResponse({'error': f'Item with ID {item_id} does not exist'}, status=400)

            # Fetch Tax instance if sales_tax_category ID is provided
            tax_id = item.get('sales_tax_category')
            if tax_id:
                try:
                    tax_instance = Tax.objects.get(id=tax_id)
                    item['sales_tax_category'] = tax_instance  # Assign the Tax instance to 'sales_tax_category'
                except Tax.DoesNotExist:
                    return JsonResponse({'error': f'Tax with ID {tax_id} does not exist'}, status=400)
            
            spec_id = item.get('item_spec_values')
            if spec_id:
                try:
                    spec_instance = Item_spec_values.objects.get(id=spec_id)
                    item['item_spec_values'] = spec_instance  # Assign the Tax instance to 'sales_tax_category'
                except Tax.DoesNotExist:
                    return JsonResponse({'error': f'Spec with ID {spec_id} does not exist'}, status=400)

            Iso_detail.objects.create(**item)  # Pass the rest of the item as **item

        # Return success response
        return JsonResponse({'message': 'Data saved successfully'})
        # form = Iso_masterForm(request.POST) 
        # if form.is_valid():
        #     try:  

        #         master_instance = form.save()  
        #         return JsonResponse({
        #             "id": master_instance.id,
        #             "message": "ISO Master saved successfully."
        #         })
        #         # item_ids = request.POST.getlist('item[]')
        #         # tax_ids = request.POST.getlist('sales_tax_category[]')
        #         # # Collect all dynamic fields
        #         # field_names = [field.name for field in Iso_detail._meta.fields if field.name not in ['id', 'iso_master','item','sales_tax_category','status']]
        #         # # Collect data for all fields
        #         # data = {field: request.POST.getlist(f'{field}[]') for field in field_names}
        #         # # Ensure rows are of equal length
        #         # num_rows = len(item_ids)
                
                
        #         # # Save each row to the database
        #         # for i in range(num_rows):
        #         #     item = Item.objects.get(id=item_ids[i])
        #         #     tax = Tax.objects.get(id=tax_ids[i])
        #         #     row_data = {field: data[field][i] if i < len(data[field]) else None for field in field_names}
        #         #     print(row_data)
        #         #     # Create and save the item
        #         #     Iso_detail.objects.create(item_id=item.id,sales_tax_category=tax,iso_master_id=master_instance.id, **row_data)
        #         # messages.success(request, "Data added successfully!") 
        #         # return redirect('show_iso')
            
        #     except Exception as e:
        #         print(e)
        #         return JsonResponse({'status': 'error', 'message': 'Unhandled request method'}, status=400) 
    else:  
        form = Iso_masterForm() 
        tendors = Tendor.objects.filter(status=1).values('id','title')
        clients = Client.objects.filter(status=1).values('id','client_name')
        items = Item.objects.filter(status=1).values('id','name')
        taxes = Tax.objects.filter(status=1).values('id','name')
        users = User.objects.filter(is_active=1).values('id','username')
        fc_amt = Setting.objects.get(status=1)

        # Step 1: Get current year and today's date
        today = timezone.now()
        year_str = today.strftime('%Y')
        today_str = today.strftime('%Y%m%d')

        # Step 2: Filter iso_no entries from current year only
        iso_no_qs = Iso_master.objects.annotate(
            year_part=Substr('iso_no', 5, 4),
            num_part=Cast(Substr('iso_no', 14), output_field=IntegerField())
        ).filter(year_part=year_str).order_by('-num_part')

        # Step 3: Get latest number and increment
        if iso_no_qs.exists():
            latest_num = iso_no_qs.first().num_part
            new_num = latest_num + 1
        else:
            new_num = 1

        # Step 4: Final formatted ISO number
        new_iso_no = f"ISO-{today_str}-{new_num:03d}"
    return render(request,'iso/add_iso.html',{'form':form, 'tendors':tendors, 'clients':clients, 'items':items, 'taxes':taxes, 'users':users, 'fc_amt':fc_amt, 'new_iso_no':new_iso_no})  

@login_required 
@permission_required('project_initiation.add_iso', raise_exception=True)
def add_iso_detail(request): 
    if request.method == "POST":  
        form = Iso_detailForm(request.POST) 
        if form.is_valid():
            try:  
                form.save()  # Don't save to DB yet
                messages.success(request, "Data added successfully!") 
            except Exception as e:  
                messages.error(request, f"Internal Server Error: {str(e)}")
        else:
            error_messages = form.errors.as_json()
            messages.error(request, f"Form validation failed: {error_messages}")
    iso = Iso_master.objects.get(id=request.POST.get('iso_master')) 
    tendors = Tendor.objects.filter(status=1).values('id','title')
    items = Item.objects.filter(status=1).values('id','name')
    taxes = Tax.objects.filter(status=1).values('id','name')
    clients = Client.objects.filter(status=1).values('id','client_name')
    iso_detail = Iso_detail.objects.filter(iso_master_id=request.POST.get('iso_master'),status=1)  
    return render(request,'iso/e_iso.html', {'iso':iso, 'tendors':tendors, 'clients':clients, 'iso_details':iso_detail, 'items':items, 'taxes':taxes})  

@login_required    
@permission_required('project_initiation.view_iso', raise_exception=True)
def show_iso(request):  
    iso = Iso_master.objects.filter(status=1)  
    return render(request,"iso/show_iso.html",{'iso_mas':iso})
  
@login_required    
@permission_required('project_initiation.view_iso', raise_exception=True)
def show_iso_detail(request, id):  
    iso_detail = Iso_detail.objects.filter(iso_master_id=id,status=1)  
    data = [model_to_dict(item) for item in iso_detail]  # Serialize all fields
    return JsonResponse(data, safe=False)

@login_required  
@permission_required('project_initiation.change_iso', raise_exception=True)
def e_iso(request, id):  
    iso = Iso_master.objects.get(id=id) 
    tendors = Tendor.objects.filter(status=1).values('id','title')
    clients = Client.objects.filter(status=1).values('id','client_name')
    items = Item.objects.filter(status=1).values('id','name')
    taxes = Tax.objects.filter(status=1).values('id','name')
    iso_detail = Iso_detail.objects.filter(iso_master_id=id,status=1)  
    return render(request,'iso/e_iso.html', {'iso':iso, 'tendors':tendors, 'clients':clients, 'iso_details':iso_detail, 'items':items, 'taxes':taxes})  

@login_required  
def u_iso(request, id):  
    iso = Iso_master.objects.get(id=id)  
    form = Iso_masterForm(request.POST, instance = iso)  
    if form.is_valid():  
        form.save()  
        messages.success(request, "ISO Master Data Updated successfully!")   
    iso_after = Iso_master.objects.get(id=id)
    tendors = Tendor.objects.filter(status=1).values('id','title')
    clients = Client.objects.filter(status=1).values('id','client_name')
    items = Item.objects.filter(status=1).values('id','name')
    taxes = Tax.objects.filter(status=1).values('id','name')
    iso_detail = Iso_detail.objects.filter(iso_master_id=id,status=1)  
    return render(request,'iso/e_iso.html', {'iso':iso_after, 'tendors':tendors, 'clients':clients, 'iso_details':iso_detail, 'items':items, 'taxes':taxes})    

@login_required  
@permission_required('project_initiation.delete_iso', raise_exception=True)
def d_iso(request, id):  
    iso = Iso_master.objects.get(id=id)  
    iso.status=0  
    iso.save()
    return redirect("show_iso")

@login_required
@permission_required('project_initiation.delete_iso', raise_exception=True)
@csrf_exempt
def delete_iso_detail(request, id):
    iso_det = Iso_detail.objects.get(id=id)
    iso_det.status=0  
    iso_det.save()
    iso = Iso_master.objects.get(id=iso_det.iso_master.id) 
    tendors = Tendor.objects.filter(status=1).values('id','title')
    clients = Client.objects.filter(status=1).values('id','client_name')
    items = Item.objects.filter(status=1).values('id','name')
    taxes = Tax.objects.filter(status=1).values('id','name')
    iso_detail = Iso_detail.objects.filter(iso_master_id=iso_det.iso_master.id,status=1)  
    return render(request,'iso/e_iso.html', {'iso':iso, 'tendors':tendors, 'clients':clients, 'iso_details':iso_detail, 'items':items, 'taxes':taxes})  
           

def load_tax(request):
    sales_tax_category = request.GET.get('sales_tax_category')
    gst_percentage = Tax.objects.get(id=sales_tax_category)
    return JsonResponse({ 'percentage':gst_percentage.percentage}, safe=False)

def load_category(request):
    item = request.GET.get('item')
    cat = Item.objects.get(id=item)
    specs = Item_spec_values.objects.filter(item_id=item)
    specs_list = list(specs.values('id','specifications'))  # Convert queryset to list of dicts
    return JsonResponse({ 'title':cat.category.title,'specs':specs_list}, safe=False)


# SELECT 
#         id, unit_price, quantity, total_amount, tendor_id, parent_id
#     FROM 
#         boq_items
#     WHERE 
#         id >= (SELECT MIN(id) FROM boq_items WHERE tendor_id = 2) 
#     ORDER BY id,parent_id;