# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.apps import AppConfig


class AdsappConfig(AppConfig):
    name = 'adsapp'

    def ready(self):
        from .import signals