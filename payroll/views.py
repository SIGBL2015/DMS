from django.shortcuts import render, get_object_or_404, redirect
from django.contrib.auth.decorators import login_required, permission_required
from django.contrib.auth.mixins import LoginRequiredMixin
from django.views.generic import ListView, DetailView, CreateView, UpdateView, DeleteView, TemplateView, FormView, View
from django.urls import reverse_lazy
from django.contrib import messages
from django.db.models import Sum, Count, Q
from django.http import JsonResponse, HttpResponse, HttpResponseRedirect
from django.template.loader import render_to_string
from django.core.paginator import Paginator
from employee.models import Employee
from .models import (
    PayrollPeriod, SalaryComponent, EmployeeSalaryStructure,
    SalaryComponentValue, PayrollCalculation, PayrollComponentDetail,
    TaxCalculation, PayrollPayment, PayrollDocument, AuditLog, PayrollRole,
    PayrollPermission, UserPayrollRole, PayrollWorkflow, PayrollWorkflowStep,
    PayrollWorkflowTask, PayrollWorkflowInstance, EmployeeAttendance, AttendanceRule
)
from .forms import (
    PayrollPeriodForm, SalaryComponentForm, EmployeeSalaryStructureForm,
    SalaryComponentValueForm, PayrollCalculationForm, PayrollComponentDetailForm,
    TaxCalculationModelForm, PayrollPaymentForm, PayrollDocumentForm,
    BulkPayrollCalculationForm, TaxCalculationForm, SalaryComponentCalculationForm,
    PayrollRoleForm, UserPayrollRoleForm, PayrollWorkflowForm, PayrollWorkflowStepForm,
    PayrollWorkflowTaskForm, EmployeeAttendanceForm, AttendanceBulkForm, AttendanceRuleForm,
    AttendanceImportForm
)
from .mixins import PayrollPermissionMixin, log_audit, SoftDeleteMixin
import xlsxwriter
import io
from datetime import datetime, timedelta
from django.utils import timezone
from django.contrib.auth.models import User
from django.core.mail import send_mail
from django.conf import settings
import pyotp
import qrcode
import base64
import pandas as pd
import socket
import struct
import logging
from django.core.files.storage import default_storage
from django.core.files.base import ContentFile
from .zkteco import ZKTecoDevice

logger = logging.getLogger(__name__)

# Dashboard View
class PayrollDashboardView(LoginRequiredMixin, TemplateView):
    template_name = 'payroll/dashboard.html'
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        
        # Get current date
        today = timezone.now().date()
        
        # Get active periods
        context['active_periods'] = PayrollPeriod.objects.filter(
            is_active=True,
            end_date__gte=today
        ).order_by('start_date')[:5]
        
        # Get recent calculations
        context['recent_calculations'] = PayrollCalculation.objects.all().order_by('-created_at')[:5]
        
        # Get pending payments
        context['pending_payments'] = PayrollPayment.objects.filter(
            status='PENDING'
        ).order_by('payment_date')[:5]
        
        # Get summary statistics
        context['total_employees'] = EmployeeSalaryStructure.objects.filter(is_active=True).count()
        context['total_periods'] = PayrollPeriod.objects.count()
        context['total_components'] = SalaryComponent.objects.count()
        
        # Get calculations by status
        context['draft_calculations'] = PayrollCalculation.objects.filter(status='DRAFT').count()
        context['processing_calculations'] = PayrollCalculation.objects.filter(status='PROCESSING').count()
        context['completed_calculations'] = PayrollCalculation.objects.filter(status='COMPLETED').count()
        context['paid_calculations'] = PayrollCalculation.objects.filter(status='PAID').count()
        
        # Get recent audit logs
        context['recent_audit_logs'] = AuditLog.objects.all().order_by('-created_at')[:10]
        
        return context

# Create your views here.

# Payroll Period Views
class PayrollPeriodListView(LoginRequiredMixin, PayrollPermissionMixin, ListView):
    model = PayrollPeriod
    template_name = 'payroll/period_list.html'
    context_object_name = 'periods'
    module = 'PERIOD'
    permission_type = 'VIEW'
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        # Log the view action
        log_audit(self.request.user, 'VIEW', 'PayrollPeriod', 0, 'Viewed payroll periods list')
        return context

class PayrollPeriodCreateView(LoginRequiredMixin, PayrollPermissionMixin, CreateView):
    model = PayrollPeriod
    form_class = PayrollPeriodForm
    template_name = 'payroll/period_form.html'
    success_url = reverse_lazy('payroll:period_list')
    module = 'PERIOD'
    permission_type = 'CREATE'
    
    def form_valid(self, form):
        response = super().form_valid(form)
        # Log the create action
        log_audit(self.request.user, 'CREATE', 'PayrollPeriod', self.object.id, f'Created payroll period: {self.object.name}')
        messages.success(self.request, 'Payroll period created successfully.')
        return response

class PayrollPeriodUpdateView(LoginRequiredMixin, PayrollPermissionMixin, UpdateView):
    model = PayrollPeriod
    form_class = PayrollPeriodForm
    template_name = 'payroll/period_form.html'
    success_url = reverse_lazy('payroll:period_list')
    module = 'PERIOD'
    permission_type = 'UPDATE'
    
    def form_valid(self, form):
        response = super().form_valid(form)
        # Log the update action
        log_audit(self.request.user, 'UPDATE', 'PayrollPeriod', self.object.id, f'Updated payroll period: {self.object.name}')
        messages.success(self.request, 'Payroll period updated successfully.')
        return response

class PayrollPeriodDeleteView(LoginRequiredMixin, PayrollPermissionMixin, SoftDeleteMixin, DeleteView):
    model = PayrollPeriod
    success_url = reverse_lazy('payroll:period_list')
    module = 'PERIOD'
    permission_type = 'DELETE'
    
    def delete(self, request, *args, **kwargs):
        period = self.get_object()
        period_id = period.id
        period_name = period.name
        response = super().delete(request, *args, **kwargs)
        # Log the delete action
        log_audit(request.user, 'DELETE', 'PayrollPeriod', period_id, f'Deleted payroll period: {period_name}')
        messages.success(request, 'Payroll period deleted successfully.')
        return response

# Salary Component Views
class SalaryComponentListView(LoginRequiredMixin, PayrollPermissionMixin, ListView):
    model = SalaryComponent
    template_name = 'payroll/component_list.html'
    context_object_name = 'components'
    module = 'COMPONENT'
    permission_type = 'VIEW'
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        # Log the view action
        log_audit(self.request.user, 'VIEW', 'SalaryComponent', 0, 'Viewed salary components list')
        return context

class SalaryComponentCreateView(LoginRequiredMixin, PayrollPermissionMixin, CreateView):
    model = SalaryComponent
    form_class = SalaryComponentForm
    template_name = 'payroll/component_form.html'
    success_url = reverse_lazy('payroll:component_list')
    module = 'COMPONENT'
    permission_type = 'CREATE'
    
    def form_valid(self, form):
        response = super().form_valid(form)
        # Log the create action
        log_audit(self.request.user, 'CREATE', 'SalaryComponent', self.object.id, f'Created salary component: {self.object.name}')
        messages.success(self.request, 'Salary component created successfully.')
        return response

class SalaryComponentUpdateView(LoginRequiredMixin, PayrollPermissionMixin, UpdateView):
    model = SalaryComponent
    form_class = SalaryComponentForm
    template_name = 'payroll/component_form.html'
    success_url = reverse_lazy('payroll:component_list')
    module = 'COMPONENT'
    permission_type = 'UPDATE'
    
    def form_valid(self, form):
        response = super().form_valid(form)
        # Log the update action
        log_audit(self.request.user, 'UPDATE', 'SalaryComponent', self.object.id, f'Updated salary component: {self.object.name}')
        messages.success(self.request, 'Salary component updated successfully.')
        return response

class SalaryComponentDeleteView(LoginRequiredMixin, PayrollPermissionMixin, SoftDeleteMixin, DeleteView):
    model = SalaryComponent
    success_url = reverse_lazy('payroll:component_list')
    module = 'COMPONENT'
    permission_type = 'DELETE'
    
    def delete(self, request, *args, **kwargs):
        component = self.get_object()
        component_id = component.id
        component_name = component.name
        response = super().delete(request, *args, **kwargs)
        # Log the delete action
        log_audit(request.user, 'DELETE', 'SalaryComponent', component_id, f'Deleted salary component: {component_name}')
        messages.success(request, 'Salary component deleted successfully.')
        return response

# Employee Salary Structure Views
class EmployeeSalaryStructureListView(LoginRequiredMixin, PayrollPermissionMixin, ListView):
    model = EmployeeSalaryStructure
    template_name = 'payroll/salary_structure_list.html'
    context_object_name = 'structures'
    module = 'PAYROLL'
    permission_type = 'VIEW'
    
    def get_queryset(self):
        return super().get_queryset().select_related('employee').order_by('-effective_from', 'employee')
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        log_audit(
            user=self.request.user,
            action='VIEW',
            model_name='EmployeeSalaryStructure',
            object_id=0,
            details='Viewed salary structures list'
        )
        return context

class EmployeeSalaryStructureCreateView(LoginRequiredMixin, CreateView):
    model = EmployeeSalaryStructure
    form_class = EmployeeSalaryStructureForm
    template_name = 'payroll/salary_structure_form.html'
    success_url = reverse_lazy('payroll:structure_list')

    def form_valid(self, form):
        messages.success(self.request, 'Salary structure created successfully.')
        return super().form_valid(form)

