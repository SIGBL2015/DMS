from django.db import models
from django.contrib.auth.models import User
from employee.models import Employee
from django.core.validators import MinValueValidator
from decimal import Decimal
from django.utils import timezone
from django.conf import settings
import uuid
from datetime import datetime

# Add SoftDeletion classes
class SoftDeletionQuerySet(models.QuerySet):
    def delete(self):
        # Override bulk delete to soft-delete by setting is_active=False
        return super().update(is_active=False)

class SoftDeletionManager(models.Manager):
    def get_queryset(self):
        # Default queryset only returns active records
        return SoftDeletionQuerySet(self.model, using=self._db).filter(is_active=True)

class SoftDeletionModel(models.Model):
    """Abstract model providing soft-delete behavior."""
    is_active = models.BooleanField(default=True)
    # managers
    objects = SoftDeletionManager()   # Only active records
    all_objects = models.Manager()     # All records including inactive

    def delete(self, using=None, keep_parents=False):
        # Soft delete by marking inactive
        self.is_active = False
        self.save()

    class Meta:
        abstract = True

# Add PayrollPermission model for RBAC
class PayrollPermission(models.Model):
    MODULE_CHOICES = [
        ('DASHBOARD', 'Dashboard'),
        ('PERIOD', 'Payroll Period'),
        ('COMPONENT', 'Salary Component'),
        ('STRUCTURE', 'Salary Structure'),
        ('CALCULATION', 'Payroll Calculation'),
        ('PAYMENT', 'Payment'),
        ('DOCUMENT', 'Document'),
        ('REPORT', 'Report'),
        ('AUDIT', 'Audit'),
        ('SETTING', 'Setting'),
    ]

    PERMISSION_TYPES = [
        ('VIEW', 'View'),
        ('CREATE', 'Create'),
        ('UPDATE', 'Update'),
        ('DELETE', 'Delete'),
        ('APPROVE', 'Approve'),
        ('EXPORT', 'Export'),
    ]

    module = models.CharField(max_length=50, choices=MODULE_CHOICES)
    permission_type = models.CharField(max_length=20, choices=PERMISSION_TYPES)
    description = models.TextField(blank=True)
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        unique_together = ('module', 'permission_type')

    def __str__(self):
        return f"{self.get_module_display()} - {self.get_permission_type_display()}"

# Add AuditLog model for tracking changes
class AuditLog(models.Model):
    ACTION_TYPES = [
        ('CREATE', 'Create'),
        ('UPDATE', 'Update'),
        ('DELETE', 'Delete'),
        ('VIEW', 'View'),
        ('EXPORT', 'Export'),
        ('APPROVE', 'Approve'),
        ('REJECT', 'Reject'),
        ('LOGIN', 'Login'),
        ('LOGOUT', 'Logout'),
        ('FAILED_LOGIN', 'Failed Login'),
    ]

    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    user = models.ForeignKey(User, on_delete=models.SET_NULL, null=True)
    action = models.CharField(max_length=20, choices=ACTION_TYPES)
    model_name = models.CharField(max_length=100)
    object_id = models.CharField(max_length=100)
    details = models.TextField(blank=True)
    ip_address = models.GenericIPAddressField(null=True)
    user_agent = models.TextField(blank=True)
    created_at = models.DateTimeField(auto_now_add=True)
    metadata = models.JSONField(default=dict, blank=True)

    class Meta:
        indexes = [
            models.Index(fields=['user', 'action', 'created_at']),
            models.Index(fields=['model_name', 'object_id']),
        ]

    def __str__(self):
        return f"{self.user} - {self.action} - {self.model_name} - {self.created_at}"

class PayrollPeriod(SoftDeletionModel):
    PERIOD_CHOICES = [
        ('MONTHLY', 'Monthly'),
        ('BIWEEKLY', 'Bi-Weekly'),
        ('WEEKLY', 'Weekly'),
    ]
    
    name = models.CharField(max_length=100)
    start_date = models.DateField()
    end_date = models.DateField()
    period_type = models.CharField(max_length=20, choices=PERIOD_CHOICES)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"{self.name} ({self.start_date} to {self.end_date})"

