# Generated by Django 4.2 on 2025-04-16 06:16

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion
import uuid


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('payroll', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='PayrollPermission',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('module', models.CharField(choices=[('DASHBOARD', 'Dashboard'), ('PERIOD', 'Payroll Period'), ('COMPONENT', 'Salary Component'), ('STRUCTURE', 'Salary Structure'), ('CALCULATION', 'Payroll Calculation'), ('PAYMENT', 'Payment'), ('DOCUMENT', 'Document'), ('REPORT', 'Report'), ('AUDIT', 'Audit'), ('SETTING', 'Setting')], max_length=50)),
                ('permission_type', models.CharField(choices=[('VIEW', 'View'), ('CREATE', 'Create'), ('UPDATE', 'Update'), ('DELETE', 'Delete'), ('APPROVE', 'Approve'), ('EXPORT', 'Export')], max_length=20)),
                ('description', models.TextField(blank=True)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
            ],
            options={
                'unique_together': {('module', 'permission_type')},
            },
        ),
        migrations.CreateModel(
            name='PayrollRole',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100)),
                ('description', models.TextField(blank=True)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('permissions', models.ManyToManyField(to='payroll.payrollpermission')),
            ],
        ),
        migrations.CreateModel(
            name='SecuritySettings',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('require_mfa', models.BooleanField(default=False)),
                ('mfa_method', models.CharField(choices=[('EMAIL', 'Email'), ('SMS', 'SMS'), ('AUTHENTICATOR', 'Authenticator App')], default='EMAIL', max_length=20)),
                ('password_expiry_days', models.IntegerField(default=90)),
                ('max_login_attempts', models.IntegerField(default=5)),
                ('session_timeout_minutes', models.IntegerField(default=30)),
                ('ip_whitelist', models.TextField(blank=True)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
            ],
        ),
        migrations.CreateModel(
            name='AuditLog',
            fields=[
                ('id', models.UUIDField(default=uuid.uuid4, editable=False, primary_key=True, serialize=False)),
                ('action', models.CharField(choices=[('CREATE', 'Create'), ('UPDATE', 'Update'), ('DELETE', 'Delete'), ('VIEW', 'View'), ('EXPORT', 'Export'), ('APPROVE', 'Approve'), ('REJECT', 'Reject'), ('LOGIN', 'Login'), ('LOGOUT', 'Logout'), ('FAILED_LOGIN', 'Failed Login')], max_length=20)),
                ('model_name', models.CharField(max_length=100)),
                ('object_id', models.CharField(max_length=100)),
                ('details', models.TextField(blank=True)),
                ('ip_address', models.GenericIPAddressField(null=True)),
                ('user_agent', models.TextField(blank=True)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('metadata', models.JSONField(blank=True, default=dict)),
                ('user', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='UserPayrollRole',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('is_active', models.BooleanField(default=True)),
                ('assigned_at', models.DateTimeField(auto_now_add=True)),
                ('expires_at', models.DateTimeField(blank=True, null=True)),
                ('assigned_by', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='role_assignments', to=settings.AUTH_USER_MODEL)),
                ('role', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='payroll.payrollrole')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'unique_together': {('user', 'role')},
            },
        ),
        migrations.AddIndex(
            model_name='auditlog',
            index=models.Index(fields=['user', 'action', 'created_at'], name='payroll_aud_user_id_af1665_idx'),
        ),
        migrations.AddIndex(
            model_name='auditlog',
            index=models.Index(fields=['model_name', 'object_id'], name='payroll_aud_model_n_81fcd3_idx'),
        ),
    ]
