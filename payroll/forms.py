from django import forms
from .models import (
    PayrollPeriod, SalaryComponent, EmployeeSalaryStructure,
    SalaryComponentValue, PayrollCalculation, PayrollComponentDetail,
    TaxCalculation, PayrollPayment, PayrollDocument, PayrollRole, UserPayrollRole,
    PayrollWorkflow, PayrollWorkflowStep, PayrollWorkflowTask, EmployeeAttendance,
    AttendanceRule, Employee
)
from django.utils import timezone
from django.core.validators import FileExtensionValidator

class PayrollPeriodForm(forms.ModelForm):
    class Meta:
        model = PayrollPeriod
        fields = ['name', 'start_date', 'end_date', 'period_type', 'is_active']
        widgets = {
            'start_date': forms.DateInput(attrs={'type': 'date'}),
            'end_date': forms.DateInput(attrs={'type': 'date'}),
        }

class SalaryComponentForm(forms.ModelForm):
    class Meta:
        model = SalaryComponent
        fields = ['name', 'code', 'component_type', 'is_taxable', 'is_mandatory', 'description', 'is_active']
        widgets = {
            'description': forms.Textarea(attrs={'rows': 3}),
        }

class EmployeeSalaryStructureForm(forms.ModelForm):
    class Meta:
        model = EmployeeSalaryStructure
        fields = ['employee', 'basic_salary', 'effective_from', 'effective_to', 'is_active']
        widgets = {
            'effective_from': forms.DateInput(attrs={'type': 'date'}),
            'effective_to': forms.DateInput(attrs={'type': 'date'}),
        }

class SalaryComponentValueForm(forms.ModelForm):
    class Meta:
        model = SalaryComponentValue
        fields = ['salary_structure', 'component', 'amount', 'is_percentage']
        widgets = {
            'amount': forms.NumberInput(attrs={'step': '0.01'}),
        }

class PayrollCalculationForm(forms.ModelForm):
    class Meta:
        model = PayrollCalculation
        fields = ['employee', 'period', 'gross_salary', 'total_deductions', 'net_salary', 'status']
        widgets = {
            'gross_salary': forms.NumberInput(attrs={'step': '0.01'}),
            'total_deductions': forms.NumberInput(attrs={'step': '0.01'}),
            'net_salary': forms.NumberInput(attrs={'step': '0.01'}),
        }

class PayrollComponentDetailForm(forms.ModelForm):
    class Meta:
        model = PayrollComponentDetail
        fields = ['payroll_calculation', 'component', 'amount']
        widgets = {
            'amount': forms.NumberInput(attrs={'step': '0.01'}),
        }

class TaxCalculationModelForm(forms.ModelForm):
    class Meta:
        model = TaxCalculation
        fields = ['payroll_calculation', 'tax_year', 'taxable_amount', 'tax_amount']
        widgets = {
            'taxable_amount': forms.NumberInput(attrs={'step': '0.01'}),
            'tax_amount': forms.NumberInput(attrs={'step': '0.01'}),
        }

class PayrollPaymentForm(forms.ModelForm):
    class Meta:
        model = PayrollPayment
        fields = ['payroll_calculation', 'payment_date', 'payment_method', 'reference_number', 'amount', 'status']
        widgets = {
            'payment_date': forms.DateInput(attrs={'type': 'date'}),
            'amount': forms.NumberInput(attrs={'step': '0.01'}),
        }

class PayrollDocumentForm(forms.ModelForm):
    class Meta:
        model = PayrollDocument
        fields = ['payroll_calculation', 'document_type', 'file', 'description']
        widgets = {
            'description': forms.Textarea(attrs={'rows': 3}),
        }

# Form for bulk operations
class BulkPayrollCalculationForm(forms.Form):
    period = forms.ModelChoiceField(queryset=PayrollPeriod.objects.filter(is_active=True))
    employees = forms.ModelMultipleChoiceField(
        queryset=EmployeeSalaryStructure.objects.filter(is_active=True).select_related('employee')
    )

# Form for tax calculation
class TaxCalculationForm(forms.Form):
    tax_year = forms.IntegerField()
    taxable_amount = forms.DecimalField(max_digits=12, decimal_places=2)
    tax_rate = forms.DecimalField(max_digits=5, decimal_places=2, initial=20.00)  # Default 20%

# Form for salary component calculation
class SalaryComponentCalculationForm(forms.Form):
    basic_salary = forms.DecimalField(max_digits=12, decimal_places=2)
    components = forms.ModelMultipleChoiceField(
        queryset=SalaryComponent.objects.all(),
        widget=forms.CheckboxSelectMultiple
    )

class PayrollRoleForm(forms.ModelForm):
    class Meta:
        model = PayrollRole
        fields = ['name', 'description', 'permissions']
        widgets = {
            'description': forms.Textarea(attrs={'rows': 3}),
            'permissions': forms.CheckboxSelectMultiple(),
        }

