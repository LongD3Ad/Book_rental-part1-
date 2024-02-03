from django.test import RequestFactory
from django.urls import reverse
from rest_framework.decorators import api_view,authentication_classes,permission_classes
from rest_framework_simplejwt.views import TokenObtainPairView
from core.constants import USER
from .models import *
from rest_framework.views import Response
from rest_framework_simplejwt.authentication import JWTAuthentication
from rest_framework.permissions import IsAuthenticated
from rest_framework.views import APIView
from .serializers import *



@api_view(['POST'])
@authentication_classes([])
@permission_classes([])
def create_user(request):
    '''
    This view is used to create a new user 
    '''
    try:
        name=request.data.get('name')
        email=request.data.get('email')
        phone=request.data.get('phone')
        password=request.data.get('password')
        CustomUser.objects.create_user(email=email,password=password,first_name=name,phone=phone,user_type=USER,is_active=True)
        factory = RequestFactory()
        context = {'username': email, 'password': password}
        request = factory.post(reverse('token_obtain_pair'),
                            data=request.data, format='json', **context)
        token_obtain_pair_view = TokenObtainPairView.as_view()
        response = token_obtain_pair_view(request)
        return Response(response.data)
    except Exception as e:
        return Response({"message":'unable to create user','error':str(e)})
    
@api_view(['POST'])
@authentication_classes([JWTAuthentication])
@permission_classes([IsAuthenticated])
def set_address(request):
    try:
        city=request.data.get('city','')
        state=request.data.get('state','')
        address_obj=Address(user=request.user,city=city,state=state)
        address_obj.save()
        return Response({"message":"address added successfully"})
    except Exception as E:
        return Response({'error':str(E)})
    

class IndexView(APIView):
    authentication_classes = [JWTAuthentication]
    permission_classes = [IsAuthenticated]

    def get(self,request):
        book_objs=BookSerializer(Book.objects.all(),many=True)
        return Response({'books':book_objs})
        
    def post(self,request):
        if request.data.get('type')=='1':
            '''
            handle newsletter request
            '''
            try:
                name=request.data.get('name')
                email=request.data.get('email')
                obj=NewsLetter(name=name,email=email)
                obj.save()
                return Response({'message':'you\'re are successfully subscribed our newsletter' })
            except Exception as e:
                return Response({'error':str(e)})

class Dashboard(APIView):
    authentication_classes = [JWTAuthentication]
    permission_classes = [IsAuthenticated]
    def get(self,request):
        user_data=CustomUserSerialiser(request.user)
        order_objs=OrderSerializer(Order.objects.filter(buyer=request.data),many=True)
        reviews=RatingSerializer(Rating.objects.filter(user=request.user),many=True)
        return Response({'data':user_data.data,'order':order_objs.data,'reviews':reviews.data})
    