class EmployeeSalaryStructureUpdateView(LoginRequiredMixin, UpdateView):
    model = EmployeeSalaryStructure
    form_class = EmployeeSalaryStructureForm
    template_name = 'payroll/salary_structure_form.html'
    success_url = reverse_lazy('payroll:structure_list')

    def form_valid(self, form):
        messages.success(self.request, 'Salary structure updated successfully.')
        return super().form_valid(form)

class EmployeeSalaryStructureDeleteView(LoginRequiredMixin, SoftDeleteMixin, DeleteView):
    model = EmployeeSalaryStructure
    success_url = reverse_lazy('payroll:salary_structure_list')

    def delete(self, request, *args, **kwargs):
        messages.success(request, 'Salary structure deleted successfully.')
        return super().delete(request, *args, **kwargs)

# Payroll Calculation Views
class PayrollCalculationListView(LoginRequiredMixin, ListView):
    model = PayrollCalculation
    template_name = 'payroll/calculation_list.html'
    context_object_name = 'calculations'
    paginate_by = 10

    def get_queryset(self):
        queryset = super().get_queryset()
        period = self.request.GET.get('period')
        status = self.request.GET.get('status')
        employee = self.request.GET.get('employee')

        if period:
            queryset = queryset.filter(period_id=period)
        if status:
            queryset = queryset.filter(status=status)
        if employee:
            queryset = queryset.filter(employee_id=employee)

        return queryset.select_related('employee', 'period', 'created_by')

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['periods'] = PayrollPeriod.objects.filter(is_active=True)
        context['status_choices'] = PayrollCalculation.STATUS_CHOICES
        context['employees'] = EmployeeSalaryStructure.objects.filter(is_active=True).select_related('employee')
        # Add the bulk calculation form to the context
        context['form'] = BulkPayrollCalculationForm()
        return context

class PayrollCalculationCreateView(LoginRequiredMixin, CreateView):
    model = PayrollCalculation
    form_class = PayrollCalculationForm
    template_name = 'payroll/calculation_form.html'
    success_url = reverse_lazy('payroll:calculation_list')

    def form_valid(self, form):
        calculation = form.save(commit=False)
        calculation.created_by = self.request.user
        calculation.save()
        messages.success(self.request, 'Payroll calculation created successfully.')
        return super().form_valid(form)

class PayrollCalculationUpdateView(LoginRequiredMixin, UpdateView):
    model = PayrollCalculation
    form_class = PayrollCalculationForm
    template_name = 'payroll/calculation_form.html'
    success_url = reverse_lazy('payroll:calculation_list')

    def form_valid(self, form):
        messages.success(self.request, 'Payroll calculation updated successfully.')
        return super().form_valid(form)

class PayrollCalculationDeleteView(LoginRequiredMixin, SoftDeleteMixin, DeleteView):
    model = PayrollCalculation
    success_url = reverse_lazy('payroll:calculation_list')

    def delete(self, request, *args, **kwargs):
        messages.success(request, 'Payroll calculation deleted successfully.')
        return super().delete(request, *args, **kwargs)

class PayrollCalculationDetailView(LoginRequiredMixin, DetailView):
    model = PayrollCalculation
    template_name = 'payroll/calculation_detail.html'
    context_object_name = 'calculation'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        calculation = self.get_object()
        context['component_details'] = calculation.component_details.all()
        context['tax_calculations'] = calculation.tax_calculations.all()
        context['payments'] = calculation.payments.all()
        context['documents'] = calculation.documents.all()
        return context

class BulkPayrollCalculationView(LoginRequiredMixin, PayrollPermissionMixin, FormView):
    template_name = 'payroll/calculation_bulk.html'
    form_class = BulkPayrollCalculationForm
    success_url = reverse_lazy('payroll:calculation_list')

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['payroll_periods'] = PayrollPeriod.objects.filter(is_active=True)
        context['employees'] = Employee.objects.filter(status=1)  # 1 represents active status
        return context

    def form_valid(self, form):
        try:
            period = form.cleaned_data['period']
            employees = form.cleaned_data['employees']
            
            calculations_created = []
            for employee in employees:
                # Create payroll calculation for each employee
                calculation = PayrollCalculation.objects.create(
                    employee=employee,
                    period=period,
                    gross_salary=employee.basic_salary,
                    total_deductions=0,
                    net_salary=employee.basic_salary,
                    status='DRAFT',
                    created_by=self.request.user
                )
                
                # Add component details
                for component_value in employee.component_values.all():
                    PayrollComponentDetail.objects.create(
                        payroll_calculation=calculation,
                        component=component_value.component,
                        amount=component_value.amount
                    )
                calculations_created.append(calculation)
            
            if self.request.headers.get('X-Requested-With') == 'XMLHttpRequest':
                return JsonResponse({
                    'status': 'success',
                    'message': f'Successfully created {len(calculations_created)} payroll calculations.',
                    'calculations': [{
                        'id': calc.id,
                        'employee': calc.employee.get_full_name(),
                        'period': str(calc.period),
                        'status': calc.status
                    } for calc in calculations_created]
                })
            
            messages.success(self.request, f'Successfully created {len(calculations_created)} payroll calculations.')
            return super().form_valid(form)
            
        except Exception as e:
            logger.error(f"Error in bulk calculation: {str(e)}", exc_info=True)
            
            if self.request.headers.get('X-Requested-With') == 'XMLHttpRequest':
                return JsonResponse({
                    'status': 'error',
                    'message': 'An error occurred while creating the calculations. Please try again.'
                }, status=400)
            
            messages.error(self.request, 'An error occurred while creating the calculations. Please try again.')
            return self.form_invalid(form)

    def form_invalid(self, form):
        if self.request.headers.get('X-Requested-With') == 'XMLHttpRequest':
            return JsonResponse({
                'status': 'error',
                'message': 'Please correct the errors below.',
                'errors': form.errors
            }, status=400)
        return super().form_invalid(form)

class ExportPayrollCalculationsView(LoginRequiredMixin, ListView):
    model = PayrollCalculation
    template_name = 'payroll/calculation_list.html'

    def get(self, request, *args, **kwargs):
        format_type = request.GET.get('format', 'excel')
        calculations = self.get_queryset()

        if format_type == 'excel':
            return self.export_excel(calculations)
        else:
            return self.export_pdf(calculations)

    def export_excel(self, calculations):
        output = io.BytesIO()
        workbook = xlsxwriter.Workbook(output)
        worksheet = workbook.add_worksheet()

        # Write headers
        headers = ['Employee', 'Period', 'Gross Salary', 'Deductions', 'Net Salary', 'Status']
        for col, header in enumerate(headers):
            worksheet.write(0, col, header)

        # Write data
        for row, calc in enumerate(calculations, start=1):
            worksheet.write(row, 0, str(calc.employee))
            worksheet.write(row, 1, str(calc.period))
            worksheet.write(row, 2, float(calc.gross_salary))
            worksheet.write(row, 3, float(calc.total_deductions))
            worksheet.write(row, 4, float(calc.net_salary))
            worksheet.write(row, 5, calc.get_status_display())

        workbook.close()
        output.seek(0)

        response = HttpResponse(
            output.read(),
            content_type='application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
        )
        response['Content-Disposition'] = f'attachment; filename=payroll_calculations_{datetime.now().strftime("%Y%m%d")}.xlsx'
        return response

    def export_pdf(self, calculations):
        html = render_to_string('payroll/calculation_list_pdf.html', {
            'calculations': calculations
        })
        # Add PDF generation logic here
        return HttpResponse('PDF generation not implemented yet')

# Payroll Payment Views
class PayrollPaymentCreateView(LoginRequiredMixin, CreateView):
    model = PayrollPayment
    form_class = PayrollPaymentForm
    template_name = 'payroll/payment_form.html'
    success_url = reverse_lazy('payroll:payment_list')

    def get_initial(self):
        calculation_id = self.kwargs.get('calculation_id')
        if calculation_id:
            calculation = get_object_or_404(PayrollCalculation, id=calculation_id)
            return {
                'payroll_calculation': calculation,
                'amount': calculation.net_salary,
                'payment_date': datetime.now().date(),
                'status': 'PENDING'
            }
        return {}

    def form_valid(self, form):
        payment = form.save(commit=False)
        payment.created_by = self.request.user
        payment.save()
        messages.success(self.request, 'Payment recorded successfully.')
        return super().form_valid(form)

    def get_success_url(self):
        return reverse_lazy('payroll:calculation_detail', kwargs={'pk': self.kwargs.get('calculation_id')})

class PayrollPaymentUpdateView(LoginRequiredMixin, UpdateView):
    model = PayrollPayment
    form_class = PayrollPaymentForm
    template_name = 'payroll/payment_form.html'
    success_url = reverse_lazy('payroll:payment_list')

    def form_valid(self, form):
        messages.success(self.request, 'Payment updated successfully.')
        return super().form_valid(form)

class PayrollPaymentDeleteView(LoginRequiredMixin, SoftDeleteMixin, DeleteView):
    model = PayrollPayment
    success_url = reverse_lazy('payroll:payment_list')

    def delete(self, request, *args, **kwargs):
        messages.success(request, 'Payment deleted successfully.')
        return super().delete(request, *args, **kwargs)