class UserPayrollRoleForm(forms.ModelForm):
    class Meta:
        model = UserPayrollRole
        fields = ['user', 'role', 'is_active', 'expires_at']
        widgets = {
            'user': forms.Select(attrs={'class': 'form-select select2'}),
            'role': forms.Select(attrs={'class': 'form-select select2'}),
            'expires_at': forms.DateInput(attrs={'class': 'form-control datepicker'}),
        }
    
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        if self.instance and self.instance.pk:
            self.fields['user'].widget.attrs['disabled'] = True
            self.fields['role'].widget.attrs['disabled'] = True

class PayrollWorkflowForm(forms.ModelForm):
    class Meta:
        model = PayrollWorkflow
        fields = ['name', 'description', 'is_active']
        widgets = {
            'description': forms.Textarea(attrs={'rows': 3}),
        }

class PayrollWorkflowStepForm(forms.ModelForm):
    class Meta:
        model = PayrollWorkflowStep
        fields = ['name', 'description', 'order', 'role', 'is_required', 'timeout_days', 'actions']
        widgets = {
            'description': forms.Textarea(attrs={'rows': 3}),
            'timeout_days': forms.NumberInput(attrs={'min': 0, 'max': 365}),
            'actions': forms.SelectMultiple(attrs={'class': 'select2'}),
        }
    
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        # Add help text for fields
        self.fields['name'].help_text = 'A descriptive name for this workflow step'
        self.fields['description'].help_text = 'Detailed description of what this step involves'
        self.fields['order'].help_text = 'The sequence order of this step in the workflow'
        self.fields['role'].help_text = 'The role required to complete this step'
        self.fields['is_required'].help_text = 'Whether this step is mandatory for workflow completion'
        self.fields['timeout_days'].help_text = 'Number of days before this step times out (0 for no timeout)'
        self.fields['actions'].help_text = 'Actions required to complete this step'

class PayrollWorkflowTaskForm(forms.ModelForm):
    class Meta:
        model = PayrollWorkflowTask
        fields = ['assigned_to', 'status', 'comments', 'due_date']
        widgets = {
            'comments': forms.Textarea(attrs={'rows': 3}),
            'due_date': forms.DateTimeInput(attrs={'type': 'datetime-local'}),
        }

class EmployeeAttendanceForm(forms.ModelForm):
    """Form for managing employee attendance records"""
    class Meta:
        model = EmployeeAttendance
        fields = ['employee', 'date', 'clock_in', 'clock_out', 'status', 'notes']
        widgets = {
            'date': forms.DateInput(attrs={'type': 'date'}),
            'clock_in': forms.TimeInput(attrs={'type': 'time'}),
            'clock_out': forms.TimeInput(attrs={'type': 'time'}),
            'notes': forms.Textarea(attrs={'rows': 3}),
        }
    
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        for field in self.fields:
            self.fields[field].widget.attrs.update({'class': 'form-control'})
        
        # Set default date to today if not provided
        if not self.instance.pk and not self.data.get('date'):
            self.fields['date'].initial = timezone.now().date()


class AttendanceRuleForm(forms.ModelForm):
    """Form for managing attendance rules"""
    class Meta:
        model = AttendanceRule
        fields = [
            'name', 'description', 'late_deduction_type', 'late_deduction_amount',
            'late_threshold_minutes', 'absent_deduction_type', 'absent_deduction_amount',
            'overtime_rate_multiplier', 'is_active'
        ]
        widgets = {
            'description': forms.Textarea(attrs={'rows': 3}),
        }
    
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        for field in self.fields:
            self.fields[field].widget.attrs.update({'class': 'form-control'})


class AttendanceBulkForm(forms.Form):
    """Form for bulk attendance operations"""
    date = forms.DateField(
        widget=forms.DateInput(attrs={'type': 'date', 'class': 'form-control'})
    )
    employees = forms.ModelMultipleChoiceField(
        queryset=EmployeeSalaryStructure.objects.filter(is_active=True).select_related('employee')
    )
    status = forms.ChoiceField(
        choices=EmployeeAttendance._meta.get_field('status').choices,
        widget=forms.Select(attrs={'class': 'form-control'})
    )
    notes = forms.CharField(
        required=False,
        widget=forms.Textarea(attrs={'rows': 3, 'class': 'form-control'})
    )

class AttendanceImportForm(forms.Form):
    """Form for importing attendance records"""
    import_type = forms.ChoiceField(
        choices=[
            ('file', 'Import from File'),
            ('device', 'Sync from Device')
        ],
        widget=forms.RadioSelect,
        initial='file'
    )
    file = forms.FileField(
        required=False,
        help_text='Upload CSV or Excel file with attendance records'
    )
    
    def clean(self):
        cleaned_data = super().clean()
        import_type = cleaned_data.get('import_type')
        file = cleaned_data.get('file')
        
        if import_type == 'file' and not file:
            raise forms.ValidationError('Please upload a file for import')
        
        return cleaned_data 