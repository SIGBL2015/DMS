# Generated by Django 4.2.2 on 2024-12-30 12:14

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('finance', '0012_journal_entry_expected_date'),
    ]

    operations = [
        migrations.AddField(
            model_name='account_type',
            name='sequence_code',
            field=models.CharField(blank=True, max_length=50, null=True),
        ),
        migrations.AddField(
            model_name='chart_of_accounts',
            name='sequence_code',
            field=models.CharField(blank=True, max_length=50, null=True),
        ),
        migrations.AddField(
            model_name='detail_type',
            name='sequence_code',
            field=models.CharField(blank=True, max_length=50, null=True),
        ),
    ]
