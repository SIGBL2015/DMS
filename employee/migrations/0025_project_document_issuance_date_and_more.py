# Generated by Django 4.1.11 on 2024-10-31 07:10

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('employee', '0024_leads_lead_type'),
    ]

    operations = [
        migrations.AddField(
            model_name='project_document',
            name='issuance_date',
            field=models.DateField(null=True),
        ),
        migrations.AddField(
            model_name='project_document',
            name='ref_no',
            field=models.CharField(max_length=100, null=True),
        ),
        migrations.AlterField(
            model_name='document_type',
            name='created_at',
            field=models.DateField(auto_now_add=True, null=True),
        ),
        migrations.AlterField(
            model_name='document_type',
            name='updated_at',
            field=models.DateField(auto_now=True, null=True),
        ),
    ]
