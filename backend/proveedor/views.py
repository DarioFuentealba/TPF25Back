from django.shortcuts import render
from rest_framework import viewsets
from .models import Proveedores
from .serializers import ProveedorSerializer
from computacion.permissions import SoloAdminPermiso
from rest_framework.response import Response 
# Create your views here.

class ProveedorViewSet(viewsets.ModelViewSet):
    queryset = Proveedores.objects.all()
    serializer_class=ProveedorSerializer
    permission_classes=[SoloAdminPermiso]
