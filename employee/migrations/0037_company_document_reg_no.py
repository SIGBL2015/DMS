# Generated by Django 4.2 on 2025-06-03 11:05

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('employee', '0036_issuing_authority_document_type_purpose_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='company_document',
            name='reg_no',
            field=models.CharField(blank=True, max_length=255, null=True),
        ),
    ]
