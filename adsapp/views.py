from django.http import HttpResponse
from django.shortcuts import render
from django.shortcuts import redirect

# Login and Logout
from django.contrib.auth import authenticate, login, logout
from django.http import HttpResponseRedirect
from amihandelsol import settings
from django.contrib.auth.decorators import login_required

# Models
from adsapp.models import *

# Paypal
from django.core.urlresolvers import reverse
from django.shortcuts import render
from paypal.standard.forms import PayPalPaymentsForm

# Forms
from adsapp.forms import *

# CHANNELS  
from channels.layers import get_channel_layer
from asgiref.sync import async_to_sync

# Telegram Notification
import telebot
API_TOKEN = '806654376:AAEOg-ifaJ_XhYKdxJirkTBd23e7ic0TYSQ'
bot = telebot.TeleBot(API_TOKEN)
cid = '-341823738'

def SocketSend(group,type_,event,text):
    channel_layer = get_channel_layer()
    async_to_sync(channel_layer.group_send)(
        group, { # Group Channel Name (All Channels under this group will receive the message!)
            "type": type_, # user.gossip
            "event": event, # Event Name
            "text": text, # Name of New User
        }
    )

# Paypal ########################################################################
def Payment(request):
    # What you want the button to do.
    paypal_dict = {
        "business": "jovenntann-facilitator@gmail.com",
        "amount": "100.00",
        "item_name": "Deluxe Room",
        "invoice": "12345688",
        "notify_url": request.build_absolute_uri(reverse('paypal-ipn')),
        "return": request.build_absolute_uri('https://ads.servicereferralhub.com/paypal/return/'),
        "cancel_return": request.build_absolute_uri('https://ads.servicereferralhub.com/paypal/cancel/'),
        "custom": "premium_plan",  # Custom command to correlate to some function later (optional)
    }

    # Create the instance.
    form = PayPalPaymentsForm(initial=paypal_dict)
    context = {"form": form}
    return render(request, "adsapp/payment.html", context)

def PaypalReturn(request):
    return render(request, "adsapp/paypal/return.html")

def PaypalCancel(request):
    return render(request, "adsapp/paypal/cancel.html")


# PUBLIC ########################################################################

def index(request):
  
  # SocketSend("portal","user.notification","RoomNotification","10")
  
  settings = Setting.objects.all()
  context = {
      'activate':'index',
      'settings':settings,
  }
  return render(request, "adsapp/index.html",context=context)
  
def ContactUs(request):
  settings = Setting.objects.all()
  context = {
      'settings':settings,
      'activate':'contact-us',
  }
  return render(request, "adsapp/contact.html",context=context)

def RoomList(request):
  settings = Setting.objects.all()
  room_list = Room.objects.all()
  room_amenities = Room_Amenities.objects.all()
  context = {
    'settings':settings,
    'room_list':room_list,
    'room_amenities':room_amenities,
    'activate':'',
  }
  return render(request, "adsapp/rooms-list.html",context=context)

def RoomListSearch(request,checkin,checkout):
  settings = Setting.objects.all()
  room_list = Room.objects.all()
  context = {
      'settings':settings,
      'room_list':room_list,
      'checkin':checkin,
      'checkout':checkout,
  }
  return render(request, "adsapp/rooms-list.html",context=context)


def ProductionRoomView(request,room_id,checkin,checkout):
  settings = Setting.objects.all()
  room = Room.objects.get(id=str(room_id))
  ammenities_list = Room_Amenities.objects.filter(room=str(room_id))
  gallery_list = Room_Gallery.objects.filter(room=str(room_id))
  context = {
    'settings':settings,
    'room':room,
    'checkin':checkin,
    'checkout':checkout,
    'ammenities_list':ammenities_list,
    'gallery_list':gallery_list,
  }
  return render(request, "adsapp/room.html",context=context)

def RoomView(request):
  settings = Setting.objects.all()
  context = {
      'settings':settings,
      'activate':'',
  }
  return render(request, "adsapp/room.html",context=context)

def CheckOut(request):
  settings = Setting.objects.all()
  context = {
      'settings':settings,
      'activate':'',
  }
  return render(request, "adsapp/booking-form.html",context=context)

def AboutUs(request):
  settings = Setting.objects.all()
  context = {
      'settings':settings,
      'activate':'about-us',
  }
  return render(request, "adsapp/about-us.html",context=context)