class PayrollPaymentListView(LoginRequiredMixin, ListView):
    model = PayrollPayment
    template_name = 'payroll/payment_list.html'
    context_object_name = 'payments'
    paginate_by = 10

    def get_queryset(self):
        queryset = super().get_queryset()
        calculation_id = self.request.GET.get('calculation')
        if calculation_id:
            queryset = queryset.filter(payroll_calculation_id=calculation_id)
        return queryset.order_by('-payment_date')

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        # Get calculations that don't have any payments yet
        paid_calculation_ids = PayrollPayment.objects.values_list('payroll_calculation_id', flat=True)
        context['calculations'] = PayrollCalculation.objects.exclude(
            id__in=paid_calculation_ids
        ).select_related('employee', 'period').order_by('-created_at')
        return context

class PayrollPaymentDetailView(LoginRequiredMixin, DetailView):
    model = PayrollPayment
    template_name = 'payroll/payment_detail.html'
    context_object_name = 'payment'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        payment = self.get_object()
        context['calculation'] = payment.payroll_calculation
        return context

# Document Management Views
class PayrollDocumentCreateView(LoginRequiredMixin, CreateView):
    model = PayrollDocument
    form_class = PayrollDocumentForm
    template_name = 'payroll/document_form.html'
    success_url = reverse_lazy('payroll:document_list')

    def get_initial(self):
        calculation_id = self.request.GET.get('calculation')
        if calculation_id:
            return {'payroll_calculation': calculation_id}
        return {}

    def form_valid(self, form):
        document = form.save(commit=False)
        document.uploaded_by = self.request.user
        document.save()
        messages.success(self.request, 'Document uploaded successfully.')
        return super().form_valid(form)

class PayrollDocumentUpdateView(LoginRequiredMixin, UpdateView):
    model = PayrollDocument
    form_class = PayrollDocumentForm
    template_name = 'payroll/document_form.html'
    success_url = reverse_lazy('payroll:document_list')

    def form_valid(self, form):
        messages.success(self.request, 'Document updated successfully.')
        return super().form_valid(form)

class PayrollDocumentDeleteView(LoginRequiredMixin, SoftDeleteMixin, DeleteView):
    model = PayrollDocument
    success_url = reverse_lazy('payroll:document_list')

    def delete(self, request, *args, **kwargs):
        messages.success(request, 'Document deleted successfully.')
        return super().delete(request, *args, **kwargs)

class PayrollDocumentListView(LoginRequiredMixin, ListView):
    model = PayrollDocument
    template_name = 'payroll/document_list.html'
    context_object_name = 'documents'
    paginate_by = 10

    def get_queryset(self):
        queryset = super().get_queryset()
        calculation_id = self.request.GET.get('calculation')
        if calculation_id:
            queryset = queryset.filter(payroll_calculation_id=calculation_id)
        return queryset.order_by('-created_at')

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['calculations'] = PayrollCalculation.objects.all()
        return context

# API Views
@login_required
def get_employee_salary_components(request, employee_id):
    try:
        salary_structure = EmployeeSalaryStructure.objects.get(
            employee_id=employee_id,
            is_active=True
        )
        components = SalaryComponentValue.objects.filter(
            salary_structure=salary_structure
        ).select_related('component')
        
        data = [{
            'id': comp.component.id,
            'name': comp.component.name,
            'amount': str(comp.amount),
            'is_percentage': comp.is_percentage
        } for comp in components]
        
        return JsonResponse({'components': data})
    except EmployeeSalaryStructure.DoesNotExist:
        return JsonResponse({'error': 'No active salary structure found'}, status=404)

@login_required
def calculate_tax(request):
    if request.method == 'POST':
        form = TaxCalculationForm(request.POST)
        if form.is_valid():
            taxable_amount = form.cleaned_data['taxable_amount']
            tax_rate = form.cleaned_data['tax_rate']
            tax_amount = taxable_amount * (tax_rate / 100)
            
            return JsonResponse({
                'taxable_amount': str(taxable_amount),
                'tax_rate': str(tax_rate),
                'tax_amount': str(tax_amount)
            })
    return JsonResponse({'error': 'Invalid request'}, status=400)

# Report Generation Views
@login_required
def generate_payslip(request, calculation_id):
    calculation = get_object_or_404(PayrollCalculation, id=calculation_id)
    context = {
        'calculation': calculation,
        'component_details': calculation.component_details.all(),
        'tax_calculations': calculation.tax_calculations.all(),
    }
    return render(request, 'payroll/payslip_template.html', context)

@login_required
def generate_tax_report(request, year):
    calculations = PayrollCalculation.objects.filter(
        tax_calculations__tax_year=year
    ).prefetch_related('tax_calculations')
    
    context = {
        'year': year,
        'calculations': calculations,
        'total_taxable_amount': calculations.aggregate(
            total=Sum('tax_calculations__taxable_amount')
        )['total'] or 0,
        'total_tax_amount': calculations.aggregate(
            total=Sum('tax_calculations__tax_amount')
        )['total'] or 0,
    }
    return render(request, 'payroll/tax_report.html', context)

@login_required
def tax_report(request):
    # Get all years with tax calculations
    years = TaxCalculation.objects.values_list('tax_year', flat=True).distinct().order_by('-tax_year')
    
    # Get the selected year from the query parameters, default to the most recent year
    selected_year = request.GET.get('year')
    if selected_year:
        selected_year = int(selected_year)
    elif years:
        selected_year = years[0]
    else:
        selected_year = datetime.now().year
    
    # Get calculations for the selected year
    calculations = PayrollCalculation.objects.filter(
        tax_calculations__tax_year=selected_year
    ).prefetch_related('tax_calculations')
    
    context = {
        'years': years,
        'selected_year': selected_year,
        'calculations': calculations,
        'total_taxable_amount': calculations.aggregate(
            total=Sum('tax_calculations__taxable_amount')
        )['total'] or 0,
        'total_tax_amount': calculations.aggregate(
            total=Sum('tax_calculations__tax_amount')
        )['total'] or 0,
    }
    return render(request, 'payroll/tax_report_list.html', context)

# Audit Log Views
class AuditLogListView(LoginRequiredMixin, PayrollPermissionMixin, ListView):
    model = AuditLog
    template_name = 'payroll/audit_log_list.html'
    context_object_name = 'audit_logs'
    paginate_by = 20
    module = 'REPORT'
    permission_type = 'VIEW'
    
    def get_queryset(self):
        queryset = AuditLog.objects.all().order_by('-created_at')
        
        # Filter by user if provided
        user_id = self.request.GET.get('user')
        if user_id:
            queryset = queryset.filter(user_id=user_id)
            
        # Filter by action if provided
        action = self.request.GET.get('action')
        if action:
            queryset = queryset.filter(action=action)
            
        # Filter by date range if provided
        start_date = self.request.GET.get('start_date')
        end_date = self.request.GET.get('end_date')
        if start_date and end_date:
            queryset = queryset.filter(created_at__date__range=[start_date, end_date])
            
        return queryset
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        
        # Add filter options to context
        context['users'] = User.objects.filter(auditlog__isnull=False).distinct()
        context['actions'] = AuditLog.ACTION_TYPES
        
        # Add current filters to context
        context['current_user'] = self.request.GET.get('user')
        context['current_action'] = self.request.GET.get('action')
        context['current_start_date'] = self.request.GET.get('start_date')
        context['current_end_date'] = self.request.GET.get('end_date')
        
        # Log the view action
        log_audit(self.request.user, 'VIEW', 'AuditLog', 0, 'Viewed audit logs')
        
        return context

class MFAVerifyView(LoginRequiredMixin, TemplateView):
    template_name = 'payroll/mfa_verify.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['mfa_method'] = self.request.session.get('mfa_method', 'EMAIL')
        return context

    def post(self, request, *args, **kwargs):
        mfa_code = request.POST.get('mfa_code')
        stored_code = request.session.get('mfa_code')
        expiry = request.session.get('mfa_expiry')

        if not mfa_code or not stored_code or not expiry:
            messages.error(request, 'Invalid MFA attempt')
            return redirect('mfa_verify')

        if timezone.now().timestamp() > float(expiry):
            messages.error(request, 'MFA code expired')
            return redirect('mfa_verify')

        if mfa_code == stored_code:
            request.session['mfa_verified'] = True
            del request.session['mfa_code']
            del request.session['mfa_expiry']
            messages.success(request, 'MFA verification successful')
            return redirect('payroll:dashboard')
        else:
            messages.error(request, 'Invalid MFA code')
            return redirect('mfa_verify')

class MFASetupView(LoginRequiredMixin, TemplateView):
    template_name = 'payroll/mfa_setup.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        
        # Generate TOTP secret
        secret = pyotp.random_base32()
        self.request.session['mfa_secret'] = secret
        
        # Generate QR code
        totp = pyotp.TOTP(secret)
        provisioning_uri = totp.provisioning_uri(
            self.request.user.email,
            issuer_name="Payroll System"
        )
        
        qr = qrcode.QRCode(version=1, box_size=10, border=5)
        qr.add_data(provisioning_uri)
        qr.make(fit=True)
        
        img = qr.make_image(fill_color="black", back_color="white")
        buffer = io.BytesIO()
        img.save(buffer, format='PNG')
        qr_code = base64.b64encode(buffer.getvalue()).decode()
        
        context['qr_code'] = qr_code
        context['secret'] = secret
        return context

    def post(self, request, *args, **kwargs):
        secret = request.session.get('mfa_secret')
        if not secret:
            messages.error(request, 'MFA setup failed')
            return redirect('mfa_setup')

        totp = pyotp.TOTP(secret)
        verification_code = request.POST.get('verification_code')

        if totp.verify(verification_code):
            # Save MFA secret to user profile
            request.user.profile.mfa_secret = secret
            request.user.profile.mfa_enabled = True
            request.user.profile.save()
            
            del request.session['mfa_secret']
            messages.success(request, 'MFA setup successful')
            return redirect('payroll:dashboard')
        else:
            messages.error(request, 'Invalid verification code')
            return redirect('mfa_setup')

