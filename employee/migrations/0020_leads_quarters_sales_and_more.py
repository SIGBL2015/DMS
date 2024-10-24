# Generated by Django 4.1.11 on 2024-08-19 12:08

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('employee', '0019_rename_quarter_target_employee_target_quarter_first_target_and_more'),
    ]

    operations = [
        migrations.CreateModel(
            name='Leads',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('lead_date', models.DateField(null=True)),
                ('convert_date', models.DateField(null=True)),
                ('created_at', models.DateField(auto_now_add=True, null=True)),
                ('updated_at', models.DateField(auto_now=True, null=True)),
                ('deleted_at', models.DateField(blank=True, null=True)),
                ('status', models.IntegerField(default=1)),
                ('sale_person', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='employee.employee')),
            ],
            options={
                'db_table': 'leads',
            },
        ),
        migrations.CreateModel(
            name='Quarters',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=255, null=True)),
                ('short_name', models.CharField(max_length=50, null=True)),
                ('year', models.CharField(max_length=50, null=True)),
                ('start_date', models.DateField(null=True)),
                ('end_date', models.DateField(null=True)),
                ('created_at', models.DateField(auto_now_add=True, null=True)),
                ('updated_at', models.DateField(auto_now=True, null=True)),
                ('deleted_at', models.DateField(blank=True, null=True)),
                ('status', models.IntegerField(default=1)),
            ],
            options={
                'db_table': 'quarters',
            },
        ),
        migrations.CreateModel(
            name='Sales',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('lead_id', models.IntegerField(null=True)),
                ('amount', models.IntegerField(null=True)),
                ('created_at', models.DateField(auto_now_add=True, null=True)),
                ('updated_at', models.DateField(auto_now=True, null=True)),
                ('deleted_at', models.DateField(blank=True, null=True)),
                ('status', models.IntegerField(default=1)),
            ],
            options={
                'db_table': 'sales',
            },
        ),
        migrations.RemoveField(
            model_name='employee_target',
            name='quarter_first_target',
        ),
        migrations.RemoveField(
            model_name='employee_target',
            name='quarter_fourth_target',
        ),
        migrations.RemoveField(
            model_name='employee_target',
            name='quarter_second_target',
        ),
        migrations.RemoveField(
            model_name='employee_target',
            name='quarter_third_target',
        ),
        migrations.RemoveField(
            model_name='employee_target',
            name='year_target',
        ),
        migrations.AddField(
            model_name='project',
            name='lead_id',
            field=models.IntegerField(null=True),
        ),
        migrations.AddField(
            model_name='project',
            name='manager_id',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='employee.employee'),
        ),
        migrations.AddField(
            model_name='project',
            name='team_id',
            field=models.IntegerField(null=True),
        ),
        migrations.DeleteModel(
            name='Employee_project',
        ),
        migrations.AddField(
            model_name='sales',
            name='project',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='employee.project'),
        ),
        migrations.AddField(
            model_name='sales',
            name='quarter_id',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='employee.quarters'),
        ),
        migrations.AddField(
            model_name='sales',
            name='sale_person',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='employee.employee'),
        ),
        migrations.AddField(
            model_name='employee_target',
            name='quarter_id',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='employee.quarters'),
        ),
    ]
