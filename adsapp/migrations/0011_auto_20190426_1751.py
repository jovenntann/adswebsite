# -*- coding: utf-8 -*-
# Generated by Django 1.11.20 on 2019-04-26 09:51
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('adsapp', '0010_auto_20190426_1750'),
    ]

    operations = [
        migrations.AlterField(
            model_name='booking',
            name='amount',
            field=models.IntegerField(),
        ),
    ]
