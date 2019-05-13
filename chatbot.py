import telebot

API_TOKEN = '806654376:AAEOg-ifaJ_XhYKdxJirkTBd23e7ic0TYSQ'
bot = telebot.TeleBot(API_TOKEN)

cid = '-341823738'
bot.send_message(cid, 'Aweomse')  # send the generated help page

# # Handle all other messages with content_type 'text' (content_types defaults to ['text'])
# @bot.message_handler(func=lambda message: True)
# def echo_message(message):
#     bot.reply_to(message, message.text)
#     print(message)

# bot.polling()