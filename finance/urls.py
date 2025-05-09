from django.urls import path
from . import views
from django.conf import settings
from django.conf.urls.static import static


urlpatterns = [
    #chart_of_account
    path('save_coa', views.add_coa, name="save_coa"),  
    path('show_coa', views.show_coa, name="show_coa"),  
    path('e_coa/<int:id>', views.e_coa, name="e_coa"),  
    path('u_coa/<int:id>', views.u_coa, name="u_coa"),  
    path('d_coa/<int:id>', views.d_coa, name="d_coa"), 
    path('load_detail', views.load_detail, name="load_detail"),

    #journal_entry
    path('save_journal_entry', views.add_journal_entry, name="save_journal_entry"),  
    path('show_journal_entry', views.show_journal_entry, name="show_journal_entry"), 
    path('save_revenue_entry', views.add_revenue_entry, name="save_revenue_entry"),  
    path('show_revenue_entry', views.show_revenue_entry, name="show_revenue_entry"),  
    path('e_journal_entry/<int:id>', views.e_journal_entry, name="e_journal_entry"),  
    path('u_journal_entry/<int:id>', views.u_journal_entry, name="u_journal_entry"),  
    path('d_journal_entry/<int:id>', views.d_journal_entry, name="d_journal_entry"),
    path('generate_refno', views.generate_refno, name="generate_refno"),
    path('generate_pnl', views.generate_pnl, name="generate_pnl"),
    path('load_account', views.load_account, name="load_account"),
    path('u_status', views.u_status, name="u_status"),
    path('generate_balance_sheet', views.generate_balance_sheet, name="generate_balance_sheet"),

]+ static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
