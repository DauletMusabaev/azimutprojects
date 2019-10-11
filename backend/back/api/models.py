from django.db import models

# Create your models here.

class MyModel(models.Model):
    city = models.CharField(max_length=200)
    street = models.CharField(max_length=200)
    home = models.PositiveIntegerField()
    kv = models.PositiveIntegerField()
    area = models.PositiveIntegerField()
    price = models.PositiveIntegerField()