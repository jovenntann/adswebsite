# -*- coding: utf-8 -*-
# Generated by Django 1.11.20 on 2019-05-13 10:51
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('adsapp', '0016_auto_20190513_1758'),
    ]

    operations = [
        migrations.RenameField(
            model_name='amenities',
            old_name='_type',
            new_name='types',
        ),
    ]