def send_mfa_code(request):
    if not request.user.is_authenticated:
        return JsonResponse({'error': 'Not authenticated'}, status=401)

    try:
        # Generate 6-digit code
        code = pyotp.random.randint(100000, 999999)
        expiry = timezone.now().timestamp() + 300  # 5 minutes expiry
        
        # Store code in session
        request.session['mfa_code'] = str(code)
        request.session['mfa_expiry'] = str(expiry)
        
        # Send code via email
        send_mail(
            'Your MFA Code',
            f'Your MFA verification code is: {code}\nThis code will expire in 5 minutes.',
            settings.DEFAULT_FROM_EMAIL,
            [request.user.email],
            fail_silently=False,
        )
        
        return JsonResponse({'message': 'MFA code sent'})
    except Exception as e:
        return JsonResponse({'error': str(e)}, status=500)

# Role Management Views
class PayrollRoleListView(LoginRequiredMixin, PayrollPermissionMixin, ListView):
    model = PayrollRole
    template_name = 'payroll/role_list.html'
    context_object_name = 'roles'
    module = 'SETTING'
    permission_type = 'VIEW'
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        # Log the view action
        log_audit(self.request.user, 'VIEW', 'PayrollRole', 0, 'Viewed payroll roles list')
        return context

class PayrollRoleCreateView(LoginRequiredMixin, PayrollPermissionMixin, CreateView):
    model = PayrollRole
    form_class = PayrollRoleForm
    template_name = 'payroll/role_form.html'
    success_url = reverse_lazy('payroll:role_list')
    module = 'SETTING'
    permission_type = 'CREATE'
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        # Group permissions by module
        permissions = PayrollPermission.objects.all().order_by('module')
        permissions_by_module = {}
        for permission in permissions:
            if permission.module not in permissions_by_module:
                permissions_by_module[permission.module] = []
            permissions_by_module[permission.module].append(permission)
        context['permissions_by_module'] = permissions_by_module
        return context
    
    def form_valid(self, form):
        response = super().form_valid(form)
        # Log the create action
        log_audit(self.request.user, 'CREATE', 'PayrollRole', self.object.pk, f'Created payroll role: {self.object.name}')
        messages.success(self.request, f'Role "{self.object.name}" created successfully.')
        return response

class PayrollRoleUpdateView(LoginRequiredMixin, PayrollPermissionMixin, UpdateView):
    model = PayrollRole
    form_class = PayrollRoleForm
    template_name = 'payroll/role_form.html'
    success_url = reverse_lazy('payroll:role_list')
    module = 'SETTING'
    permission_type = 'UPDATE'
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        # Group permissions by module
        permissions = PayrollPermission.objects.all().order_by('module')
        permissions_by_module = {}
        for permission in permissions:
            if permission.module not in permissions_by_module:
                permissions_by_module[permission.module] = []
            permissions_by_module[permission.module].append(permission)
        context['permissions_by_module'] = permissions_by_module
        return context
    
    def form_valid(self, form):
        response = super().form_valid(form)
        # Log the update action
        log_audit(self.request.user, 'UPDATE', 'PayrollRole', self.object.pk, f'Updated payroll role: {self.object.name}')
        messages.success(self.request, f'Role "{self.object.name}" updated successfully.')
        return response

class PayrollRoleDeleteView(LoginRequiredMixin, PayrollPermissionMixin, SoftDeleteMixin, DeleteView):
    model = PayrollRole
    success_url = reverse_lazy('payroll:role_list')
    module = 'SETTING'
    permission_type = 'DELETE'
    
    def delete(self, request, *args, **kwargs):
        role = self.get_object()
        role_name = role.name
        response = super().delete(request, *args, **kwargs)
        # Log the delete action
        log_audit(request.user, 'DELETE', 'PayrollRole', role.pk, f'Deleted payroll role: {role_name}')
        messages.success(request, f'Role "{role_name}" deleted successfully.')
        return response

class PayrollRoleDetailView(LoginRequiredMixin, PayrollPermissionMixin, DetailView):
    model = PayrollRole
    template_name = 'payroll/role_detail.html'
    context_object_name = 'role'
    module = 'SETTING'
    permission_type = 'VIEW'
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        # Group permissions by module
        permissions = PayrollPermission.objects.all().order_by('module')
        permissions_by_module = {}
        for permission in permissions:
            if permission.module not in permissions_by_module:
                permissions_by_module[permission.module] = []
            permissions_by_module[permission.module].append(permission)
        context['permissions_by_module'] = permissions_by_module
        # Log the view action
        log_audit(self.request.user, 'VIEW', 'PayrollRole', self.object.pk, f'Viewed payroll role: {self.object.name}')
        return context

class UserPayrollRoleCreateView(LoginRequiredMixin, PayrollPermissionMixin, CreateView):
    model = UserPayrollRole
    form_class = UserPayrollRoleForm
    template_name = 'payroll/user_role_form.html'
    success_url = reverse_lazy('payroll:role_list')
    module = 'SETTING'
    permission_type = 'CREATE'
    
    def form_valid(self, form):
        form.instance.assigned_by = self.request.user
        response = super().form_valid(form)
        # Log the create action
        log_audit(self.request.user, 'CREATE', 'UserPayrollRole', self.object.pk, 
                 f'Assigned role {self.object.role.name} to user {self.object.user.username}')
        messages.success(self.request, f'Role "{self.object.role.name}" assigned to {self.object.user.username} successfully.')
        return response

class UserPayrollRoleUpdateView(LoginRequiredMixin, PayrollPermissionMixin, UpdateView):
    model = UserPayrollRole
    form_class = UserPayrollRoleForm
    template_name = 'payroll/user_role_form.html'
    success_url = reverse_lazy('payroll:role_list')
    module = 'SETTING'
    permission_type = 'UPDATE'
    
    def form_valid(self, form):
        response = super().form_valid(form)
        # Log the update action
        log_audit(self.request.user, 'UPDATE', 'UserPayrollRole', self.object.pk, 
                 f'Updated role assignment for {self.object.user.username}')
        messages.success(self.request, f'Role assignment for {self.object.user.username} updated successfully.')
        return response

class UserPayrollRoleDeleteView(LoginRequiredMixin, PayrollPermissionMixin, SoftDeleteMixin, DeleteView):
    model = UserPayrollRole
    success_url = reverse_lazy('payroll:role_list')
    module = 'SETTING'
    permission_type = 'DELETE'
    
    def delete(self, request, *args, **kwargs):
        user_role = self.get_object()
        username = user_role.user.username
        role_name = user_role.role.name
        response = super().delete(request, *args, **kwargs)
        # Log the delete action
        log_audit(request.user, 'DELETE', 'UserPayrollRole', user_role.pk, 
                 f'Removed role {role_name} from user {username}')
        messages.success(request, f'Role "{role_name}" removed from {username} successfully.')
        return response

# Workflow Views
class PayrollWorkflowListView(LoginRequiredMixin, PayrollPermissionMixin, ListView):
    model = PayrollWorkflow
    template_name = 'payroll/workflow_list.html'
    context_object_name = 'workflows'
    module = 'WORKFLOW'
    permission_type = 'VIEW'

    def get_queryset(self):
        return PayrollWorkflow.objects.all().prefetch_related('steps')

class PayrollWorkflowCreateView(LoginRequiredMixin, PayrollPermissionMixin, CreateView):
    model = PayrollWorkflow
    form_class = PayrollWorkflowForm
    template_name = 'payroll/workflow_form.html'
    module = 'WORKFLOW'
    permission_type = 'CREATE'

    def form_valid(self, form):
        response = super().form_valid(form)
        log_audit(self.request.user, 'CREATE', 'Created workflow: {}'.format(self.object.name))
        return response

class PayrollWorkflowUpdateView(LoginRequiredMixin, PayrollPermissionMixin, UpdateView):
    model = PayrollWorkflow
    form_class = PayrollWorkflowForm
    template_name = 'payroll/workflow_form.html'
    module = 'WORKFLOW'
    permission_type = 'UPDATE'

    def form_valid(self, form):
        response = super().form_valid(form)
        log_audit(self.request.user, 'UPDATE', 'Updated workflow: {}'.format(self.object.name))
        return response

class PayrollWorkflowDeleteView(LoginRequiredMixin, PayrollPermissionMixin, SoftDeleteMixin, DeleteView):
    model = PayrollWorkflow
    template_name = 'payroll/workflow_confirm_delete.html'
    success_url = reverse_lazy('payroll:workflow_list')
    module = 'WORKFLOW'
    permission_type = 'DELETE'

    def delete(self, request, *args, **kwargs):
        workflow = self.get_object()
        workflow_name = workflow.name
        response = super().delete(request, *args, **kwargs)
        log_audit(request.user, 'DELETE', 'Deleted workflow: {}'.format(workflow_name))
        return response

