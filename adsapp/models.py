# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models
from django.contrib.auth.models import User

class DateRange(models.Model):
    user = models.ForeignKey(User)
    date_from = models.DateField()
    date_to = models.DateField()

    def __str__(self):
        return str(self.user)   

# Create your models here.
class Customer(models.Model):
    firstname = models.CharField(max_length=50)
    lastname = models.CharField(max_length=50)
    email = models.EmailField(max_length=70)
    number = models.CharField(max_length=80)
    created = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return str(self.firstname + ' ' + self.lastname)

class Inquiry(models.Model):
    name = models.CharField(max_length=50)
    email = models.EmailField(max_length=70)
    number = models.CharField(max_length=80)
    subject = models.CharField(max_length=100)
    message = models.CharField(max_length=1000)
    created = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return str(self.name)

class Room(models.Model):
    room = models.CharField(max_length=50)
    types = models.CharField(max_length=50)
    description = models.CharField(max_length=500)
    bed = models.CharField(max_length=50)
    bed_quantity = models.CharField(max_length=50)
    category = models.CharField(max_length=50)
    price = models.IntegerField()
    thumbnail = models.CharField(max_length=250)

    def __str__(self):
        return str(self.room + " - " + self.types + " - " + self.category)

class Amenities(models.Model):
    types = models.CharField(max_length=50)
    description = models.CharField(max_length=50)
    icon = models.CharField(max_length=50)

    def __str__(self):
        return str(self.description + " (" + self.icon + ")")

class Room_Amenities(models.Model):
    room = models.ForeignKey(Room)
    amenities = models.ForeignKey(Amenities)

    def __str__(self):
        return str(self.room.room + " | " + self.amenities.description + "")

class Room_Gallery(models.Model):
    room = models.ForeignKey(Room)
    link = models.CharField(max_length=250)

    def __str__(self):
        return str(self.room)

class Booking(models.Model):
    customer = models.ForeignKey(Customer)
    room = models.ForeignKey(Room)
    checkin = models.DateField()
    checkout = models.DateField()
    amount = models.IntegerField()
    notes = models.CharField(max_length=500)
    payment_type = models.CharField(max_length=50)
    payment_status = models.CharField(max_length=50)
    created = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return str(self.customer.firstname + self.customer.lastname)


class Setting(models.Model):
    field = models.CharField(max_length=50)
    value = models.CharField(max_length=200)

    def __str__(self):
        return str(self.field)