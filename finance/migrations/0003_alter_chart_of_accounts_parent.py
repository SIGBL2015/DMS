# Generated by Django 4.1.11 on 2024-09-10 12:19

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('finance', '0002_rename_parent_id_chart_of_accounts_parent'),
    ]

    operations = [
        migrations.AlterField(
            model_name='chart_of_accounts',
            name='parent',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='finance.chart_of_accounts'),
        ),
    ]
