# Generated by Django 4.1.11 on 2024-10-16 07:02

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('employee', '0024_leads_lead_type'),
        ('finance', '0007_journal_entry_description'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='journal_entry',
            name='region',
        ),
        migrations.AddField(
            model_name='journal_entry',
            name='branch',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='employee.branch'),
        ),
        migrations.AddField(
            model_name='journal_entry',
            name='doc_path',
            field=models.CharField(blank=True, max_length=100, null=True),
        ),
    ]