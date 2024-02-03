from rest_framework import serializers
from .models import *

class CustomUserSerialiser(serializers.ModelSerializer):
    class Meta:
        model=CustomUser
        fields = '__all__'

class AddressSerializer(serializers.ModelSerializer):
    class Meta:
        model=Address
        fields = '__all__'

class StoreSerializer(serializers.ModelSerializer):
    class Meta:
        model=Store
        fields = '__all__'

class BookSerializer(serializers.ModelSerializer):
    class Meta:
        model=Book
        fields = '__all__'

class OrderSerializer(serializers.ModelSerializer):
    class Meta:
        model=Order
        fields = '__all__'

class AuthorSerializer(serializers.ModelSerializer):
    class Meta:
        model=Author
        fields = '__all__'

class RatingSerializer(serializers.ModelSerializer):
    class Meta:
        model=Rating
        fields = '__all__'

class NewsLetterSerializer(serializers.ModelSerializer):
    class Meta:
        model=NewsLetter
        fields = '__all__'