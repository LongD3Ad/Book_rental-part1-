from django.contrib.auth.models import Permission
from django.db import models
from django.contrib.auth.models import AbstractUser,Group
from django.utils import timezone
from core.managers import UserManager
from .constants import USER_TYPE_CHOICES
from django.utils.translation import gettext_lazy as _
from django.db.models import Avg

class CustomUser(AbstractUser):
    username=None
    email = models.EmailField(unique=True, null=True, db_index=True)
    is_active = models.BooleanField(default=False)
    is_staff = models.BooleanField(default=False)
    date_joined = models.DateTimeField(default=timezone.now)
    user_type = models.PositiveSmallIntegerField(choices=USER_TYPE_CHOICES)
    phone = models.CharField(max_length=15, unique=True)
    dp = models.ImageField(upload_to='profile/')
    REQUIRED_FIELDS = ['first_name']
    USERNAME_FIELD = 'email'

    objects = UserManager()
    groups = models.ManyToManyField(
        Group,
        verbose_name=_('groups'),
        blank=True,
        related_name='custom_user_groups'  # Add a unique related_name
    )
    user_permissions = models.ManyToManyField(
        Permission,
        verbose_name='user permissions',
        blank=True,
        related_name='custom_user_permissions'
    )


class Address(models.Model):
    user=models.ForeignKey(CustomUser,on_delete=models.CASCADE)
    city=models.CharField(max_length=25)
    state=models.CharField(max_length=25)


class Store(models.Model):
    name=models.CharField(max_length=20)
    about=models.TextField()
    image=models.ImageField(upload_to='store/')

    def No_of_Books(self):
        return len(Book.objects.filter(store=self.id))
    
    def __str__(self) -> str:
        return f'{self.name}'

    
class Author(models.Model):
    name = models.CharField(max_length=20)

    def __str__(self):
        return f"{self.name}"


class Book(models.Model):
    name=models.CharField(max_length=20)
    image=models.ImageField(upload_to='books/')
    description=models.TextField()
    content=models.TextField()
    author=models.ForeignKey(Author,on_delete=models.CASCADE)
    store=models.ForeignKey(Store,on_delete=models.CASCADE)
    categories=models.CharField(max_length=100)
    def __str__(self) -> str:
        return self.name
    def get_categories(self):
        return self.categories.split(',')
    def get_rating(self):
            ratings = Rating.objects.filter(bood_id=self)
            if ratings.exists():
                return ratings.aggregate(Avg('rating'))['rating__avg']
            return None


class Order(models.Model):
    book = models.ForeignKey(Book, on_delete=models.CASCADE)
    is_active = models.BooleanField(default=True)
    timing = models.DateTimeField(auto_now_add=True)
    buyer = models.ForeignKey(CustomUser, on_delete=models.SET_NULL, blank=True, null=True)


class Rating(models.Model):
    bood_id=models.ForeignKey(Book,on_delete=models.CASCADE)
    user=models.ForeignKey(CustomUser,on_delete=models.CASCADE)
    review=models.TextField()
    rating=models.IntegerField(default=1)


class NewsLetter(models.Model):
    name=models.CharField(max_length=15)
    email=models.EmailField()

    def __str__(self):
        return self.name