class PayrollWorkflowDetailView(LoginRequiredMixin, PayrollPermissionMixin, DetailView):
    model = PayrollWorkflow
    template_name = 'payroll/workflow_detail.html'
    context_object_name = 'workflow'
    module = 'WORKFLOW'
    permission_type = 'VIEW'
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        workflow = self.get_object()
        
        # Get active instances of this workflow
        context['active_instances'] = PayrollWorkflowInstance.objects.filter(
            workflow=workflow,
            status__in=['PENDING', 'IN_PROGRESS']
        ).select_related('payroll_calculation', 'current_step')
        
        # Get completed instances
        context['completed_instances'] = PayrollWorkflowInstance.objects.filter(
            workflow=workflow,
            status='COMPLETED'
        ).select_related('payroll_calculation').order_by('-completed_at')[:5]
        
        # Get tasks assigned to current user
        context['my_tasks'] = PayrollWorkflowTask.objects.filter(
            workflow_instance__workflow=workflow,
            assigned_to=self.request.user,
            status__in=['PENDING', 'IN_PROGRESS']
        ).select_related('workflow_instance', 'step')
        
        # Log the view action
        log_audit(self.request.user, 'VIEW', 'PayrollWorkflow', workflow.pk, 
                 f'Viewed workflow details: {workflow.name}')
        
        return context

class PayrollWorkflowStepCreateView(LoginRequiredMixin, PayrollPermissionMixin, CreateView):
    model = PayrollWorkflowStep
    form_class = PayrollWorkflowStepForm
    template_name = 'payroll/workflow_step_form.html'
    module = 'WORKFLOW'
    permission_type = 'CREATE'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        workflow_id = self.kwargs.get('workflow_pk')
        context['workflow'] = get_object_or_404(PayrollWorkflow, pk=workflow_id)
        return context

    def form_valid(self, form):
        workflow_id = self.kwargs.get('workflow_pk')
        form.instance.workflow = get_object_or_404(PayrollWorkflow, pk=workflow_id)
        response = super().form_valid(form)
        log_audit(self.request.user, 'CREATE', 'Created workflow step: {}'.format(self.object.name))
        return response

    def get_success_url(self):
        return reverse_lazy('payroll:workflow_step_list', kwargs={'workflow_pk': self.kwargs.get('workflow_pk')})

class PayrollWorkflowStepUpdateView(LoginRequiredMixin, PayrollPermissionMixin, UpdateView):
    model = PayrollWorkflowStep
    form_class = PayrollWorkflowStepForm
    template_name = 'payroll/workflow_step_form.html'
    module = 'WORKFLOW'
    permission_type = 'UPDATE'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['workflow'] = self.object.workflow
        return context

    def form_valid(self, form):
        response = super().form_valid(form)
        log_audit(self.request.user, 'UPDATE', 'Updated workflow step: {}'.format(self.object.name))
        return response

    def get_success_url(self):
        return reverse_lazy('payroll:workflow_step_list', kwargs={'workflow_pk': self.object.workflow.pk})

class PayrollWorkflowStepDeleteView(LoginRequiredMixin, PayrollPermissionMixin, SoftDeleteMixin, DeleteView):
    model = PayrollWorkflowStep
    template_name = 'payroll/workflow_step_confirm_delete.html'
    module = 'WORKFLOW'
    permission_type = 'DELETE'

    def get_success_url(self):
        return reverse_lazy('payroll:workflow_detail', kwargs={'pk': self.object.workflow.pk})

    def delete(self, request, *args, **kwargs):
        step = self.get_object()
        step_name = step.name
        response = super().delete(request, *args, **kwargs)
        log_audit(request.user, 'DELETE', 'Deleted workflow step: {}'.format(step_name))
        return response

class PayrollWorkflowTaskListView(LoginRequiredMixin, PayrollPermissionMixin, ListView):
    model = PayrollWorkflowTask
    template_name = 'payroll/workflow_task_list.html'
    context_object_name = 'tasks'
    module = 'WORKFLOW'
    permission_type = 'VIEW'

    def get_queryset(self):
        return PayrollWorkflowTask.objects.filter(
            workflow_instance__workflow__is_active=True
        ).select_related(
            'workflow_instance__workflow',
            'assigned_to'
        )

class PayrollWorkflowTaskUpdateView(LoginRequiredMixin, PayrollPermissionMixin, UpdateView):
    model = PayrollWorkflowTask
    form_class = PayrollWorkflowTaskForm
    template_name = 'payroll/workflow_task_form.html'
    module = 'WORKFLOW'
    permission_type = 'UPDATE'

    def get_queryset(self):
        return PayrollWorkflowTask.objects.filter(assigned_to=self.request.user)

    def form_valid(self, form):
        response = super().form_valid(form)
        log_audit(self.request.user, 'UPDATE', 'Updated workflow task: {}'.format(self.object))
        return response

# Workflow Instance Management Views
class PayrollWorkflowInstanceListView(LoginRequiredMixin, PayrollPermissionMixin, ListView):
    model = PayrollWorkflowInstance
    template_name = 'payroll/workflow_instance_list.html'
    context_object_name = 'instances'
    module = 'WORKFLOW'
    permission_type = 'VIEW'
    
    def get_queryset(self):
        queryset = PayrollWorkflowInstance.objects.all().select_related(
            'workflow', 'payroll_calculation', 'current_step'
        )
        
        # Filter by status if provided
        status = self.request.GET.get('status')
        if status:
            queryset = queryset.filter(status=status)
            
        # Filter by workflow if provided
        workflow_id = self.request.GET.get('workflow')
        if workflow_id:
            queryset = queryset.filter(workflow_id=workflow_id)
            
        return queryset.order_by('-started_at')
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['workflows'] = PayrollWorkflow.objects.filter(is_active=True)
        context['status_choices'] = PayrollWorkflowInstance.STATUS_CHOICES
        context['current_status'] = self.request.GET.get('status')
        context['current_workflow'] = self.request.GET.get('workflow')
        
        # Log the view action
        log_audit(self.request.user, 'VIEW', 'PayrollWorkflowInstance', 0, 'Viewed workflow instances list')
        
        return context

class PayrollWorkflowInstanceDetailView(LoginRequiredMixin, PayrollPermissionMixin, DetailView):
    model = PayrollWorkflowInstance
    template_name = 'payroll/workflow_instance_detail.html'
    context_object_name = 'instance'
    module = 'WORKFLOW'
    permission_type = 'VIEW'
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        instance = self.get_object()
        
        # Get all tasks for this instance
        context['tasks'] = PayrollWorkflowTask.objects.filter(
            workflow_instance=instance
        ).select_related('step', 'assigned_to').order_by('step__order')
        
        # Get task history
        context['task_history'] = PayrollWorkflowTask.objects.filter(
            workflow_instance=instance,
            status__in=['COMPLETED', 'REJECTED']
        ).select_related('step', 'assigned_to').order_by('-completed_at')
        
        # Log the view action
        log_audit(self.request.user, 'VIEW', 'PayrollWorkflowInstance', instance.pk, 
                 f'Viewed workflow instance details: {instance}')
        
        return context

@login_required
@permission_required('payroll.can_manage_workflow', raise_exception=True)
def start_workflow_instance(request, pk):
    instance = get_object_or_404(PayrollWorkflowInstance, pk=pk)
    
    if instance.status != 'PENDING':
        messages.error(request, f'Cannot start workflow instance with status: {instance.status}')
        return redirect('payroll:workflow_instance_detail', pk=instance.pk)
    
    # Get the first step
    first_step = instance.workflow.steps.order_by('order').first()
    if not first_step:
        messages.error(request, 'Workflow has no steps defined')
        return redirect('payroll:workflow_instance_detail', pk=instance.pk)
    
    # Update instance
    instance.status = 'IN_PROGRESS'
    instance.current_step = first_step
    instance.save()
    
    # Create task for the first step
    PayrollWorkflowTask.objects.create(
        workflow_instance=instance,
        step=first_step,
        status='PENDING',
        due_date=timezone.now() + timezone.timedelta(days=first_step.timeout_days) if first_step.timeout_days > 0 else None
    )
    
    # Log the action
    log_audit(request.user, 'UPDATE', 'PayrollWorkflowInstance', instance.pk, 
             f'Started workflow instance: {instance}')
    
    messages.success(request, f'Workflow instance started successfully')
    return redirect('payroll:workflow_instance_detail', pk=instance.pk)

@login_required
@permission_required('payroll.can_manage_workflow', raise_exception=True)
def complete_workflow_instance(request, pk):
    instance = get_object_or_404(PayrollWorkflowInstance, pk=pk)
    
    if instance.status != 'IN_PROGRESS':
        messages.error(request, f'Cannot complete workflow instance with status: {instance.status}')
        return redirect('payroll:workflow_instance_detail', pk=instance.pk)
    
    # Check if all required tasks are completed
    required_tasks = PayrollWorkflowTask.objects.filter(
        workflow_instance=instance,
        step__is_required=True,
        status__in=['PENDING', 'IN_PROGRESS']
    )
    
    if required_tasks.exists():
        messages.error(request, 'Cannot complete workflow: some required tasks are not completed')
        return redirect('payroll:workflow_instance_detail', pk=instance.pk)
    
    # Update instance
    instance.status = 'COMPLETED'
    instance.completed_at = timezone.now()
    instance.save()
    
    # Log the action
    log_audit(request.user, 'UPDATE', 'PayrollWorkflowInstance', instance.pk, 
             f'Completed workflow instance: {instance}')
    
    messages.success(request, f'Workflow instance completed successfully')
    return redirect('payroll:workflow_instance_detail', pk=instance.pk)

