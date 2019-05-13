# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.contrib import admin

# Import Models
from adsapp.models import *

# Register your models here.
admin.site.register(DateRange)
admin.site.register(Customer)
admin.site.register(Room)
admin.site.register(Amenities)
admin.site.register(Room_Amenities)
admin.site.register(Room_Gallery)
admin.site.register(Booking)
admin.site.register(Inquiry)

