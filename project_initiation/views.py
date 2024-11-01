from django.http import JsonResponse
from django.shortcuts import redirect, render
from datetime import datetime
import os
from django.conf import settings
from employee.models import Client, Department
from finance.models import Currency
from project_initiation.forms import TendorForm, UnitForm, CategoryForm, ItemForm, HeadingForm, Sub_headingForm, Boq_itemsForm
from project_initiation.models import Tendor, Unit, Category, Item, Heading, Sub_heading, Boq_items
from django.contrib.auth.decorators import login_required, permission_required

# Create your views here.
# tendor
@login_required 
@permission_required('project_initiation.add_tendor', raise_exception=True)  
def add_tendor(request):  
    if request.method == "POST":  
        form = TendorForm(request.POST, request.FILES) 
        try:  
            if form.is_valid():
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
                return redirect('show_tendor')  
        except Exception as e:  

            pass  
    else:  
        form = TendorForm()  
        departments = Department.objects.filter(status=1).values('id','depart_name')
        clients = Client.objects.filter(status=1).values('id','client_name')
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
    old_path = tendor.ad_image 
    if request.method == "POST":  
        form = TendorForm(request.POST, request.FILES, instance = tendor) 
        try:  
            if form.is_valid():
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
                return redirect('show_tendor')    
        except Exception as e:  
            print(e)
            pass 
    return render(request, 'tendor/e_tendor.html', {'tendor': tendor})  

@login_required  
@permission_required('project_initiation.delete_tendor', raise_exception=True) 
def d_tendor(request, id):  
    tendor = Tendor.objects.get(id=id)  
    tendor.status=0  
    tendor.save()
    return redirect("show_tendor")  


# Unit
@login_required 
@permission_required('employee.add_unit', raise_exception=True)
def add_unit(request): 
    if request.method == "POST":  
        form = UnitForm(request.POST) 
        if form.is_valid():
            try:  
                form.save()  
                return redirect('show_unit')  
            except Exception as e:  
  
                pass  
    else:  
        form = UnitForm() 
    return render(request,'unit/add_unit.html',{'form':form})  

@login_required    
@permission_required('employee.view_unit', raise_exception=True)
def show_unit(request):  
    units = Unit.objects.filter(status=1)  
    return render(request,"unit/show_unit.html",{'units':units})  

@login_required  
@permission_required('employee.change_unit', raise_exception=True)
def e_unit(request, id):  
    unit = Unit.objects.get(id=id) 
    return render(request,'unit/e_unit.html', {'unit':unit})  

@login_required  
def u_unit(request, id):  
    unit = Unit.objects.get(id=id)  
    form = UnitForm(request.POST, instance = unit)  
    if form.is_valid():  
        form.save()  
        return redirect("show_unit")  
    return render(request, 'unit/e_unit.html', {'unit': unit})  

@login_required  
@permission_required('employee.delete_unit', raise_exception=True)
def d_unit(request, id):  
    unit = Unit.objects.get(id=id)  
    unit.status=0  
    unit.save()
    return redirect("show_unit")


# Category
@login_required 
@permission_required('employee.add_category', raise_exception=True)
def add_category(request): 
    if request.method == "POST":  
        form = CategoryForm(request.POST) 
        if form.is_valid():
            try:  
                form.save()  
                return redirect('show_category')  
            except Exception as e:  
  
                pass  
    else:  
        form = CategoryForm()
    return render(request,'category/add_category.html',{'form':form})  

@login_required    
@permission_required('employee.view_category', raise_exception=True)
def show_category(request):  
    categories = Category.objects.filter(status=1)  
    return render(request,"category/show_category.html",{'categories':categories})  

@login_required  
@permission_required('employee.change_category', raise_exception=True)
def e_category(request, id):  
    category = Category.objects.get(id=id) 
    return render(request,'category/e_category.html', {'category':category})  

@login_required  
def u_category(request, id):  
    category = Category.objects.get(id=id)  
    form = CategoryForm(request.POST, instance = category)  
    if form.is_valid():  
        form.save()  
        return redirect("show_category")  
    return render(request, 'category/e_category.html', {'category': category})  

@login_required  
@permission_required('employee.delete_category', raise_exception=True)
def d_category(request, id):  
    category = Category.objects.get(id=id)  
    category.status=0  
    category.save()
    return redirect("show_category")


# Item
@login_required 
@permission_required('employee.add_item', raise_exception=True)
def add_item(request): 
    if request.method == "POST":  
        form = ItemForm(request.POST) 
        if form.is_valid():
            try:  
                form.save()  
                return redirect('show_item')  
            except Exception as e:  
  
                pass  
    else:  
        form = ItemForm() 
        units = Unit.objects.filter(status=1).values('id','name')
        categories = Category.objects.filter(status=1).values('id','title')
    return render(request,'item/add_item.html',{'form':form, 'units':units, 'categories':categories})  

@login_required    
@permission_required('employee.view_item', raise_exception=True)
def show_item(request):  
    items = Item.objects.filter(status=1)  
    return render(request,"item/show_item.html",{'items':items})  

