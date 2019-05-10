from django.conf.urls import url,include
from adsapp import views

from django.conf.urls import handler404, handler500

urlpatterns = [
    # PUBLIC
    url(r'^$',views.index,name='index'),
    url(r'^contact-us/$',views.ContactUs,name='contact-us'),
    url(r'^room-list/$',views.RoomList,name='room-list'),
    url(r'^room/$',views.RoomView,name='room-view'),
    url(r'^checkout/$',views.CheckOut,name='checkout'),
    url(r'^room-list/checkin=(?P<checkin>\d{4}-\d{2}-\d{2})&checkout=(?P<checkout>\d{4}-\d{2}-\d{2})/$',views.RoomListSearch,name='room-list-search'), # Live
    url(r'^room/(?P<room_id>.*)/checkin=(?P<checkin>\d{4}-\d{2}-\d{2})&checkout=(?P<checkout>\d{4}-\d{2}-\d{2})/$', views.RoomView,name='room-view'), # Live
    

    # PORTAL
    url(r'^portal/$',views.Home,name='home'),
    url(r'^portal/login/$',views.Login,name='login'),
    url(r'^portal/logout/$',views.Logout,name='logout'),
    url(r'^daterange/submit/$',views.daterange_submit,name='daterange_submit'),
    url(r'^portal/bookings/$',views.Bookings,name='bookings'),
    url(r'^portal/bookings/add/$',views.BookingAddSubmit,name='booking_add_submit'),
    url(r'^portal/bookings/add/submit/$',views.BookingAddSubmit,name='booking_add_submit'),
    url(r'^portal/rooms/$',views.Rooms,name='rooms'),
    url(r'^portal/rooms/(?P<room_id>.*)/$', views.RoomDetails,name='room_details'),

    # PAYPAL
    url(r'^payment/$',views.Payment,name='payment'),
    url(r'^paypal/', include('paypal.standard.ipn.urls')),
    url(r'^paypal/cancel/$',views.PaypalCancel,name='paypal-cancel'),
    url(r'^paypal/return/$',views.PaypalReturn,name='paypal-return'),

    # CHANNELS
    url(r'^group/$',views.Group,name='group'),

]

handler404 = views.error_404
handler500 = views.error_500

