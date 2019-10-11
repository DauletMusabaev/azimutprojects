from django.shortcuts import render
from rest_framework import generics
from api.models import MyModel
from rest_framework.views import APIView
from django.http import Http404
from api.serializer import MyModelSerializer
# Create your views here.
from rest_framework.response import Response


class All(generics.ListCreateAPIView):
    queryset = MyModel.objects.all()
    serializer_class = MyModelSerializer



class Detail(APIView):

    def get_object(self, pk):
        try:
            return MyModel.objects.get(id=pk)
        except MyModel.DoesNotExist:
            raise Http404

    def get(self, request, pk):
        category = self.get_object(pk)
        serializer = MyModelSerializer(category)
        return Response(serializer.data)