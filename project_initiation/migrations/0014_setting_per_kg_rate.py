# Generated by Django 4.2 on 2025-07-10 05:10

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('project_initiation', '0013_setting_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='setting',
            name='per_kg_rate',
            field=models.FloatField(blank=True, null=True),
        ),
    ]
