from channels.routing import ProtocolTypeRouter, URLRouter
from django.conf.urls import url

from adsapp.consumers import PortalConsumer,GroupConsumer

application = ProtocolTypeRouter({
    "websocket": URLRouter([
        url(r"^portal/$", PortalConsumer),
        url(r"^group/$", GroupConsumer),
    ])
})



