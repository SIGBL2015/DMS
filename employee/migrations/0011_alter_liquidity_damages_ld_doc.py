# Generated by Django 4.1.11 on 2024-05-17 11:35

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('employee', '0010_alter_bank_guaranty_bg_doc'),
    ]

    operations = [
        migrations.AlterField(
            model_name='liquidity_damages',
            name='ld_doc',
            field=models.FileField(null=True, upload_to=''),
        ),
    ]