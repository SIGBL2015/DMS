from django.urls import path
from . import views


urlpatterns = [
    path('dashboard', views.dashboard, name="dashboard"),
    #employee
    path('save_emp', views.emp, name="save_emp"),  
    path('show_emp',views.show, name="show_emp"),  
    path('edit/<int:id>', views.edit, name="edit"),  
    path('update/<int:id>', views.update, name="update"),  
    path('delete/<int:id>', views.destroy, name="delete"), 

    #department
    path('save_depart', views.add_depart, name="save_depart"),  
    path('show_depart',views.show_depart, name="show_depart"),  
    path('e_depart/<int:id>', views.e_depart, name="e_depart"),  
    path('u_depart/<int:id>', views.u_depart, name="u_depart"),  
    path('d_depart/<int:id>', views.d_depart, name="d_depart"),

    #Designation
    path('save_design', views.add_design, name="save_design"),  
    path('show_design',views.show_design, name="show_design"),  
    path('e_design/<int:id>', views.e_design, name="e_design"),  
    path('u_design/<int:id>', views.u_design, name="u_design"),  
    path('d_design/<int:id>', views.d_design, name="d_design"),

    #Region
    path('save_region', views.add_region, name="save_region"),  
    path('show_region',views.show_region, name="show_region"),  
    path('e_region/<int:id>', views.e_region, name="e_region"),  
    path('u_region/<int:id>', views.u_region, name="u_region"),  
    path('d_region/<int:id>', views.d_region, name="d_region"),  

    #Education
    path('save_education', views.add_education, name="save_education"),  
    path('show_education',views.show_education, name="show_education"),  
    path('e_education/<int:id>', views.e_education, name="e_education"),  
    path('u_education/<int:id>', views.u_education, name="u_education"),  
    path('d_education/<int:id>', views.d_education, name="d_education"), 

    #Employement Record
    path('save_employement_record', views.add_employement_Record, name="save_employement_record"),  
    path('show_employement_record',views.show_employement_Record, name="show_employement_record"),  
    path('e_employement_record/<int:id>', views.e_employement_Record, name="e_employement_record"),  
    path('u_employement_record/<int:id>', views.u_employement_Record, name="u_employement_record"),  
    path('d_employement_record/<int:id>', views.d_employement_Record, name="d_employement_record"), 

    #Certification
    path('save_certification', views.add_certification, name="save_certification"),  
    path('show_certification',views.show_certification, name="show_certification"),  
    path('e_certification/<int:id>', views.e_certification, name="e_certification"),  
    path('u_certification/<int:id>', views.u_certification, name="u_certification"),  
    path('d_certification/<int:id>', views.d_certification, name="d_certification"), 

    #Skills
    path('save_skill', views.add_skill, name="save_skill"),  
    path('show_skill',views.show_skill, name="show_skill"),  
    path('e_skill/<int:id>', views.e_skill, name="e_skill"),  
    path('u_skill/<int:id>', views.u_skill, name="u_skill"),  
    path('d_skill/<int:id>', views.d_skill, name="d_skill"), 

    #CV_template
    path('save_cv_template', views.add_cv_template, name="save_cv_template"),  
    path('show_cv_template',views.show_cv_template, name="show_cv_template"),  
    path('e_cv_template/<int:id>', views.e_cv_template, name="e_cv_template"),  
    path('u_cv_template/<int:id>', views.u_cv_template, name="u_cv_template"),  
    path('d_cv_template/<int:id>', views.d_cv_template, name="d_cv_template"),
]