@login_required
@permission_required('payroll.can_manage_workflow', raise_exception=True)
def cancel_workflow_instance(request, pk):
    instance = get_object_or_404(PayrollWorkflowInstance, pk=pk)
    
    if instance.status not in ['PENDING', 'IN_PROGRESS']:
        messages.error(request, f'Cannot cancel workflow instance with status: {instance.status}')
        return redirect('payroll:workflow_instance_detail', pk=instance.pk)
    
    # Update instance
    instance.status = 'CANCELLED'
    instance.save()
    
    # Cancel all pending tasks
    PayrollWorkflowTask.objects.filter(
        workflow_instance=instance,
        status__in=['PENDING', 'IN_PROGRESS']
    ).update(status='CANCELLED')
    
    # Log the action
    log_audit(request.user, 'UPDATE', 'PayrollWorkflowInstance', instance.pk, 
             f'Cancelled workflow instance: {instance}')
    
    messages.success(request, f'Workflow instance cancelled successfully')
    return redirect('payroll:workflow_instance_detail', pk=instance.pk)

@login_required
@permission_required('payroll.can_manage_workflow', raise_exception=True)
def assign_workflow_task(request, pk):
    task = get_object_or_404(PayrollWorkflowTask, pk=pk)
    
    if task.status != 'PENDING':
        messages.error(request, f'Cannot assign task with status: {task.status}')
        return redirect('payroll:workflow_instance_detail', pk=task.workflow_instance.pk)
    
    if request.method == 'POST':
        user_id = request.POST.get('user')
        if not user_id:
            messages.error(request, 'Please select a user to assign the task to')
            return redirect('payroll:workflow_instance_detail', pk=task.workflow_instance.pk)
        
        user = get_object_or_404(User, id=user_id)
        
        # Update task
        task.assigned_to = user
        task.status = 'IN_PROGRESS'
        task.save()
        
        # Log the action
        log_audit(request.user, 'UPDATE', 'PayrollWorkflowTask', task.pk, 
                 f'Assigned task to user: {user.username}')
        
        messages.success(request, f'Task assigned to {user.get_full_name()} successfully')
        return redirect('payroll:workflow_instance_detail', pk=task.workflow_instance.pk)
    
    # Get users with the required role
    role_users = UserPayrollRole.objects.filter(
        role=task.step.role,
        is_active=True
    ).select_related('user')
    
    context = {
        'task': task,
        'users': [user_role.user for user_role in role_users],
    }
    
    return render(request, 'payroll/workflow_task_assign.html', context)

@login_required
def complete_workflow_task(request, pk):
    task = get_object_or_404(PayrollWorkflowTask, pk=pk)
    
    if task.status != 'IN_PROGRESS':
        messages.error(request, f'Cannot complete task with status: {task.status}')
        return redirect('payroll:workflow_instance_detail', pk=task.workflow_instance.pk)
    
    if task.assigned_to != request.user and not request.user.is_superuser:
        messages.error(request, 'You are not authorized to complete this task')
        return redirect('payroll:workflow_instance_detail', pk=task.workflow_instance.pk)
    
    if request.method == 'POST':
        comments = request.POST.get('comments', '')
        
        # Update task
        task.status = 'COMPLETED'
        task.comments = comments
        task.completed_at = timezone.now()
        task.save()
        
        # Check if this was the last task for the current step
        instance = task.workflow_instance
        current_step = instance.current_step
        
        # Get all tasks for the current step
        step_tasks = PayrollWorkflowTask.objects.filter(
            workflow_instance=instance,
            step=current_step
        )
        
        # Check if all tasks for the current step are completed
        if not step_tasks.exclude(status='COMPLETED').exists():
            # Get the next step
            next_step = instance.workflow.steps.filter(order__gt=current_step.order).order_by('order').first()
            
            if next_step:
                # Move to the next step
                instance.current_step = next_step
                instance.save()
                
                # Create task for the next step
                PayrollWorkflowTask.objects.create(
                    workflow_instance=instance,
                    step=next_step,
                    status='PENDING',
                    due_date=timezone.now() + timezone.timedelta(days=next_step.timeout_days) if next_step.timeout_days > 0 else None
                )
            else:
                # This was the last step, complete the workflow
                instance.status = 'COMPLETED'
                instance.completed_at = timezone.now()
                instance.save()
        
        # Log the action
        log_audit(request.user, 'UPDATE', 'PayrollWorkflowTask', task.pk, 
                 f'Completed task: {task}')
        
        messages.success(request, f'Task completed successfully')
        return redirect('payroll:workflow_instance_detail', pk=task.workflow_instance.pk)
    
    return render(request, 'payroll/workflow_task_complete.html', {'task': task})

@login_required
def reject_workflow_task(request, pk):
    task = get_object_or_404(PayrollWorkflowTask, pk=pk)
    
    if task.status != 'IN_PROGRESS':
        messages.error(request, f'Cannot reject task with status: {task.status}')
        return redirect('payroll:workflow_instance_detail', pk=task.workflow_instance.pk)
    
    if task.assigned_to != request.user and not request.user.is_superuser:
        messages.error(request, 'You are not authorized to reject this task')
        return redirect('payroll:workflow_instance_detail', pk=task.workflow_instance.pk)
    
    if request.method == 'POST':
        comments = request.POST.get('comments', '')
        
        # Update task
        task.status = 'REJECTED'
        task.comments = comments
        task.completed_at = timezone.now()
        task.save()
        
        # Log the action
        log_audit(request.user, 'UPDATE', 'PayrollWorkflowTask', task.pk, 
                 f'Rejected task: {task}')
        
        messages.success(request, f'Task rejected successfully')
        return redirect('payroll:workflow_instance_detail', pk=task.workflow_instance.pk)
    
    return render(request, 'payroll/workflow_task_reject.html', {'task': task})

class WorkflowAnalysisView(LoginRequiredMixin, PayrollPermissionMixin, TemplateView):
    template_name = 'payroll/workflow_analysis.html'
    module = 'WORKFLOW'
    permission_type = 'VIEW'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        
        # Get filter parameters
        workflow_id = self.request.GET.get('workflow')
        days = int(self.request.GET.get('days', 30))
        
        # Get all workflows for the dropdown
        context['workflows'] = PayrollWorkflow.objects.all()
        context['selected_workflow'] = workflow_id
        context['days'] = days
        
        # Initialize the optimizer
        optimizer = WorkflowOptimizer()
        
        # Get analysis results
        analysis = optimizer.analyze_workflow_performance(
            workflow_id=workflow_id if workflow_id else None,
            days=days
        )
        
        # Add analysis results to context
        context.update(analysis)
        
        # Log the analysis
        log_audit(
            user=self.request.user,
            action='ANALYZE',
            module='WORKFLOW',
            description=f'Analyzed workflow performance for the last {days} days'
        )
        
        return context

class WorkflowStepListView(LoginRequiredMixin, PayrollPermissionMixin, ListView):
    model = PayrollWorkflowStep
    template_name = 'payroll/workflow_step_list.html'
    context_object_name = 'steps'
    module = 'WORKFLOW'
    permission_type = 'VIEW'

    def get_queryset(self):
        workflow_id = self.kwargs.get('workflow_pk')
        return PayrollWorkflowStep.objects.filter(workflow_id=workflow_id).order_by('order')

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        workflow_id = self.kwargs.get('workflow_pk')
        context['workflow'] = get_object_or_404(PayrollWorkflow, pk=workflow_id)
        return context

class WorkflowStepCreateView(LoginRequiredMixin, PayrollPermissionMixin, CreateView):
    model = PayrollWorkflowStep
    form_class = PayrollWorkflowStepForm
    template_name = 'payroll/workflow_step_form.html'
    module = 'WORKFLOW'
    permission_type = 'CREATE'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        workflow_id = self.kwargs.get('workflow_pk')
        context['workflow'] = get_object_or_404(PayrollWorkflow, pk=workflow_id)
        return context

    def form_valid(self, form):
        workflow_id = self.kwargs.get('workflow_pk')
        form.instance.workflow = get_object_or_404(PayrollWorkflow, pk=workflow_id)
        response = super().form_valid(form)
        log_audit(self.request.user, 'CREATE', 'Created workflow step: {}'.format(self.object.name))
        return response

    def get_success_url(self):
        return reverse_lazy('payroll:workflow_step_list', kwargs={'workflow_pk': self.kwargs.get('workflow_pk')})

class WorkflowStepUpdateView(LoginRequiredMixin, PayrollPermissionMixin, UpdateView):
    model = PayrollWorkflowStep
    form_class = PayrollWorkflowStepForm
    template_name = 'payroll/workflow_step_form.html'
    module = 'WORKFLOW'
    permission_type = 'UPDATE'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['workflow'] = self.object.workflow
        return context

    def form_valid(self, form):
        response = super().form_valid(form)
        log_audit(self.request.user, 'UPDATE', 'Updated workflow step: {}'.format(self.object.name))
        return response

    def get_success_url(self):
        return reverse_lazy('payroll:workflow_step_list', kwargs={'workflow_pk': self.object.workflow.pk})

class WorkflowStepDeleteView(LoginRequiredMixin, PayrollPermissionMixin, SoftDeleteMixin, DeleteView):
    model = PayrollWorkflowStep
    template_name = 'payroll/workflow_step_confirm_delete.html'
    module = 'WORKFLOW'
    permission_type = 'DELETE'

    def get_success_url(self):
        return reverse_lazy('payroll:workflow_step_list', kwargs={'workflow_pk': self.object.workflow.pk})

    def delete(self, request, *args, **kwargs):
        step = self.get_object()
        step_name = step.name
        response = super().delete(request, *args, **kwargs)
        log_audit(request.user, 'DELETE', 'Deleted workflow step: {}'.format(step_name))
        return response

