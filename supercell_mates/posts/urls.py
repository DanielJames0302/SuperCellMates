from django.urls import path
from . import views


app_name = "posts"
urlpatterns = [
    path('create_post', views.create_post, name="create_post"),
    path('post/<str:post_id>', views.get_post, name="get_post"),
    path('posts/<str:username>', views.get_profile_posts, name="get_profile_posts"),
    path('post/img/<str:pic_id>', views.get_post_pic, name="get_post_pic"),
]