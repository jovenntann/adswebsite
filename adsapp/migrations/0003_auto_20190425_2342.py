# -*- coding: utf-8 -*-
# Generated by Django 1.11.20 on 2019-04-25 15:42
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('adsapp', '0002_room'),
    ]

    operations = [
        migrations.AlterField(
            model_name='room',
            name='amenities',
            field=models.CharField(max_length=500),
        ),
    ]
