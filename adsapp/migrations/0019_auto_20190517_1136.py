# -*- coding: utf-8 -*-
# Generated by Django 1.11.20 on 2019-05-17 03:36
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('adsapp', '0018_setting'),
    ]

    operations = [
        migrations.RenameField(
            model_name='inquiry',
            old_name='name',
            new_name='firstname',
        ),
        migrations.AddField(
            model_name='inquiry',
            name='lastname',
            field=models.CharField(default='Ako', max_length=50),
            preserve_default=False,
        ),
    ]
