# -------------------------------------------------------------------------
# ARGUMENTS
# -------------------------------------------------------------------------
import sys
group = sys.argv[1]
type_ = sys.argv[2]
event = sys.argv[3]
message = sys.argv[4]
# -------------------------------------------------------------------------
# DJANGO SETTINGS 
# -------------------------------------------------------------------------
import django
from django.conf import settings

settings.configure(CHANNEL_LAYERS = {"default": {"BACKEND": "channels_redis.core.RedisChannelLayer","CONFIG": {"hosts": [("localhost", 6379)]},}},
                   ASGI_APPLICATION = "amihandelsol.routing.application")

# -------------------------------------------------------------------------
# CHANNELS  
# -------------------------------------------------------------------------
from channels.layers import get_channel_layer
from asgiref.sync import async_to_sync

def Send(group,type_,event,message):
    channel_layer = get_channel_layer()
    async_to_sync(channel_layer.group_send)(
        group, { # Group Channel Name (All Channels under this group will receive the message!)
            "type": type_, # Type 
            "event": event, # Event Name
            "text": message, # Name of New User
        }
    )

Send(group,type_,event,message)