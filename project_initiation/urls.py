from django.urls import path
from . import views
from django.conf import settings
from django.conf.urls.static import static


urlpatterns = [
    #tendor
    path('save_tendor', views.add_tendor, name="save_tendor"),  
    path('show_tendor', views.show_tendor, name="show_tendor"),  
    path('e_tendor/<int:id>', views.e_tendor, name="e_tendor"),  
    path('u_tendor/<int:id>', views.u_tendor, name="u_tendor"),  
    path('d_tendor/<int:id>', views.d_tendor, name="d_tendor"),   

    #unit
    path('save_unit', views.add_unit, name="save_unit"),  
    path('show_unit', views.show_unit, name="show_unit"),  
    path('e_unit/<int:id>', views.e_unit, name="e_unit"),  
    path('u_unit/<int:id>', views.u_unit, name="u_unit"),  
    path('d_unit/<int:id>', views.d_unit, name="d_unit"),

    #tax
    path('save_tax', views.add_tax, name="save_tax"),  
    path('show_tax', views.show_tax, name="show_tax"),  
    path('e_tax/<int:id>', views.e_tax, name="e_tax"),  
    path('u_tax/<int:id>', views.u_tax, name="u_tax"),  
    path('d_tax/<int:id>', views.d_tax, name="d_tax"),
    
    #category
    path('save_category', views.add_category, name="save_category"),  
    path('show_category', views.show_category, name="show_category"),  
    path('e_category/<int:id>', views.e_category, name="e_category"),  
    path('u_category/<int:id>', views.u_category, name="u_category"),  
    path('d_category/<int:id>', views.d_category, name="d_category"),

    #item
    path('save_item', views.add_item, name="save_item"),  
    path('show_item', views.show_item, name="show_item"),  
    path('e_item/<int:id>', views.e_item, name="e_item"),  
    path('u_item/<int:id>', views.u_item, name="u_item"),  
    path('d_item/<int:id>', views.d_item, name="d_item"),
    path('add_specs/<int:id>', views.add_specs, name="add_specs"),

    #heading
    path('save_heading', views.add_heading, name="save_heading"),  
    path('show_heading', views.show_heading, name="show_heading"),  
    path('e_heading/<int:id>', views.e_heading, name="e_heading"),  
    path('u_heading/<int:id>', views.u_heading, name="u_heading"),  
    path('d_heading/<int:id>', views.d_heading, name="d_heading"),

    #sub_heading
    path('save_sub_heading', views.add_sub_heading, name="save_sub_heading"),  
    path('show_sub_heading', views.show_sub_heading, name="show_sub_heading"),  
    path('e_sub_heading/<int:id>', views.e_sub_heading, name="e_sub_heading"),  
    path('u_sub_heading/<int:id>', views.u_sub_heading, name="u_sub_heading"),  
    path('d_sub_heading/<int:id>', views.d_sub_heading, name="d_sub_heading"),
    path('load_heading', views.load_heading, name="load_heading"),

    #boq_items
    path('save_boq_items', views.add_boq_items, name="save_boq_items"),  
    path('show_boq_items', views.show_boq_items, name="show_boq_items"),  
    path('e_boq_items/<int:id>', views.e_boq_items, name="e_boq_items"),  
    path('u_boq_items/<int:id>', views.u_boq_items, name="u_boq_items"),  
    path('d_boq_items/<int:id>', views.d_boq_items, name="d_boq_items"),
    path('load_sub_heading', views.load_sub_heading, name="load_sub_heading"),
    path('load_boq_items', views.load_boq_items, name="load_boq_items"),
    path('test', views.test, name="test"),

    #iso
    path('save_iso', views.add_iso, name="save_iso"),
    path('save_iso_detail', views.add_iso_detail, name="save_iso_detail"),  
    path('show_iso', views.show_iso, name="show_iso"),  
    path('e_iso/<int:id>', views.e_iso, name="e_iso"),  
    path('u_iso/<int:id>', views.u_iso, name="u_iso"),  
    path('d_iso/<int:id>', views.d_iso, name="d_iso"),
    path('load_tax', views.load_tax, name="load_tax"),
    path('load_category', views.load_category, name="load_category"),
    path('show_iso_detail/<int:id>', views.show_iso_detail, name="show_iso_detail"), 
    path('iso_det_delete/<int:id>/', views.delete_iso_detail, name='delete_iso_detail'),

    #vendor_quotation
    path('save_vendor_quotation', views.add_vendor_quotation, name="save_vendor_quotation"), 
    path('show_vendor_quotation', views.show_vendor_quotation, name="show_vendor_quotation"),
    path('get_specs_by_item/<int:id>', views.get_specs_by_item, name="get_specs_by_item"),
    path("quotation/<int:master_id>/view/", views.view_vendor_quotation, name="view_vendor_quotation"),
    path("quotation/<int:master_id>/download/", views.download_vendor_quotation, name="download_vendor_quotation"),
    path("view_quotation_detail/<int:id>", views.view_quotation_detail, name="view_quotation_detail"),
    path('add_vendor_quotation_list', views.add_vendor_quotation_list, name="add_vendor_quotation_list"), 
    path('add_vendor_quotation_detail', views.add_vendor_quotation_detail, name="add_vendor_quotation_detail"), 
    path('d_quotation_detail/<int:id>', views.d_quotation_detail, name="d_quotation_detail"),
    path('d_quotation_vendor/<int:id>', views.d_quotation_vendor, name="d_quotation_vendor"),
    path('generate_quotation_refno', views.generate_quotation_refno, name="generate_quotation_refno"),
    path("vendor_quotation/<int:master_id>/<int:vendor_id>/view/", views.view_single_vendor_quotation, name="view_single_vendor_quotation"),
    path("vendor_quotation/<int:master_id>/<int:vendor_id>/download/", views.download_single_vendor_quotation, name="download_single_vendor_quotation"),


]+ static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
