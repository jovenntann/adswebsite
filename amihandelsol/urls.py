from django.conf.urls import url,include
from django.contrib import admin
from adsapp import views
from django.conf.urls import handler404, handler500

urlpatterns = [
    url(r'^',include('adsapp.urls')), # Public
    url(r'^portal/',include('adsapp.urls')), # Portal
    url(r'^admin/', admin.site.urls), # Admin
]

handler404 = views.error_404
handler500 = views.error_500


