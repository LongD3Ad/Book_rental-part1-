from django.contrib import admin
from .models import Address, Store, Book, Order, Author, Rating, NewsLetter,CustomUser
from django.contrib.auth.admin import UserAdmin
from django.contrib.auth.models import Group

admin.site.unregister(Group)


@admin.register(CustomUser)
class CustomUserAdmin(UserAdmin):
    model = CustomUser
    list_display = ('email', 'first_name', 'last_name', 'phone', 'is_active', 'is_staff', 'date_joined')
    list_filter = ('is_active', 'is_staff', 'date_joined')
    search_fields = ('email', 'first_name', 'last_name', 'phone')
    ordering = ('-date_joined',)
    exclude = ['username']


@admin.register(Address)
class AddressAdmin(admin.ModelAdmin):
    list_display = ('user', 'city', 'state')


@admin.register(Store)
class StoreAdmin(admin.ModelAdmin):
    list_display = ('name', 'about','No_of_Books')


@admin.register(Book)
class BookAdmin(admin.ModelAdmin):
    list_display = ('name', 'store')


@admin.register(Order)
class OrderAdmin(admin.ModelAdmin):
    list_display = ('book', 'is_active', 'timing', 'buyer')


@admin.register(Author)
class AuthorAdmin(admin.ModelAdmin):
    list_display = ('name',)


@admin.register(Rating)
class RatingAdmin(admin.ModelAdmin):
    list_display = ('bood_id', 'user', 'rating')


@admin.register(NewsLetter)
class NewsLetterAdmin(admin.ModelAdmin):
    list_display = ('name', 'email')
