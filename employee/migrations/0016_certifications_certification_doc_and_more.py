# Generated by Django 4.1.11 on 2024-07-11 05:06

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('employee', '0015_project_document_remarks'),
    ]

    operations = [
        migrations.AddField(
            model_name='certifications',
            name='certification_doc',
            field=models.CharField(blank=True, max_length=255, null=True),
        ),
        migrations.AddField(
            model_name='certifications',
            name='expiry_date',
            field=models.DateField(null=True),
        ),
        migrations.AddField(
            model_name='education',
            name='degree_doc',
            field=models.CharField(blank=True, max_length=255, null=True),
        ),
        migrations.AddField(
            model_name='employee',
            name='cv_doc',
            field=models.CharField(blank=True, max_length=255, null=True),
        ),
        migrations.AlterField(
            model_name='project',
            name='po_scan_doc',
            field=models.CharField(blank=True, max_length=255, null=True),
        ),
        migrations.AlterField(
            model_name='project_document',
            name='created_at',
            field=models.DateField(auto_now_add=True, null=True),
        ),
        migrations.AlterField(
            model_name='project_document',
            name='deleted_at',
            field=models.DateField(blank=True, null=True),
        ),
        migrations.AlterField(
            model_name='project_document',
            name='doc_path',
            field=models.CharField(blank=True, max_length=255, null=True),
        ),
        migrations.AlterField(
            model_name='project_document',
            name='updated_at',
            field=models.DateField(auto_now=True, null=True),
        ),
    ]