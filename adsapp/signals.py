from django.contrib.auth.models import User
from django.db.models.signals import post_save
from django.dispatch import receiver
from channels.layers import get_channel_layer
from asgiref.sync import async_to_sync

@receiver(post_save, sender=User)
def announce_new_user(sender, instance, created, **kwargs):
    if created:
        channel_layer = get_channel_layer()
        async_to_sync(channel_layer.group_send)(
            "gossip", { # Group Channel Name (All Channels under this group will receive the message!)
                "type": "user.gossip", # Type 
                "event": "New User", # Event Name
                "username": instance.username # Name of New User
            }
        )