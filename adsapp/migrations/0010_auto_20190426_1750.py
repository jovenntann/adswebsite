# -*- coding: utf-8 -*-
# Generated by Django 1.11.20 on 2019-04-26 09:50
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('adsapp', '0009_room_price'),
    ]

    operations = [
        migrations.AlterField(
            model_name='room',
            name='price',
            field=models.IntegerField(),
        ),
    ]