# Workflow Instance Views
class WorkflowInstanceListView(LoginRequiredMixin, PayrollPermissionMixin, ListView):
    model = PayrollWorkflowInstance
    template_name = 'payroll/workflow_instance_list.html'
    context_object_name = 'instances'
    module = 'WORKFLOW'
    permission_type = 'VIEW'
    
    def get_queryset(self):
        queryset = PayrollWorkflowInstance.objects.all().select_related(
            'workflow', 'payroll_calculation', 'current_step'
        )
        
        # Filter by status if provided
        status = self.request.GET.get('status')
        if status:
            queryset = queryset.filter(status=status)
            
        # Filter by workflow if provided
        workflow_id = self.request.GET.get('workflow')
        if workflow_id:
            queryset = queryset.filter(workflow_id=workflow_id)
            
        return queryset.order_by('-started_at')
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['workflows'] = PayrollWorkflow.objects.filter(is_active=True)
        context['status_choices'] = PayrollWorkflowInstance.STATUS_CHOICES
        context['current_status'] = self.request.GET.get('status')
        context['current_workflow'] = self.request.GET.get('workflow')
        
        # Log the view action
        log_audit(self.request.user, 'VIEW', 'PayrollWorkflowInstance', 0, 'Viewed workflow instances list')
        
        return context

class WorkflowInstanceDetailView(LoginRequiredMixin, PayrollPermissionMixin, DetailView):
    model = PayrollWorkflowInstance
    template_name = 'payroll/workflow_instance_detail.html'
    context_object_name = 'instance'
    module = 'WORKFLOW'
    permission_type = 'VIEW'
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        instance = self.get_object()
        
        # Get all tasks for this instance
        context['tasks'] = PayrollWorkflowTask.objects.filter(
            workflow_instance=instance
        ).select_related('step', 'assigned_to').order_by('step__order')
        
        # Get task history
        context['task_history'] = PayrollWorkflowTask.objects.filter(
            workflow_instance=instance,
            status__in=['COMPLETED', 'REJECTED']
        ).select_related('step', 'assigned_to').order_by('-completed_at')
        
        # Log the view action
        log_audit(self.request.user, 'VIEW', 'PayrollWorkflowInstance', instance.pk, 
                 f'Viewed workflow instance details: {instance}')
        
        return context

@login_required
@permission_required('payroll.can_manage_workflow', raise_exception=True)
def workflow_instance_approve(request, pk):
    instance = get_object_or_404(PayrollWorkflowInstance, pk=pk)
    
    if instance.status != 'PENDING':
        messages.error(request, f'Cannot approve workflow instance with status: {instance.status}')
        return redirect('payroll:workflow_instance_detail', pk=instance.pk)
    
    # Update instance
    instance.status = 'APPROVED'
    instance.save()
    
    # Log the action
    log_audit(request.user, 'UPDATE', 'PayrollWorkflowInstance', instance.pk, 
             f'Approved workflow instance: {instance}')
    
    messages.success(request, f'Workflow instance approved successfully')
    return redirect('payroll:workflow_instance_detail', pk=instance.pk)

@login_required
@permission_required('payroll.can_manage_workflow', raise_exception=True)
def workflow_instance_reject(request, pk):
    instance = get_object_or_404(PayrollWorkflowInstance, pk=pk)
    
    if instance.status != 'PENDING':
        messages.error(request, f'Cannot reject workflow instance with status: {instance.status}')
        return redirect('payroll:workflow_instance_detail', pk=instance.pk)
    
    # Update instance
    instance.status = 'REJECTED'
    instance.save()
    
    # Log the action
    log_audit(request.user, 'UPDATE', 'PayrollWorkflowInstance', instance.pk, 
             f'Rejected workflow instance: {instance}')
    
    messages.success(request, f'Workflow instance rejected successfully')
    return redirect('payroll:workflow_instance_detail', pk=instance.pk)

class EmployeeAttendanceListView(LoginRequiredMixin, PayrollPermissionMixin, ListView):
    """View for listing employee attendance records"""
    model = EmployeeAttendance
    template_name = 'payroll/attendance_list.html'
    context_object_name = 'attendance_records'
    paginate_by = 20
    module = 'ATTENDANCE'
    permission_type = 'VIEW'
    
    def get_queryset(self):
        queryset = super().get_queryset()
        
        # Filter by employee
        employee_id = self.request.GET.get('employee')
        if employee_id:
            queryset = queryset.filter(employee_id=employee_id)
        
        # Filter by status
        status = self.request.GET.get('status')
        if status:
            queryset = queryset.filter(status=status)
        
        # Filter by date range
        start_date = self.request.GET.get('start_date')
        end_date = self.request.GET.get('end_date')
        if start_date and end_date:
            queryset = queryset.filter(date__range=[start_date, end_date])
        
        return queryset.select_related('employee').order_by('-date', 'employee')
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['employees'] = Employee.objects.all().order_by('ename')
        context['status_choices'] = EmployeeAttendance._meta.get_field('status').choices
        context['current_filters'] = {
            'employee': self.request.GET.get('employee'),
            'status': self.request.GET.get('status'),
            'start_date': self.request.GET.get('start_date'),
            'end_date': self.request.GET.get('end_date'),
        }
        
        # Add attendance rules to context
        context['rules'] = AttendanceRule.objects.filter(is_active=True)
        
        # Log the view action
        log_audit(
            user=self.request.user,
            action='VIEW',
            model_name='EmployeeAttendance',
            object_id=0,
            details='Viewed attendance records'
        )
        
        return context

class EmployeeAttendanceCreateView(LoginRequiredMixin, PayrollPermissionMixin, CreateView):
    """View for creating employee attendance records"""
    model = EmployeeAttendance
    form_class = EmployeeAttendanceForm
    template_name = 'payroll/attendance_form.html'
    success_url = reverse_lazy('payroll:attendance_list')
    module = 'ATTENDANCE'
    permission_type = 'CREATE'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['employees'] = Employee.objects.filter(status=1)  # 1 represents active status
        return context
    
    def form_valid(self, form):
        response = super().form_valid(form)
        log_audit(
            user=self.request.user,
            action='CREATE',
            model_name='EmployeeAttendance',
            object_id=self.object.id,
            details=f'Created attendance record for {self.object.employee} on {self.object.date}'
        )
        return response

class EmployeeAttendanceUpdateView(LoginRequiredMixin, PayrollPermissionMixin, UpdateView):
    """View for updating employee attendance records"""
    model = EmployeeAttendance
    form_class = EmployeeAttendanceForm
    template_name = 'payroll/attendance_form.html'
    success_url = reverse_lazy('payroll:attendance_list')
    module = 'ATTENDANCE'
    permission_type = 'UPDATE'
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['employees'] = Employee.objects.filter(status=1)  # 1 represents active status
        return context
    
    def form_valid(self, form):
        response = super().form_valid(form)
        log_audit(self.request.user, 'UPDATE', f'Updated attendance record for {self.object.employee} on {self.object.date}')
        return response

class EmployeeAttendanceDeleteView(LoginRequiredMixin, PayrollPermissionMixin, SoftDeleteMixin, DeleteView):
    """View for deleting employee attendance records"""
    model = EmployeeAttendance
    success_url = reverse_lazy('payroll:attendance_list')
    module = 'ATTENDANCE'
    permission_type = 'DELETE'
    
    def delete(self, request, *args, **kwargs):
        attendance = self.get_object()
        employee_name = str(attendance.employee)
        date = attendance.date
        response = super().delete(request, *args, **kwargs)
        log_audit(request.user, 'DELETE', f'Deleted attendance record for {employee_name} on {date}')
        return response

class AttendanceBulkCreateView(LoginRequiredMixin, PayrollPermissionMixin, FormView):
    """View for bulk creating attendance records"""
    form_class = AttendanceBulkForm
    template_name = 'payroll/attendance_bulk_form.html'
    success_url = reverse_lazy('payroll:attendance_list')
    module = 'ATTENDANCE'
    permission_type = 'CREATE'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['employees'] = Employee.objects.filter(status=1)  # 1 represents active status
        return context
    
    def form_valid(self, form):
        date = form.cleaned_data['date']
        employees = form.cleaned_data['employees']
        status = form.cleaned_data['status']
        notes = form.cleaned_data['notes']
        
        records_created = 0
        for employee in employees:
            # Check if record already exists
            if not EmployeeAttendance.objects.filter(employee=employee, date=date).exists():
                EmployeeAttendance.objects.create(
                    employee=employee,
                    date=date,
                    status=status,
                    notes=notes
                )
                records_created += 1
        
        messages.success(self.request, f'Created {records_created} attendance records.')
        log_audit(self.request.user, 'CREATE', f'Bulk created {records_created} attendance records for {date}')
        return super().form_valid(form)

class AttendanceRuleListView(LoginRequiredMixin, PayrollPermissionMixin, ListView):
    """View for listing attendance rules"""
    model = AttendanceRule
    template_name = 'payroll/attendance_rule_list.html'
    context_object_name = 'rules'
    module = 'ATTENDANCE'
    permission_type = 'VIEW'
    
    def get_queryset(self):
        return super().get_queryset().filter(is_active=True)
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        log_audit(
            user=self.request.user, 
            action='VIEW', 
            model_name='AttendanceRule',
            object_id=0,
            details='Viewed attendance rules'
        )
        return context

