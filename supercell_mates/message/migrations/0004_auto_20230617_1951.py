# Generated by Django 3.2.6 on 2023-06-17 11:51

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('message', '0003_auto_20230617_1950'),
    ]

    operations = [
        migrations.AddField(
            model_name='groupfilemessage',
            name='is_image',
            field=models.BooleanField(default=False),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='privatefilemessage',
            name='is_image',
            field=models.BooleanField(default=False),
            preserve_default=False,
        ),
    ]