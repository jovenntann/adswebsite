# -*- coding: utf-8 -*-
# Generated by Django 1.11.20 on 2019-04-25 16:36
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('adsapp', '0004_auto_20190426_0005'),
    ]

    operations = [
        migrations.RenameField(
            model_name='room_amenities',
            old_name='amenities_id',
            new_name='amenities',
        ),
        migrations.RenameField(
            model_name='room_amenities',
            old_name='room_id',
            new_name='room',
        ),
    ]
