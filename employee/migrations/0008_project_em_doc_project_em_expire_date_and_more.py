# Generated by Django 4.1.11 on 2024-05-07 10:38

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('employee', '0007_remove_employee_region_remove_project_company_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='project',
            name='em_doc',
            field=models.CharField(max_length=100, null=True),
        ),
        migrations.AddField(
            model_name='project',
            name='em_expire_date',
            field=models.DateField(null=True),
        ),
        migrations.AddField(
            model_name='project',
            name='project_status',
            field=models.CharField(max_length=100, null=True),
        ),
        migrations.AlterField(
            model_name='bank_guaranty',
            name='instrument_no',
            field=models.CharField(max_length=100, null=True),
        ),
        migrations.AlterField(
            model_name='project',
            name='em_instrument_no',
            field=models.CharField(max_length=100, null=True),
        ),
        migrations.AlterField(
            model_name='project',
            name='pg_instrument_no',
            field=models.CharField(max_length=100, null=True),
        ),
    ]
