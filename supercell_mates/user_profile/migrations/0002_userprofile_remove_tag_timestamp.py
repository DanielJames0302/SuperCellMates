# Generated by Django 3.2.6 on 2023-07-18 06:08

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('user_profile', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='userprofile',
            name='remove_tag_timestamp',
            field=models.FloatField(default=0),
        ),
    ]