class SalaryComponent(SoftDeletionModel):
    COMPONENT_TYPE_CHOICES = [
        ('EARNING', 'Earning'),
        ('DEDUCTION', 'Deduction'),
    ]
    
    name = models.CharField(max_length=100)
    code = models.CharField(max_length=50, unique=True)
    component_type = models.CharField(max_length=20, choices=COMPONENT_TYPE_CHOICES)
    is_taxable = models.BooleanField(default=True)
    is_mandatory = models.BooleanField(default=False)
    description = models.TextField(blank=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"{self.name} ({self.component_type})"

class EmployeeSalaryStructure(SoftDeletionModel):
    employee = models.ForeignKey(Employee, on_delete=models.CASCADE, related_name='salary_structure')
    basic_salary = models.DecimalField(max_digits=12, decimal_places=2, validators=[MinValueValidator(Decimal('0.00'))])
    effective_from = models.DateField()
    effective_to = models.DateField(null=True, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"Salary Structure - {self.employee}"

class SalaryComponentValue(models.Model):
    salary_structure = models.ForeignKey(EmployeeSalaryStructure, on_delete=models.CASCADE, related_name='component_values')
    component = models.ForeignKey(SalaryComponent, on_delete=models.CASCADE)
    amount = models.DecimalField(max_digits=12, decimal_places=2, validators=[MinValueValidator(Decimal('0.00'))])
    is_percentage = models.BooleanField(default=False)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"{self.component.name} - {self.amount}"

class PayrollCalculation(SoftDeletionModel):
    STATUS_CHOICES = [
        ('DRAFT', 'Draft'),
        ('PROCESSING', 'Processing'),
        ('COMPLETED', 'Completed'),
        ('PAID', 'Paid'),
        ('CANCELLED', 'Cancelled'),
    ]
    
    employee = models.ForeignKey(Employee, on_delete=models.CASCADE, related_name='payroll_calculations')
    period = models.ForeignKey(PayrollPeriod, on_delete=models.CASCADE)
    gross_salary = models.DecimalField(max_digits=12, decimal_places=2, validators=[MinValueValidator(Decimal('0.00'))])
    total_deductions = models.DecimalField(max_digits=12, decimal_places=2, validators=[MinValueValidator(Decimal('0.00'))])
    net_salary = models.DecimalField(max_digits=12, decimal_places=2, validators=[MinValueValidator(Decimal('0.00'))])
    status = models.CharField(max_length=20, choices=STATUS_CHOICES, default='DRAFT')
    payment_date = models.DateField(null=True, blank=True)
    created_by = models.ForeignKey(User, on_delete=models.SET_NULL, null=True, related_name='created_payrolls')
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"Payroll - {self.employee} - {self.period}"

class PayrollComponentDetail(models.Model):
    payroll_calculation = models.ForeignKey(PayrollCalculation, on_delete=models.CASCADE, related_name='component_details')
    component = models.ForeignKey(SalaryComponent, on_delete=models.CASCADE)
    amount = models.DecimalField(max_digits=12, decimal_places=2, validators=[MinValueValidator(Decimal('0.00'))])
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"{self.component.name} - {self.amount}"

class TaxCalculation(models.Model):
    payroll_calculation = models.ForeignKey(PayrollCalculation, on_delete=models.CASCADE, related_name='tax_calculations')
    tax_year = models.IntegerField()
    taxable_amount = models.DecimalField(max_digits=12, decimal_places=2, validators=[MinValueValidator(Decimal('0.00'))])
    tax_amount = models.DecimalField(max_digits=12, decimal_places=2, validators=[MinValueValidator(Decimal('0.00'))])
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"Tax Calculation - {self.payroll_calculation} - {self.tax_year}"

class PayrollPayment(SoftDeletionModel):
    PAYMENT_METHOD_CHOICES = [
        ('BANK_TRANSFER', 'Bank Transfer'),
        ('CHEQUE', 'Cheque'),
        ('CASH', 'Cash'),
    ]
    
    payroll_calculation = models.ForeignKey(PayrollCalculation, on_delete=models.CASCADE, related_name='payments')
    payment_date = models.DateField()
    payment_method = models.CharField(max_length=20, choices=PAYMENT_METHOD_CHOICES)
    reference_number = models.CharField(max_length=100, blank=True)
    amount = models.DecimalField(max_digits=12, decimal_places=2, validators=[MinValueValidator(Decimal('0.00'))])
    status = models.CharField(max_length=20, choices=[('PENDING', 'Pending'), ('COMPLETED', 'Completed'), ('FAILED', 'Failed')])
    created_by = models.ForeignKey(User, on_delete=models.SET_NULL, null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"Payment - {self.payroll_calculation} - {self.payment_date}"

class PayrollDocument(SoftDeletionModel):
    DOCUMENT_TYPE_CHOICES = [
        ('PAYSLIP', 'Payslip'),
        ('TAX_FORM', 'Tax Form'),
        ('BANK_STATEMENT', 'Bank Statement'),
        ('OTHER', 'Other'),
    ]
    
    payroll_calculation = models.ForeignKey(PayrollCalculation, on_delete=models.CASCADE, related_name='documents')
    document_type = models.CharField(max_length=20, choices=DOCUMENT_TYPE_CHOICES)
    file = models.FileField(upload_to='payroll_documents/')
    description = models.TextField(blank=True)
    uploaded_by = models.ForeignKey(User, on_delete=models.SET_NULL, null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"{self.document_type} - {self.payroll_calculation}"

class PayrollRole(models.Model):
    name = models.CharField(max_length=100)
    description = models.TextField(blank=True)
    permissions = models.ManyToManyField('PayrollPermission')
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.name

class UserPayrollRole(SoftDeletionModel):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    role = models.ForeignKey(PayrollRole, on_delete=models.CASCADE)
    assigned_by = models.ForeignKey(User, on_delete=models.SET_NULL, null=True, related_name='role_assignments')
    assigned_at = models.DateTimeField(auto_now_add=True)
    expires_at = models.DateTimeField(null=True, blank=True)

    class Meta:
        unique_together = ('user', 'role')

    def __str__(self):
        return f"{self.user.username} - {self.role.name}"

class SecuritySettings(models.Model):
    MFA_METHODS = [
        ('EMAIL', 'Email'),
        ('SMS', 'SMS'),
        ('AUTHENTICATOR', 'Authenticator App'),
    ]

    require_mfa = models.BooleanField(default=False)
    mfa_method = models.CharField(max_length=20, choices=MFA_METHODS, default='EMAIL')
    password_expiry_days = models.IntegerField(default=90)
    max_login_attempts = models.IntegerField(default=5)
    session_timeout_minutes = models.IntegerField(default=30)
    ip_whitelist = models.TextField(blank=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return "Security Settings"

class PayrollWorkflow(SoftDeletionModel):
    name = models.CharField(max_length=100)
    description = models.TextField(blank=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.name

class PayrollWorkflowStep(SoftDeletionModel):
    workflow = models.ForeignKey(PayrollWorkflow, on_delete=models.CASCADE, related_name='steps')
    name = models.CharField(max_length=100)
    description = models.TextField(blank=True)
    order = models.PositiveIntegerField()
    role = models.ForeignKey(PayrollRole, on_delete=models.CASCADE)
    is_required = models.BooleanField(default=True)
    timeout_days = models.PositiveIntegerField(default=0, help_text='Number of days before this step times out (0 for no timeout)')
    actions = models.ManyToManyField(PayrollPermission, blank=True, help_text='Actions required to complete this step')
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        ordering = ['order']
        unique_together = ('workflow', 'order')

    def __str__(self):
        return f"{self.workflow.name} - Step {self.order}: {self.name}"

class PayrollWorkflowInstance(models.Model):
    STATUS_CHOICES = [
        ('PENDING', 'Pending'),
        ('IN_PROGRESS', 'In Progress'),
        ('COMPLETED', 'Completed'),
        ('CANCELLED', 'Cancelled'),
    ]

    workflow = models.ForeignKey(PayrollWorkflow, on_delete=models.CASCADE)
    payroll_calculation = models.ForeignKey(PayrollCalculation, on_delete=models.CASCADE, related_name='workflow_instances')
    current_step = models.ForeignKey(PayrollWorkflowStep, on_delete=models.SET_NULL, null=True, related_name='current_instances')
    status = models.CharField(max_length=20, choices=STATUS_CHOICES, default='PENDING')
    started_at = models.DateTimeField(auto_now_add=True)
    completed_at = models.DateTimeField(null=True, blank=True)
    created_by = models.ForeignKey(User, on_delete=models.SET_NULL, null=True, related_name='started_workflows')
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"Workflow for {self.payroll_calculation}"

class PayrollWorkflowTask(models.Model):
    STATUS_CHOICES = [
        ('PENDING', 'Pending'),
        ('IN_PROGRESS', 'In Progress'),
        ('COMPLETED', 'Completed'),
        ('REJECTED', 'Rejected'),
        ('CANCELLED', 'Cancelled'),
    ]

    workflow_instance = models.ForeignKey(PayrollWorkflowInstance, on_delete=models.CASCADE, related_name='tasks')
    step = models.ForeignKey(PayrollWorkflowStep, on_delete=models.CASCADE)
    assigned_to = models.ForeignKey(User, on_delete=models.SET_NULL, null=True, related_name='payroll_tasks')
    status = models.CharField(max_length=20, choices=STATUS_CHOICES, default='PENDING')
    comments = models.TextField(blank=True)
    due_date = models.DateTimeField(null=True, blank=True)
    completed_at = models.DateTimeField(null=True, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        ordering = ['-created_at']

    def __str__(self):
        return f"Task for {self.workflow_instance} - {self.step.name}"

class EmployeeAttendance(SoftDeletionModel):
    """Model for tracking employee attendance"""
    employee = models.ForeignKey('employee.Employee', on_delete=models.CASCADE, related_name='attendance_records')
    date = models.DateField()
    clock_in = models.TimeField(null=True, blank=True)
    clock_out = models.TimeField(null=True, blank=True)
    status = models.CharField(
        max_length=20,
        choices=[
            ('PRESENT', 'Present'),
            ('ABSENT', 'Absent'),
            ('LATE', 'Late'),
            ('HALF_DAY', 'Half Day'),
            ('LEAVE', 'On Leave'),
            ('HOLIDAY', 'Holiday')
        ],
        default='PRESENT'
    )
    overtime_hours = models.DecimalField(max_digits=5, decimal_places=2, default=0)
    late_minutes = models.IntegerField(default=0)
    notes = models.TextField(blank=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    
    class Meta:
        verbose_name = 'Employee Attendance'
        verbose_name_plural = 'Employee Attendance'
        ordering = ['-date', 'employee']
        unique_together = ['employee', 'date']
    
    def __str__(self):
        return f"{self.employee} - {self.date} ({self.status})"
    
    def calculate_late_minutes(self):
        """Calculate late minutes based on expected start time"""
        if not self.clock_in or not self.employee.expected_start_time:
            return 0
        
        expected_time = datetime.combine(self.date, self.employee.expected_start_time)
        actual_time = datetime.combine(self.date, self.clock_in)
        
        if actual_time > expected_time:
            diff = actual_time - expected_time
            return int(diff.total_seconds() / 60)
        return 0
    
    def calculate_overtime_hours(self):
        """Calculate overtime hours based on expected end time"""
        if not self.clock_out or not self.employee.expected_end_time:
            return 0
        
        expected_time = datetime.combine(self.date, self.employee.expected_end_time)
        actual_time = datetime.combine(self.date, self.clock_out)
        
        if actual_time > expected_time:
            diff = actual_time - expected_time
            return round(diff.total_seconds() / 3600, 2)
        return 0
    
    def save(self, *args, **kwargs):
        # Calculate late minutes and overtime hours before saving
        self.late_minutes = self.calculate_late_minutes()
        self.overtime_hours = self.calculate_overtime_hours()
        
        # Update status based on late minutes
        if self.late_minutes > 0 and self.status == 'PRESENT':
            self.status = 'LATE'
        
        super().save(*args, **kwargs)


class AttendanceRule(SoftDeletionModel):
    """Model for defining attendance rules and deductions"""
    name = models.CharField(max_length=100)
    description = models.TextField(blank=True)
    late_deduction_type = models.CharField(
        max_length=20,
        choices=[
            ('FIXED', 'Fixed Amount'),
            ('PER_MINUTE', 'Per Minute'),
            ('PERCENTAGE', 'Percentage of Daily Rate')
        ],
        default='FIXED'
    )
    late_deduction_amount = models.DecimalField(max_digits=10, decimal_places=2, default=0)
    late_threshold_minutes = models.IntegerField(default=15, 
                                               help_text="Minutes after which late deduction applies")
    absent_deduction_type = models.CharField(
        max_length=20,
        choices=[
            ('FIXED', 'Fixed Amount'),
            ('PERCENTAGE', 'Percentage of Daily Rate'),
            ('FULL_DAY', 'Full Day Rate')
        ],
        default='FULL_DAY'
    )
    absent_deduction_amount = models.DecimalField(max_digits=10, decimal_places=2, default=0)
    overtime_rate_multiplier = models.DecimalField(max_digits=3, decimal_places=2, default=1.5,
                                                 help_text="Multiplier for overtime hours")
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    
    class Meta:
        verbose_name = 'Attendance Rule'
        verbose_name_plural = 'Attendance Rules'
        ordering = ['name']
    
    def __str__(self):
        return self.name
    
    def calculate_late_deduction(self, employee, late_minutes):
        """Calculate deduction for late arrival"""
        if late_minutes < self.late_threshold_minutes:
            return 0
        
        daily_rate = employee.get_daily_rate()
        
        if self.late_deduction_type == 'FIXED':
            return self.late_deduction_amount
        elif self.late_deduction_type == 'PER_MINUTE':
            return self.late_deduction_amount * late_minutes
        elif self.late_deduction_type == 'PERCENTAGE':
            return daily_rate * (self.late_deduction_amount / 100)
        
        return 0
    
    def calculate_absent_deduction(self, employee):
        """Calculate deduction for absence"""
        daily_rate = employee.get_daily_rate()
        
        if self.absent_deduction_type == 'FIXED':
            return self.absent_deduction_amount
        elif self.absent_deduction_type == 'PERCENTAGE':
            return daily_rate * (self.absent_deduction_amount / 100)
        elif self.absent_deduction_type == 'FULL_DAY':
            return daily_rate
        
        return 0
    
    def calculate_overtime_pay(self, employee, overtime_hours):
        """Calculate overtime pay"""
        hourly_rate = employee.get_hourly_rate()
        return hourly_rate * overtime_hours * self.overtime_rate_multiplier
