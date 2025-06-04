from django.urls import path
from . import views

app_name = 'payroll'

urlpatterns = [
    # Dashboard
    path('', views.PayrollDashboardView.as_view(), name='dashboard'),
    
    # MFA URLs
    path('mfa/verify/', views.MFAVerifyView.as_view(), name='mfa_verify'),
    path('mfa/setup/', views.MFASetupView.as_view(), name='mfa_setup'),
    path('mfa/send-code/', views.send_mfa_code, name='send_mfa_code'),
    
    # Payroll Period URLs
    path('periods/', views.PayrollPeriodListView.as_view(), name='period_list'),
    path('periods/create/', views.PayrollPeriodCreateView.as_view(), name='period_create'),
    path('periods/<int:pk>/update/', views.PayrollPeriodUpdateView.as_view(), name='period_update'),
    path('periods/<int:pk>/delete/', views.PayrollPeriodDeleteView.as_view(), name='period_delete'),

    # Salary Component URLs
    path('components/', views.SalaryComponentListView.as_view(), name='component_list'),
    path('components/create/', views.SalaryComponentCreateView.as_view(), name='component_create'),
    path('components/<int:pk>/update/', views.SalaryComponentUpdateView.as_view(), name='component_update'),
    path('components/<int:pk>/delete/', views.SalaryComponentDeleteView.as_view(), name='component_delete'),

    # Employee Salary Structure URLs
    path('structures/', views.EmployeeSalaryStructureListView.as_view(), name='structure_list'),
    path('structures/create/', views.EmployeeSalaryStructureCreateView.as_view(), name='structure_create'),
    path('structures/<int:pk>/update/', views.EmployeeSalaryStructureUpdateView.as_view(), name='structure_update'),
    path('structures/<int:pk>/delete/', views.EmployeeSalaryStructureDeleteView.as_view(), name='structure_delete'),

    # Payroll Calculation URLs
    path('calculations/', views.PayrollCalculationListView.as_view(), name='calculation_list'),
    path('calculations/create/', views.PayrollCalculationCreateView.as_view(), name='calculation_create'),
    path('calculations/<int:pk>/', views.PayrollCalculationDetailView.as_view(), name='calculation_detail'),
    path('calculations/<int:pk>/update/', views.PayrollCalculationUpdateView.as_view(), name='calculation_update'),
    path('calculations/<int:pk>/delete/', views.PayrollCalculationDeleteView.as_view(), name='calculation_delete'),
    path('calculations/bulk/', views.BulkPayrollCalculationView.as_view(), name='calculation_bulk'),
    path('calculations/export/', views.ExportPayrollCalculationsView.as_view(), name='calculation_export'),

    # Payment URLs
    path('payments/', views.PayrollPaymentListView.as_view(), name='payment_list'),
    path('payments/create/<int:calculation_id>/', views.PayrollPaymentCreateView.as_view(), name='payment_create'),
    path('payments/<int:pk>/', views.PayrollPaymentDetailView.as_view(), name='payment_detail'),
    path('payments/<int:pk>/update/', views.PayrollPaymentUpdateView.as_view(), name='payment_update'),
    path('payments/<int:pk>/delete/', views.PayrollPaymentDeleteView.as_view(), name='payment_delete'),

    # Document URLs
    path('documents/', views.PayrollDocumentListView.as_view(), name='document_list'),
    path('documents/create/', views.PayrollDocumentCreateView.as_view(), name='document_create'),
    path('documents/<int:pk>/update/', views.PayrollDocumentUpdateView.as_view(), name='document_update'),
    path('documents/<int:pk>/delete/', views.PayrollDocumentDeleteView.as_view(), name='document_delete'),

    # API URLs
    path('api/employee/<int:employee_id>/components/', views.get_employee_salary_components, name='api_employee_components'),
    path('api/calculate-tax/', views.calculate_tax, name='api_calculate_tax'),

    # Report URLs
    path('reports/payslip/<int:calculation_id>/', views.generate_payslip, name='report_payslip'),
    path('reports/tax/<int:year>/', views.generate_tax_report, name='report_tax'),
    path('reports/tax/', views.tax_report, name='report_tax_list'),
    
    # Audit Log URLs
    path('audit-logs/', views.AuditLogListView.as_view(), name='audit_log_list'),

    # Role Management URLs
    path('roles/', views.PayrollRoleListView.as_view(), name='role_list'),
    path('roles/create/', views.PayrollRoleCreateView.as_view(), name='role_create'),
    path('roles/<int:pk>/', views.PayrollRoleDetailView.as_view(), name='role_detail'),
    path('roles/<int:pk>/update/', views.PayrollRoleUpdateView.as_view(), name='role_update'),
    path('roles/<int:pk>/delete/', views.PayrollRoleDeleteView.as_view(), name='role_delete'),
    path('roles/assign/', views.UserPayrollRoleCreateView.as_view(), name='user_role_create'),
    path('roles/assign/<int:pk>/update/', views.UserPayrollRoleUpdateView.as_view(), name='user_role_update'),
    path('roles/assign/<int:pk>/delete/', views.UserPayrollRoleDeleteView.as_view(), name='user_role_delete'),
    
    # Workflow URLs
    path('workflows/', views.PayrollWorkflowListView.as_view(), name='workflow_list'),
    path('workflows/create/', views.PayrollWorkflowCreateView.as_view(), name='workflow_create'),
    path('workflows/<int:pk>/', views.PayrollWorkflowDetailView.as_view(), name='workflow_detail'),
    path('workflows/<int:pk>/update/', views.PayrollWorkflowUpdateView.as_view(), name='workflow_update'),
    path('workflows/<int:pk>/delete/', views.PayrollWorkflowDeleteView.as_view(), name='workflow_delete'),
    path('workflows/<int:pk>/steps/', views.WorkflowStepListView.as_view(), name='workflow_step_list'),
    path('workflows/<int:pk>/steps/create/', views.WorkflowStepCreateView.as_view(), name='workflow_step_create'),
    path('workflows/steps/<int:pk>/update/', views.WorkflowStepUpdateView.as_view(), name='workflow_step_update'),
    path('workflows/steps/<int:pk>/delete/', views.WorkflowStepDeleteView.as_view(), name='workflow_step_delete'),
    path('workflows/instances/', views.WorkflowInstanceListView.as_view(), name='workflow_instance_list'),
    path('workflows/instances/<int:pk>/', views.WorkflowInstanceDetailView.as_view(), name='workflow_instance_detail'),
    path('workflows/instances/<int:pk>/approve/', views.workflow_instance_approve, name='workflow_instance_approve'),
    path('workflows/instances/<int:pk>/reject/', views.workflow_instance_reject, name='workflow_instance_reject'),
    path('workflows/analysis/', views.WorkflowAnalysisView.as_view(), name='workflow_analysis'),

    # Attendance URLs
    path('attendance/', views.EmployeeAttendanceListView.as_view(), name='attendance_list'),
    path('attendance/create/', views.EmployeeAttendanceCreateView.as_view(), name='attendance_create'),
    path('attendance/bulk-create/', views.AttendanceBulkCreateView.as_view(), name='attendance_bulk_create'),
    path('attendance/<int:pk>/update/', views.EmployeeAttendanceUpdateView.as_view(), name='attendance_update'),
    path('attendance/<int:pk>/delete/', views.EmployeeAttendanceDeleteView.as_view(), name='attendance_delete'),
    path('attendance/import/', views.AttendanceImportView.as_view(), name='attendance_import'),
    path('attendance/export/', views.AttendanceExportView.as_view(), name='attendance_export'),
    path('attendance/report/', views.AttendanceReportView.as_view(), name='attendance_report'),
    
    # Attendance Rule URLs
    path('attendance/rules/', views.AttendanceRuleListView.as_view(), name='attendance_rule_list'),
    path('attendance/rules/create/', views.AttendanceRuleCreateView.as_view(), name='attendance_rule_create'),
    path('attendance/rules/<int:pk>/', views.AttendanceRuleDetailView.as_view(), name='attendance_rule_detail'),
    path('attendance/rules/<int:pk>/update/', views.AttendanceRuleUpdateView.as_view(), name='attendance_rule_update'),
    path('attendance/rules/<int:pk>/delete/', views.AttendanceRuleDeleteView.as_view(), name='attendance_rule_delete'),
] 