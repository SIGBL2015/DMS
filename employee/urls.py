from django.urls import path
from . import views


urlpatterns = [
    #employee
    path('emp', views.emp, name="emp"),  
    path('show',views.show, name="show"),  
    path('edit/<int:id>', views.edit, name="edit"),  
    path('update/<int:id>', views.update, name="update"),  
    path('delete/<int:id>', views.destroy, name="delete"), 

    #department
    path('save_depart', views.add_depart, name="save_depart"),  
    path('show_depart',views.show_depart, name="show_depart"),  
    path('e_depart/<int:id>', views.e_depart, name="e_depart"),  
    path('u_depart/<int:id>', views.u_depart, name="u_depart"),  
    path('d_depart/<int:id>', views.d_depart, name="d_depart"), 
]