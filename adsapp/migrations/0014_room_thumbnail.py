# -*- coding: utf-8 -*-
# Generated by Django 1.11.20 on 2019-05-13 02:41
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('adsapp', '0013_daterange'),
    ]

    operations = [
        migrations.AddField(
            model_name='room',
            name='thumbnail',
            field=models.CharField(default='/static/public/images/rooms/single/single1.jpg', max_length=250),
            preserve_default=False,
        ),
    ]