class AttendanceRuleCreateView(LoginRequiredMixin, PayrollPermissionMixin, CreateView):
    """View for creating attendance rules"""
    model = AttendanceRule
    form_class = AttendanceRuleForm
    template_name = 'payroll/attendance_rule_form.html'
    success_url = reverse_lazy('payroll:attendance_rule_list')
    module = 'ATTENDANCE'
    permission_type = 'CREATE'
    
    def form_valid(self, form):
        response = super().form_valid(form)
        log_audit(
            user=self.request.user, 
            action='CREATE', 
            model_name='AttendanceRule',
            object_id=self.object.id,
            details=f'Created attendance rule: {self.object.name}'
        )
        messages.success(self.request, f'Attendance rule "{self.object.name}" created successfully.')
        return response

class AttendanceRuleUpdateView(LoginRequiredMixin, PayrollPermissionMixin, UpdateView):
    """View for updating attendance rules"""
    model = AttendanceRule
    form_class = AttendanceRuleForm
    template_name = 'payroll/attendance_rule_form.html'
    success_url = reverse_lazy('payroll:attendance_rule_list')
    module = 'ATTENDANCE'
    permission_type = 'UPDATE'
    
    def form_valid(self, form):
        response = super().form_valid(form)
        log_audit(
            user=self.request.user, 
            action='UPDATE', 
            model_name='AttendanceRule',
            object_id=self.object.id,
            details=f'Updated attendance rule: {self.object.name}'
        )
        messages.success(self.request, f'Attendance rule "{self.object.name}" updated successfully.')
        return response

class AttendanceRuleDeleteView(LoginRequiredMixin, PayrollPermissionMixin, SoftDeleteMixin, DeleteView):
    """View for deleting attendance rules"""
    model = AttendanceRule
    success_url = reverse_lazy('payroll:attendance_rule_list')
    module = 'ATTENDANCE'
    permission_type = 'DELETE'
    
    def delete(self, request, *args, **kwargs):
        rule = self.get_object()
        rule_name = rule.name
        rule_id = rule.id
        response = super().delete(request, *args, **kwargs)
        log_audit(
            user=request.user, 
            action='DELETE', 
            model_name='AttendanceRule',
            object_id=rule_id,
            details=f'Deleted attendance rule: {rule_name}'
        )
        return response

class AttendanceRuleDetailView(LoginRequiredMixin, PayrollPermissionMixin, DetailView):
    """View for viewing attendance rule details"""
    model = AttendanceRule
    template_name = 'payroll/attendance_rule_detail.html'
    module = 'ATTENDANCE'
    permission_type = 'VIEW'
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        log_audit(
            user=self.request.user,
            action='VIEW',
            model_name='AttendanceRule',
            object_id=self.object.id,
            details=f'Viewed attendance rule: {self.object.name}'
        )
        return context

class AttendanceImportView(LoginRequiredMixin, PayrollPermissionMixin, FormView):
    """View for importing attendance records from files or devices"""
    template_name = 'payroll/attendance_import.html'
    form_class = AttendanceImportForm
    success_url = reverse_lazy('payroll:attendance_list')
    module = 'ATTENDANCE'
    permission_type = 'CREATE'

    def form_valid(self, form):
        import_type = form.cleaned_data['import_type']
        
        if import_type == 'file':
            file = form.cleaned_data['file']
            try:
                # Process the uploaded file
                if file.name.endswith('.csv'):
                    self._process_csv_file(file)
                else:
                    self._process_excel_file(file)
                    
                messages.success(self.request, 'Attendance records imported successfully.')
                log_audit(self.request.user, 'CREATE', 'ATTENDANCE', None, 
                         f'Imported attendance records from {file.name}')
            except Exception as e:
                messages.error(self.request, f'Error importing attendance records: {str(e)}')
                return self.form_invalid(form)
        else:
            # Handle device sync
            try:
                self._sync_from_devices()
                messages.success(self.request, 'Attendance records synced from devices successfully.')
                log_audit(self.request.user, 'CREATE', 'ATTENDANCE', None, 
                         'Synced attendance records from devices')
            except Exception as e:
                messages.error(self.request, f'Error syncing from devices: {str(e)}')
                return self.form_invalid(form)
                
        return super().form_valid(form)

    def _process_csv_file(self, file):
        import csv
        from io import TextIOWrapper
        
        csv_file = TextIOWrapper(file, encoding='utf-8')
        reader = csv.DictReader(csv_file)
        
        for row in reader:
            self._create_attendance_record(row)

    def _process_excel_file(self, file):
        import pandas as pd
        
        df = pd.read_excel(file)
        for _, row in df.iterrows():
            self._create_attendance_record(row.to_dict())

    def _create_attendance_record(self, data):
        from datetime import datetime
        
        try:
            employee = Employee.objects.get(employee_id=data['employee_id'])
            date = datetime.strptime(data['date'], '%Y-%m-%d').date()
            time_in = datetime.strptime(data['time_in'], '%H:%M:%S').time()
            
            time_out = None
            if 'time_out' in data and data['time_out']:
                time_out = datetime.strptime(data['time_out'], '%H:%M:%S').time()
            
            EmployeeAttendance.objects.create(
                employee=employee,
                date=date,
                time_in=time_in,
                time_out=time_out
            )
        except Employee.DoesNotExist:
            raise ValueError(f"Employee with ID {data['employee_id']} not found")
        except (KeyError, ValueError) as e:
            raise ValueError(f"Invalid data format: {str(e)}")

    def _sync_from_devices(self):
        from .zkteco import ZKTecoDevice
        from django.conf import settings
        
        # Get device settings from Django settings
        device_ip = getattr(settings, 'ZKTECO_DEVICE_IP', None)
        device_port = getattr(settings, 'ZKTECO_DEVICE_PORT', 4370)
        
        if not device_ip:
            raise ValueError("ZKTeco device IP not configured in settings")
        
        # Connect to device and sync attendance
        device = ZKTecoDevice(ip=device_ip, port=device_port)
        device.sync_attendance()

class AttendanceExportView(LoginRequiredMixin, PayrollPermissionMixin, View):
    """View for exporting attendance records"""
    module = 'ATTENDANCE'
    permission_type = 'VIEW'
    
    def get(self, request, *args, **kwargs):
        import csv
        from datetime import datetime
        from django.http import HttpResponse
        
        # Get filter parameters
        employee_id = request.GET.get('employee')
        start_date = request.GET.get('start_date')
        end_date = request.GET.get('end_date')
        
        # Get attendance records
        attendance_records = EmployeeAttendance.objects.all()
        
        if employee_id:
            attendance_records = attendance_records.filter(employee_id=employee_id)
        if start_date and end_date:
            attendance_records = attendance_records.filter(date__range=[start_date, end_date])
        
        attendance_records = attendance_records.select_related('employee').order_by('-date', 'employee')
        
        # Create CSV response
        response = HttpResponse(content_type='text/csv')
        response['Content-Disposition'] = f'attachment; filename="attendance_export_{datetime.now().strftime("%Y%m%d")}.csv"'
        
        writer = csv.writer(response)
        writer.writerow(['Employee ID', 'Employee Name', 'Date', 'Time In', 'Time Out', 'Status', 'Notes'])
        
        for record in attendance_records:
            writer.writerow([
                record.employee.employee_id,
                record.employee.ename,
                record.date,
                record.time_in.strftime('%H:%M:%S') if record.time_in else '',
                record.time_out.strftime('%H:%M:%S') if record.time_out else '',
                record.status,
                record.notes or ''
            ])
        
        # Log the export
        log_audit(
            user=request.user,
            action='EXPORT',
            model_name='EmployeeAttendance',
            object_id=0,
            details='Exported attendance records'
        )
        
        return response

class AttendanceReportView(LoginRequiredMixin, PayrollPermissionMixin, TemplateView):
    """View for generating attendance reports"""
    template_name = 'payroll/attendance_report.html'
    module = 'ATTENDANCE'
    permission_type = 'VIEW'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        
        # Get filter parameters
        employee_id = self.request.GET.get('employee')
        start_date = self.request.GET.get('start_date')
        end_date = self.request.GET.get('end_date')
        
        # Get all employees for the dropdown
        context['employees'] = Employee.objects.all().order_by('ename')
        context['selected_employee'] = employee_id
        context['start_date'] = start_date
        context['end_date'] = end_date
        
        # Get attendance records based on filters
        attendance_records = EmployeeAttendance.objects.all()
        
        if employee_id:
            attendance_records = attendance_records.filter(employee_id=employee_id)
        if start_date and end_date:
            attendance_records = attendance_records.filter(date__range=[start_date, end_date])
        
        # Calculate summary statistics
        total_days = attendance_records.count()
        present_days = attendance_records.filter(status='PRESENT').count()
        late_days = attendance_records.filter(status='LATE').count()
        absent_days = attendance_records.filter(status='ABSENT').count()
        
        context.update({
            'total_days': total_days,
            'present_days': present_days,
            'late_days': late_days,
            'absent_days': absent_days,
            'attendance_percentage': (present_days / total_days * 100) if total_days > 0 else 0
        })
        
        # Get detailed attendance records
        context['attendance_records'] = attendance_records.select_related('employee').order_by('-date', 'employee')
        
        # Log the report generation
        log_audit(
            user=self.request.user,
            action='VIEW',
            model_name='EmployeeAttendance',
            object_id=0,
            details='Generated attendance report'
        )
        
        return context
