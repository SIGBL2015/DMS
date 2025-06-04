from django.urls import path, include
from . import views
from django.conf import settings
from django.conf.urls.static import static


urlpatterns = [
    path('dashboard', views.dashboard, name="dashboard"),
    #employee
    path('save_emp', views.emp, name="save_emp"),  
    path('view_employee', views.show, name="view_employee"),  
    path('edit/<int:id>', views.edit, name="edit"),  
    path('update/<int:id>', views.update, name="update"),  
    path('delete/<int:id>', views.destroy, name="delete"), 

    #department
    path('save_depart', views.add_depart, name="save_depart"),  
    path('show_depart', views.show_depart, name="show_depart"),  
    path('e_depart/<int:id>', views.e_depart, name="e_depart"),  
    path('u_depart/<int:id>', views.u_depart, name="u_depart"),  
    path('d_depart/<int:id>', views.d_depart, name="d_depart"),

    #Designation
    path('save_design', views.add_design, name="save_design"),  
    path('show_design', views.show_design, name="show_design"),  
    path('e_design/<int:id>', views.e_design, name="e_design"),  
    path('u_design/<int:id>', views.u_design, name="u_design"),  
    path('d_design/<int:id>', views.d_design, name="d_design"),

    #Region
    path('save_region', views.add_region, name="save_region"),  
    path('show_region', views.show_region, name="show_region"),  
    path('e_region/<int:id>', views.e_region, name="e_region"),  
    path('u_region/<int:id>', views.u_region, name="u_region"),  
    path('d_region/<int:id>', views.d_region, name="d_region"),  

    #Education
    path('save_education', views.add_education, name="save_education"),  
    path('show_education', views.show_education, name="show_education"),  
    path('e_education/<int:id>', views.e_education, name="e_education"),  
    path('u_education/<int:id>', views.u_education, name="u_education"),  
    path('d_education/<int:id>', views.d_education, name="d_education"), 

    #Employement Record
    path('save_employement_record', views.add_employement_Record, name="save_employement_record"),  
    path('show_employement_record', views.show_employement_Record, name="show_employement_record"),  
    path('e_employement_record/<int:id>', views.e_employement_Record, name="e_employement_record"),  
    path('u_employement_record/<int:id>', views.u_employement_Record, name="u_employement_record"),  
    path('d_employement_record/<int:id>', views.d_employement_Record, name="d_employement_record"), 

    #Certification
    path('save_certification', views.add_certification, name="save_certification"),  
    path('show_certification', views.show_certification, name="show_certification"),  
    path('e_certification/<int:id>', views.e_certification, name="e_certification"),  
    path('u_certification/<int:id>', views.u_certification, name="u_certification"),  
    path('d_certification/<int:id>', views.d_certification, name="d_certification"), 

    #Skills
    path('save_skill', views.add_skill, name="save_skill"),  
    path('show_skill', views.show_skill, name="show_skill"),  
    path('e_skill/<int:id>', views.e_skill, name="e_skill"),  
    path('u_skill/<int:id>', views.u_skill, name="u_skill"),  
    path('d_skill/<int:id>', views.d_skill, name="d_skill"), 

    #CV_template
    path('save_cv_template', views.add_cv_template, name="save_cv_template"),  
    path('show_cv_template', views.show_cv_template, name="show_cv_template"),  
    path('e_cv_template/<int:id>', views.e_cv_template, name="e_cv_template"),  
    path('u_cv_template/<int:id>', views.u_cv_template, name="u_cv_template"),  
    path('d_cv_template/<int:id>', views.d_cv_template, name="d_cv_template"),
    path('generate_cv', views.generate_cv, name="generate_cv"),
    path('generate', views.generate, name="generate"),
    path('print_pdf', views.print_pdf, name="print_pdf"),

    #Company
    path('save_company', views.add_company, name="save_company"),  
    path('show_company', views.show_company, name="show_company"),  
    path('e_company/<int:id>', views.e_company, name="e_company"),  
    path('u_company/<int:id>', views.u_company, name="u_company"),  
    path('d_company/<int:id>', views.d_company, name="d_company"),

    #Country
    path('save_country', views.add_country, name="save_country"),  
    path('show_country', views.show_country, name="show_country"),  
    path('e_country/<int:id>', views.e_country, name="e_country"),  
    path('u_country/<int:id>', views.u_country, name="u_country"),  
    path('d_country/<int:id>', views.d_country, name="d_country"),

    #Zone
    path('save_zone', views.add_zone, name="save_zone"),  
    path('show_zone', views.show_zone, name="show_zone"),  
    path('e_zone/<int:id>', views.e_zone, name="e_zone"),  
    path('u_zone/<int:id>', views.u_zone, name="u_zone"),  
    path('d_zone/<int:id>', views.d_zone, name="d_zone"),

    #Area
    path('save_area', views.add_area, name="save_area"),  
    path('show_area', views.show_area, name="show_area"),  
    path('e_area/<int:id>', views.e_area, name="e_area"),  
    path('u_area/<int:id>', views.u_area, name="u_area"),  
    path('d_area/<int:id>', views.d_area, name="d_area"),

    #Branch
    path('save_branch', views.add_branch, name="save_branch"),  
    path('show_branch', views.show_branch, name="show_branch"),  
    path('e_branch/<int:id>', views.e_branch, name="e_branch"),  
    path('u_branch/<int:id>', views.u_branch, name="u_branch"),  
    path('d_branch/<int:id>', views.d_branch, name="d_branch"),

    #Client
    path('save_client', views.add_client, name="save_client"),  
    path('show_client', views.show_client, name="show_client"),  
    path('e_client/<int:id>', views.e_client, name="e_client"),  
    path('u_client/<int:id>', views.u_client, name="u_client"),  
    path('d_client/<int:id>', views.d_client, name="d_client"),

    #Document_type
    path('save_document_type', views.add_document_type, name="save_document_type"),  
    path('show_document_type', views.show_document_type, name="show_document_type"),  
    path('e_document_type/<int:id>', views.e_document_type, name="e_document_type"),  
    path('u_document_type/<int:id>', views.u_document_type, name="u_document_type"),  
    path('d_document_type/<int:id>', views.d_document_type, name="d_document_type"),

    #Project_document
    path('save_project_document', views.add_project_document, name="save_project_document"),  
    path('show_project_document', views.show_project_document, name="show_project_document"),  
    path('e_project_document/<int:id>', views.e_project_document, name="e_project_document"),  
    path('u_project_document/<int:id>', views.u_project_document, name="u_project_document"),  
    path('d_project_document/<int:id>', views.d_project_document, name="d_project_document"),

    #Project_type
    path('save_project_type', views.add_project_type, name="save_project_type"),  
    path('show_project_type', views.show_project_type, name="show_project_type"),  
    path('e_project_type/<int:id>', views.e_project_type, name="e_project_type"),  
    path('u_project_type/<int:id>', views.u_project_type, name="u_project_type"),  
    path('d_project_type/<int:id>', views.d_project_type, name="d_project_type"),


   #Project
    path('save_project', views.add_project, name="save_project"),  
    path('show_project', views.show_project, name="show_project"),  
    path('e_project/<int:id>', views.e_project, name="e_project"),  
    path('u_project/<int:id>', views.u_project, name="u_project"),  
    path('d_project/<int:id>', views.d_project, name="d_project"),
    path('project_details/<int:id>', views.project_details, name="project_details"),
    path('manual_update_project/<int:id>', views.manual_update_project, name="manual_update_project"), 

    #Bank
    path('save_bank', views.add_bank, name="save_bank"),  
    path('show_bank', views.show_bank, name="show_bank"),  
    path('e_bank/<int:id>', views.e_bank, name="e_bank"),  
    path('u_bank/<int:id>', views.u_bank, name="u_bank"),  
    path('d_bank/<int:id>', views.d_bank, name="d_bank"),

    #Bank_guaranty
    path('save_bank_guaranty', views.add_bank_guaranty, name="save_bank_guaranty"),  
    path('show_bank_guaranty', views.show_bank_guaranty, name="show_bank_guaranty"),  
    path('e_bank_guaranty/<int:id>', views.e_bank_guaranty, name="e_bank_guaranty"),  
    path('u_bank_guaranty/<int:id>', views.u_bank_guaranty, name="u_bank_guaranty"),  
    path('d_bank_guaranty/<int:id>', views.d_bank_guaranty, name="d_bank_guaranty"),

    #Liquidity_damages
    path('save_liquidity_damages', views.add_liquidity_damages, name="save_liquidity_damages"),  
    path('show_liquidity_damages', views.show_liquidity_damages, name="show_liquidity_damages"),  
    path('e_liquidity_damages/<int:id>', views.e_liquidity_damages, name="e_liquidity_damages"),  
    path('u_liquidity_damages/<int:id>', views.u_liquidity_damages, name="u_liquidity_damages"),  
    path('d_liquidity_damages/<int:id>', views.d_liquidity_damages, name="d_liquidity_damages"),

    #Insurance_type
    path('save_insurance_type', views.add_insurance_type, name="save_insurance_type"),  
    path('show_insurance_type', views.show_insurance_type, name="show_insurance_type"),  
    path('e_insurance_type/<int:id>', views.e_insurance_type, name="e_insurance_type"),  
    path('u_insurance_type/<int:id>', views.u_insurance_type, name="u_insurance_type"),  
    path('d_insurance_type/<int:id>', views.d_insurance_type, name="d_insurance_type"),

    #Insurance_detail
    path('save_insurance_detail', views.add_insurance_detail, name="save_insurance_detail"),  
    path('show_insurance_detail', views.show_insurance_detail, name="show_insurance_detail"),  
    path('e_insurance_detail/<int:id>', views.e_insurance_detail, name="e_insurance_detail"),  
    path('u_insurance_detail/<int:id>', views.u_insurance_detail, name="u_insurance_detail"),  
    path('d_insurance_detail/<int:id>', views.d_insurance_detail, name="d_insurance_detail"),

    #Module
    path('save_module', views.add_module, name="save_module"),  
    path('show_module', views.show_module, name="show_module"),  
    path('e_module/<int:id>', views.e_module, name="e_module"),  
    path('u_module/<int:id>', views.u_module, name="u_module"),  
    path('d_module/<int:id>', views.d_module, name="d_module"),

    
    #Employee_target
    path('save_employee_target', views.add_employee_target, name="save_employee_target"),  
    path('show_employee_target', views.show_employee_target, name="show_employee_target"),  
    path('e_employee_target/<int:id>', views.e_employee_target, name="e_employee_target"),  
    path('u_employee_target/<int:id>', views.u_employee_target, name="u_employee_target"),  
    path('d_employee_target/<int:id>', views.d_employee_target, name="d_employee_target"),
    path('generate_report', views.generate_report, name="generate_report"),
    path('load_employee', views.load_employee, name="load_employee"),
    path('project_summary', views.project_summary, name="project_summary"),
    path('load_branch', views.load_branch, name="load_branch"),

    #Employee_project
    path('save_employee_project', views.add_employee_project, name="save_employee_project"),  
    path('show_employee_project', views.show_employee_project, name="show_employee_project"),  
    path('e_employee_project/<int:id>', views.e_employee_project, name="e_employee_project"),  
    path('u_employee_project/<int:id>', views.u_employee_project, name="u_employee_project"),  
    path('d_employee_project/<int:id>', views.d_employee_project, name="d_employee_project"),

     #Leads
    path('save_leads', views.add_leads, name="save_leads"),  
    path('show_leads', views.show_leads, name="show_leads"),  
    path('e_leads/<int:id>', views.e_leads, name="e_leads"),  
    path('u_leads/<int:id>', views.u_leads, name="u_leads"),  
    path('d_leads/<int:id>', views.d_leads, name="d_leads"),
    path('save_sales', views.add_sales, name="save_sales"),  

    #Vendor
    path('save_vendor', views.add_vendor, name="save_vendor"),  
    path('show_vendor', views.show_vendor, name="show_vendor"),  
    path('e_vendor/<int:id>', views.e_vendor, name="e_vendor"),  
    path('u_vendor/<int:id>', views.u_vendor, name="u_vendor"),  
    path('d_vendor/<int:id>', views.d_vendor, name="d_vendor"),

    #Company_document 
    path('save_company_document', views.add_company_document, name="save_company_document"),  
    path('show_company_document', views.show_company_document, name="show_company_document"),  
    path('e_company_document/<int:id>', views.e_company_document, name="e_company_document"),  
    path('u_company_document/<int:id>', views.u_company_document, name="u_company_document"),  
    path('d_company_document/<int:id>', views.d_company_document, name="d_company_document"),

    #Company_document 
    path('save_issuing_authority', views.add_issuing_authority, name="save_issuing_authority"),  
    path('show_issuing_authority', views.show_issuing_authority, name="show_issuing_authority"),  
    path('e_issuing_authority/<int:id>', views.e_issuing_authority, name="e_issuing_authority"),  
    path('u_issuing_authority/<int:id>', views.u_issuing_authority, name="u_issuing_authority"),  
    path('d_issuing_authority/<int:id>', views.d_issuing_authority, name="d_issuing_authority"),

]+ static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)