@login_required  
@permission_required('employee.change_item', raise_exception=True)
def e_item(request, id):  
    item = Item.objects.get(id=id) 
    units = Unit.objects.filter(status=1).values('id','name')
    categories = Category.objects.filter(status=1).values('id','title')
    return render(request,'item/e_item.html', {'item':item, 'units':units, 'categories':categories})  

@login_required  
def u_item(request, id):  
    item = Item.objects.get(id=id)  
    form = ItemForm(request.POST, instance = item)  
    if form.is_valid():  
        form.save()  
        return redirect("show_item")  
    return render(request, 'item/e_item.html', {'item': item})  

@login_required  
@permission_required('employee.delete_item', raise_exception=True)
def d_item(request, id):  
    item = Item.objects.get(id=id)  
    item.status=0  
    item.save()
    return redirect("show_item")


# Heading
@login_required 
@permission_required('employee.add_heading', raise_exception=True)
def add_heading(request): 
    if request.method == "POST":  
        form = HeadingForm(request.POST) 
        if form.is_valid():
            try:  
                form.save()  
                return redirect('show_heading')  
            except Exception as e:  
  
                pass  
    else:  
        form = HeadingForm() 
        tendors = Tendor.objects.filter(status=1).values('id','title')
    return render(request,'heading/add_heading.html',{'form':form, 'tendors':tendors})  

@login_required    
@permission_required('employee.view_heading', raise_exception=True)
def show_heading(request):  
    headings = Heading.objects.filter(status=1)  
    return render(request,"heading/show_heading.html",{'headings':headings})  

@login_required  
@permission_required('employee.change_heading', raise_exception=True)
def e_heading(request, id):  
    heading = Heading.objects.get(id=id) 
    tendors = Tendor.objects.filter(status=1).values('id','title')
    return render(request,'heading/e_heading.html', {'heading':heading, 'tendors':tendors})  

@login_required  
def u_heading(request, id):  
    heading = Heading.objects.get(id=id)  
    form = HeadingForm(request.POST, instance = heading)  
    if form.is_valid():  
        form.save()  
        return redirect("show_heading")  
    return render(request, 'heading/e_heading.html', {'heading': heading})  

@login_required  
@permission_required('employee.delete_heading', raise_exception=True)
def d_heading(request, id):  
    heading = Heading.objects.get(id=id)  
    heading.status=0  
    heading.save()
    return redirect("show_heading")


# Sub_Heading
@login_required 
@permission_required('employee.add_sub_heading', raise_exception=True)
def add_sub_heading(request): 
    if request.method == "POST":  
        form = Sub_headingForm(request.POST) 
        if form.is_valid():
            try:  
                form.save()  
                return redirect('show_sub_heading')  
            except Exception as e:  
  
                pass  
    else:  
        form = Sub_headingForm() 
        tendors = Tendor.objects.filter(status=1).values('id','title')
        headings = Heading.objects.filter(status=1).values('id','title')
    return render(request,'sub_heading/add_sub_heading.html',{'form':form, 'tendors':tendors, 'headings':headings})  

@login_required    
@permission_required('employee.view_sub_heading', raise_exception=True)
def show_sub_heading(request):  
    sub_headings = Sub_heading.objects.filter(status=1)  
    return render(request,"sub_heading/show_sub_heading.html",{'sub_headings':sub_headings})  

@login_required  
@permission_required('employee.change_sub_heading', raise_exception=True)
def e_sub_heading(request, id):  
    sub_heading = Sub_heading.objects.get(id=id) 
    tendors = Tendor.objects.filter(status=1).values('id','title')
    headings = Heading.objects.filter(status=1).values('id','title')
    return render(request,'sub_heading/e_sub_heading.html', {'sub_heading':sub_heading, 'tendors':tendors, 'headings':headings})  

@login_required  
def u_sub_heading(request, id):  
    sub_heading = Sub_heading.objects.get(id=id)  
    form = Sub_headingForm(request.POST, instance = sub_heading)  
    if form.is_valid():  
        form.save()  
        return redirect("show_sub_heading")  
    return render(request, 'sub_heading/e_sub_heading.html', {'sub_heading': sub_heading})  

@login_required  
@permission_required('employee.delete_sub_heading', raise_exception=True)
def d_sub_heading(request, id):  
    sub_heading = Sub_heading.objects.get(id=id)  
    sub_heading.status=0  
    sub_heading.save()
    return redirect("show_sub_heading")

def load_heading(request):
    tendor = request.GET.get('tendor')
    heading = Heading.objects.filter(tendor=tendor,status=1).order_by('title')
    return JsonResponse(list(heading.values('id', 'title')), safe=False)

# Boq_items
@login_required 
@permission_required('employee.add_boq_items', raise_exception=True)
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
@permission_required('employee.view_boq_items', raise_exception=True)
def show_boq_items(request):  
    boq_items = Boq_items.objects.filter(status=1)  
    return render(request,"boq_items/show_boq_items.html",{'boq_items':boq_items})  

@login_required  
@permission_required('employee.change_boq_items', raise_exception=True)
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
@permission_required('employee.delete_boq_items', raise_exception=True)
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