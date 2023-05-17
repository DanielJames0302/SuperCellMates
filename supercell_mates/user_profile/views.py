from django.shortcuts import render
from django.http import JsonResponse
from .models import UserProfile
from user_auth.models import UserAuth, Tag


def index(request):
    if request.user.is_authenticated:
        user_profile_obj = UserProfile.objects.get(user_auth=request.user)
        tags = list(user_profile_obj.tagList.all())
        return render(request, 'user_profile/index.html', {
            "image_url": user_profile_obj.profile_pic.url,
            "user_profile": user_profile_obj,
            "tags": tags
        })


def add_tags(request):
    if request.method == "POST" and request.user.is_authenticated:
        user_profile_obj = request.user.user_profile
        count = request.POST["count"]
        requested_tags = request.POST["tags"].strip("[]").split(", ")
        for i in range(int(count)):
            user_profile_obj.tagList.add(Tag.objects.get(id=requested_tags[i]))
        return JsonResponse({"message": "success"})


def setup(request):
    return render(request, "user_profile/setup.html")
    

def obtain_tags(request):
    if request.user.is_authenticated:
        user_profile = request.user.user_profile
        tagList = set(user_profile.tagList.all())
        tags = list(Tag.objects.all())
        tags = list(map(lambda tag: {
            "tag_id": tag.id,
            "tag_name": tag.name,
            "in": tag in tagList
        }, tags))
        return JsonResponse({
            "tags": tags
        })


def set_profile_image(request):
    if request.method == "POST" and request.user.is_authenticated:
        user_profile_obj = request.user.user_profile
        print(request.FILES)
        img = request.FILES["img"]
        print(img)
        user_profile_obj.profile_pic = img
        user_profile_obj.save()
        return JsonResponse({"message": "success"})