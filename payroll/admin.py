from django.contrib import admin
from .models import (
    PayrollPeriod, SalaryComponent, EmployeeSalaryStructure,
    SalaryComponentValue, PayrollCalculation, PayrollComponentDetail,
    TaxCalculation, PayrollPayment, PayrollDocument
)

@admin.register(PayrollPeriod)
class PayrollPeriodAdmin(admin.ModelAdmin):
    list_display = ('name', 'start_date', 'end_date', 'period_type', 'is_active')
    list_filter = ('period_type', 'is_active')
    search_fields = ('name',)

@admin.register(SalaryComponent)
class SalaryComponentAdmin(admin.ModelAdmin):
    list_display = ('name', 'code', 'component_type', 'is_taxable', 'is_mandatory')
    list_filter = ('component_type', 'is_taxable', 'is_mandatory')
    search_fields = ('name', 'code')

@admin.register(EmployeeSalaryStructure)
class EmployeeSalaryStructureAdmin(admin.ModelAdmin):
    list_display = ('employee', 'basic_salary', 'effective_from', 'effective_to', 'is_active')
    list_filter = ('is_active',)
    search_fields = ('employee__first_name', 'employee__last_name')

@admin.register(SalaryComponentValue)
class SalaryComponentValueAdmin(admin.ModelAdmin):
    list_display = ('salary_structure', 'component', 'amount', 'is_percentage')
    list_filter = ('is_percentage',)
    search_fields = ('salary_structure__employee__first_name', 'component__name')

@admin.register(PayrollCalculation)
class PayrollCalculationAdmin(admin.ModelAdmin):
    list_display = ('employee', 'period', 'gross_salary', 'total_deductions', 'net_salary', 'status')
    list_filter = ('status', 'period')
    search_fields = ('employee__first_name', 'employee__last_name')

@admin.register(PayrollComponentDetail)
class PayrollComponentDetailAdmin(admin.ModelAdmin):
    list_display = ('payroll_calculation', 'component', 'amount')
    search_fields = ('payroll_calculation__employee__first_name', 'component__name')

@admin.register(TaxCalculation)
class TaxCalculationAdmin(admin.ModelAdmin):
    list_display = ('payroll_calculation', 'tax_year', 'taxable_amount', 'tax_amount')
    list_filter = ('tax_year',)
    search_fields = ('payroll_calculation__employee__first_name',)

@admin.register(PayrollPayment)
class PayrollPaymentAdmin(admin.ModelAdmin):
    list_display = ('payroll_calculation', 'payment_date', 'payment_method', 'amount', 'status')
    list_filter = ('payment_method', 'status')
    search_fields = ('payroll_calculation__employee__first_name', 'reference_number')

@admin.register(PayrollDocument)
class PayrollDocumentAdmin(admin.ModelAdmin):
    list_display = ('payroll_calculation', 'document_type', 'uploaded_by', 'created_at')
    list_filter = ('document_type',)
    search_fields = ('payroll_calculation__employee__first_name', 'description')
