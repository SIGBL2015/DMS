# Generated by Django 4.2 on 2025-04-16 10:20

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('employee', '0034_bank_guaranty_guarantee_type'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('payroll', '0002_payrollpermission_payrollrole_securitysettings_and_more'),
    ]

    operations = [
        migrations.CreateModel(
            name='AttendanceRule',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100)),
                ('description', models.TextField(blank=True)),
                ('late_deduction_type', models.CharField(choices=[('FIXED', 'Fixed Amount'), ('PER_MINUTE', 'Per Minute'), ('PERCENTAGE', 'Percentage of Daily Rate')], default='FIXED', max_length=20)),
                ('late_deduction_amount', models.DecimalField(decimal_places=2, default=0, max_digits=10)),
                ('late_threshold_minutes', models.IntegerField(default=15, help_text='Minutes after which late deduction applies')),
                ('absent_deduction_type', models.CharField(choices=[('FIXED', 'Fixed Amount'), ('PERCENTAGE', 'Percentage of Daily Rate'), ('FULL_DAY', 'Full Day Rate')], default='FULL_DAY', max_length=20)),
                ('absent_deduction_amount', models.DecimalField(decimal_places=2, default=0, max_digits=10)),
                ('overtime_rate_multiplier', models.DecimalField(decimal_places=2, default=1.5, help_text='Multiplier for overtime hours', max_digits=3)),
                ('is_active', models.BooleanField(default=True)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
            ],
            options={
                'verbose_name': 'Attendance Rule',
                'verbose_name_plural': 'Attendance Rules',
                'ordering': ['name'],
            },
        ),
        migrations.CreateModel(
            name='PayrollWorkflow',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100)),
                ('description', models.TextField(blank=True)),
                ('is_active', models.BooleanField(default=True)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
            ],
        ),
        migrations.CreateModel(
            name='PayrollWorkflowInstance',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('status', models.CharField(choices=[('PENDING', 'Pending'), ('IN_PROGRESS', 'In Progress'), ('COMPLETED', 'Completed'), ('CANCELLED', 'Cancelled')], default='PENDING', max_length=20)),
                ('started_at', models.DateTimeField(auto_now_add=True)),
                ('completed_at', models.DateTimeField(blank=True, null=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('created_by', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='started_workflows', to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='PayrollWorkflowStep',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100)),
                ('description', models.TextField(blank=True)),
                ('order', models.PositiveIntegerField()),
                ('is_required', models.BooleanField(default=True)),
                ('timeout_days', models.PositiveIntegerField(default=0, help_text='Number of days before this step times out (0 for no timeout)')),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('actions', models.ManyToManyField(blank=True, help_text='Actions required to complete this step', to='payroll.payrollpermission')),
                ('role', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='payroll.payrollrole')),
                ('workflow', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='steps', to='payroll.payrollworkflow')),
            ],
            options={
                'ordering': ['order'],
                'unique_together': {('workflow', 'order')},
            },
        ),
        migrations.CreateModel(
            name='PayrollWorkflowTask',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('status', models.CharField(choices=[('PENDING', 'Pending'), ('IN_PROGRESS', 'In Progress'), ('COMPLETED', 'Completed'), ('REJECTED', 'Rejected'), ('CANCELLED', 'Cancelled')], default='PENDING', max_length=20)),
                ('comments', models.TextField(blank=True)),
                ('due_date', models.DateTimeField(blank=True, null=True)),
                ('completed_at', models.DateTimeField(blank=True, null=True)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('assigned_to', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='payroll_tasks', to=settings.AUTH_USER_MODEL)),
                ('step', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='payroll.payrollworkflowstep')),
                ('workflow_instance', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='tasks', to='payroll.payrollworkflowinstance')),
            ],
            options={
                'ordering': ['-created_at'],
            },
        ),
        migrations.AddField(
            model_name='payrollworkflowinstance',
            name='current_step',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='current_instances', to='payroll.payrollworkflowstep'),
        ),
        migrations.AddField(
            model_name='payrollworkflowinstance',
            name='payroll_calculation',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='workflow_instances', to='payroll.payrollcalculation'),
        ),
        migrations.AddField(
            model_name='payrollworkflowinstance',
            name='workflow',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='payroll.payrollworkflow'),
        ),
        migrations.CreateModel(
            name='EmployeeAttendance',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('date', models.DateField()),
                ('clock_in', models.TimeField(blank=True, null=True)),
                ('clock_out', models.TimeField(blank=True, null=True)),
                ('status', models.CharField(choices=[('PRESENT', 'Present'), ('ABSENT', 'Absent'), ('LATE', 'Late'), ('HALF_DAY', 'Half Day'), ('LEAVE', 'On Leave'), ('HOLIDAY', 'Holiday')], default='PRESENT', max_length=20)),
                ('overtime_hours', models.DecimalField(decimal_places=2, default=0, max_digits=5)),
                ('late_minutes', models.IntegerField(default=0)),
                ('notes', models.TextField(blank=True)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('employee', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='attendance_records', to='employee.employee')),
            ],
            options={
                'verbose_name': 'Employee Attendance',
                'verbose_name_plural': 'Employee Attendance',
                'ordering': ['-date', 'employee'],
                'unique_together': {('employee', 'date')},
            },
        ),
    ]
