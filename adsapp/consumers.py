# ------------------------------------------------------------------------------------------
# CHANNEL LAYERS
# ------------------------------------------------------------------------------------------
# https://channels.readthedocs.io/en/latest/topics/channel_layers.html

import asyncio
from channels.generic.websocket import AsyncJsonWebsocketConsumer

class PortalConsumer(AsyncJsonWebsocketConsumer):

    async def connect(self):
        await self.accept()
        await self.channel_layer.group_add("portal", self.channel_name) # gossip -> Group Name , self.channel_name -> Random Channel ID per new Socket Session
        print(f"Added {self.channel_name} channel to portal")
        await self.channel_layer.group_send("portal", {"type":"user.notification","event": "Connected","username": "Joven"})
        
    async def disconnect(self, event):
        await self.channel_layer.group_discard("portal", self.channel_name)
        print(f"Removed {self.channel_name} channel from portal")

    async def user_notification(self, event): # If Changing Type need to replace this Example chat.message this needs to be chat_message
        await  self.send_json(event)
        print(f"Got Message {event} as {self.channel_name}")

    async def receive(self, text_data):
        await self.channel_layer.group_send("portal", {"type":"user.notification","event": "New User","username": text_data}) 


class GroupConsumer(AsyncJsonWebsocketConsumer):

    async def connect(self):
        await self.accept()
        await self.channel_layer.group_add("gossip", self.channel_name) # gossip -> Group Name , self.channel_name -> Random Channel ID per new Socket Session
        print(f"Added {self.channel_name} channel to gossip")
        await self.channel_layer.group_send("gossip", {"type":"user.gossip","event": "New User","username": "Joven"})
        
    async def disconnect(self, event):
        await self.channel_layer.group_discard("gossip", self.channel_name)
        print(f"Removed {self.channel_name} channel from gossip")

    async def user_gossip(self, event):
        await  self.send_json(event)
        print(f"Got Message {event} as {self.channel_name}")

    async def receive(self, text_data):
        await self.channel_layer.group_send("gossip", {"type":"user.gossip","event": "New User","username": text_data}) 

# ------------------------------------------------------------------------------------------
# SINGLE CHANNEL
# ------------------------------------------------------------------------------------------
# from channels.db import database_sync_to_async
# from channels.generic.websocket import WebsocketConsumer

# class SingleConsumer(AsyncJsonWebsocketConsumer):

#     async def connect(self):
#         await self.accept()
#         await self.channel_layer.group_add("gossip", self.channel_name) # gossip -> Group Name , self.channel_name -> Random Channel ID per new Socket Session
#         print(f"Added {self.channel_name} channel to gossip")
#         await self.channel_layer.group_send("gossip", {"type":"user.gossip","event": "New User","username": "Joven"})

        
#     async def disconnect(self):
#         await self.channel_layer.group_discard("gossip", self.channel_name)
#         print(f"Removed {self.channel_name} channel from gossip")

#     async def user_gossip(self, event):
#         await  self.send_json(event)
#         print(f"Got Message {event} as {self.channel_name}")

#     async def receive(self, text_data):
#         await self.send("gossip", {
#             "type": "chat.message",
#             "text": "Hello there!",
#         })

 

































# NOTIFICATIONS ############################################################################################
# from channels.consumer import AsyncConsumer
# class EchoConsumer(AsyncConsumer):
#     async def websocket_connect(self,event):
#         await self.send({
#             "type":"websocket.accept"
#         })
#     async def websocket_receive(self,event):
#         # Echo the received payload
#         await self.send({
#             "type": "websocket.send",
#             "text": event["text"]
#         })
#     async def websocket_disconnect(self, event):
#         # Called when the socket closes
#         await self.send({
#             "type":"websocket.disconnect" 
#         })


# TIKTOCK ################################################################################################
# import asyncio
# from channels.generic.websocket import AsyncJsonWebsocketConsumer
# class TickTockConsumer(AsyncJsonWebsocketConsumer):
#     async def connect(self):
#         await self.accept()
#         while 1:
#             await asyncio.sleep(1)
#             await self.send_json("tick")
#             await asyncio.sleep(1)
#             await self.send_json(".....tock")

