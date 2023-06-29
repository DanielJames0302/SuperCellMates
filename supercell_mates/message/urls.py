from django.urls import path
from . import views


app_name = 'message'
urlpatterns = [
    path('', views.index, name='index'),
    path('create_group_chat', views.create_group_chat, name='create_group_chat'),
    path('get_group_chats', views.get_group_chats, name='get_group_chats'),
    path('get_private_chats', views.get_private_chats, name='get_private_chats'),
    path('get_private_messages/<str:chat_id>', views.get_private_messages, name='get_private_messages'),
    path('upload_file', views.upload_file, name='upload_file'),
    path('image/<str:message_id>', views.get_image, name='get_image'),
    path('get_private_chat_id/<str:username>', views.get_private_chat_id, name='get_private_chat_id'),
]