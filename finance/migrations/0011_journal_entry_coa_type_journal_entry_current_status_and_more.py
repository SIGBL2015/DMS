# Generated by Django 4.2.2 on 2024-12-27 05:36

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('finance', '0010_alter_journal_entry_amount_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='journal_entry',
            name='coa_type',
            field=models.CharField(blank=True, max_length=50, null=True),
        ),
        migrations.AddField(
            model_name='journal_entry',
            name='current_status',
            field=models.CharField(blank=True, max_length=50, null=True),
        ),
        migrations.AddField(
            model_name='journal_entry',
            name='status_change_date',
            field=models.DateField(blank=True, null=True),
        ),
        migrations.AlterField(
            model_name='journal_entry',
            name='transaction_type',
            field=models.CharField(blank=True, max_length=50, null=True),
        ),
    ]