def Gallery(request):
  settings = Setting.objects.all()
  context = {
      'settings':settings,
      'activate':'gallery',
  }
  return render(request, "adsapp/gallery.html",context=context)
  
def InquirySubmit(request):
        
    name = request.POST['name']
    email = request.POST['email']
    number = request.POST['number']
    subject = request.POST['subject']
    message = request.POST['message']

    Inquiry(name=name,email=email,number=number,subject=subject,message=message).save()

    bot.send_message(cid, f"✉️ Customer Inquiry\n\nName: {name}\nEmail: {email}\nNumber: {number}\nSubject: {subject}\nMessage: {message}")

    return HttpResponseRedirect('/')


# PORTAL ########################################################################
def Login(request):
      
    if request.method == "POST":
        username = request.POST['username']
        password = request.POST['password']

        user = authenticate(username=username, password=password)

        if user is not None:
            if user.is_active:
                login(request, user)
                return HttpResponseRedirect('/portal/bookings/')
            else:
                return HttpResponse("Inactive user.")
        else:
            return HttpResponseRedirect('/portal/bookings/')

    return render(request, "adsapp/portal/login.html")

@login_required
def Logout(request):
    logout(request)
    return HttpResponseRedirect('/portal/login')

@login_required
def daterange_submit(request):
        
    date_from = request.POST['from']
    date_to = request.POST['to']
    current_url = request.POST['current_url']
    
    # Get Current Logged-in User ID
    current_user = request.user
    user_id = current_user.id
    
    DateRange.objects.filter(id=user_id).update(date_from = date_from, date_to = date_to)

    return HttpResponseRedirect(current_url)

@login_required
def Home(request):
    return HttpResponseRedirect('/portal/bookings/')

@login_required
def Bookings(request):

    current_user = request.user
    user_id = current_user.id

    daterange_get = DateRange.objects.get(id=user_id)
    date_from = str(daterange_get.date_from)
    date_to = str(daterange_get.date_to)
    activate = "bookings"

    current_url = "/portal/bookings/"

    booking_list = Booking.objects.all()
    context = {
        'date_from':date_from,
        'date_to':date_to,
        'current_url':current_url,
        'activate':activate,
        'booking_list':booking_list,
    }

    return render(request, "adsapp/portal/bookings.html",context=context)

@login_required
def BookingAddSubmit(request):

    if request.method == 'POST':
        form = CustomerForm(request.POST)

        if form.is_valid():
            firstname = form.cleaned_data['firstname']
            lastname = form.cleaned_data['lastname']
            email = form.cleaned_data['email']
            number = form.number['cc_myself']
    
            print(firstname)
            print(lastname)
            print(email)
            print(number)

            return HttpResponseRedirect('/portal/bookings/')
    else:
        form = CustomerForm()

    return render(request, "adsapp/portal/booking_add.html", {'form': form})


@login_required
def Rooms(request):

    current_user = request.user
    user_id = current_user.id

    daterange_get = DateRange.objects.get(id=user_id)
    date_from = str(daterange_get.date_from)
    date_to = str(daterange_get.date_to)
    activate = "rooms"

    current_url = "/portal/rooms/"

    room_list = Room.objects.all()
    context = {
        'date_from':date_from,
        'date_to':date_to,
        'current_url':current_url,
        'activate':activate,
        'room_list':room_list,
    }

    return render(request, "adsapp/portal/rooms.html",context=context)

@login_required
def RoomDetails(request,room_id):

    current_user = request.user
    user_id = current_user.id
       
    daterange_get = DateRange.objects.get(id=user_id)
    date_from = str(daterange_get.date_from)
    date_to = str(daterange_get.date_to)

    current_url = "/portal/rooms/" + room_id
    activate = "rooms"
    
    RoomDetails = Room.objects.get(id=room_id)
    RoomAmenities = Room_Amenities.objects.filter(room=room_id)
    amenities_list = Amenities.objects.filter()
    print(RoomAmenities)
    context = {
        'current_url':current_url,
        'date_from':date_from,
        'date_to':date_to,
        'activate':activate,
        'RoomAmenities':RoomAmenities,
        'amenities_list':amenities_list,
        'RoomDetails':RoomDetails,
        
    }

    return render(request,'adsapp/portal/room_view.html',context=context)

def error_404(request):
  return render(request,'adsapp/404.html')
def error_500(request):
  return render(request,'adsapp/505.html')

# Channels
def Group(request):
  return render(request,'adsapp/channels/group.html')