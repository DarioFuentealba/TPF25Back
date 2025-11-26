from django.shortcuts import render
from .models import (Categoria,SubCategoria,Cpu, Motherboard, Gabinete, Ram, Disco, Fuente, 
                     Monitor, Mouse, Teclado, Gpu,Cooler, PcEscritorio, Notebook,Paquete_office,
                     Placa_wifi,Sistema_operativo)
from .serializers import (ProductoGenericoSerializer,CategoriaSerializer,CategoriaConSubCategoriaSerializer,
                          SubCategoriaSerializer, CpuSerializer, PlacaMadreSerializer, 
                          GabineteSerializer, RamSerializer, DiscoSerializer, FuenteSerializer, 
                          MonitorSerializer, MouseSerializer, 
                          TecladoSerializer, GPUSerializer,CoolerSerializer,
                          PcEscritorioSerializer,NotebookSerializer, PaqueteOfficeSerializer,
                          SistemaOperativoSerializer,PlacaWifiSerializer)
from rest_framework import viewsets
from rest_framework.decorators import api_view, permission_classes
from rest_framework.response import Response
#from rest_framework.permissions import ProductoPermiso # Solo para hacer las pruebas en test.py
#from .permissions import ProductoPermiso, SoloAdminEditarPermiso
from .mixins import ComprarMixin
from rest_framework.generics import ListAPIView
from rest_framework.permissions import AllowAny
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework import status







# Create your views here.

from rest_framework import viewsets, status
from rest_framework.response import Response

class BaseProductoViewSet(viewsets.ModelViewSet):
    """
    ViewSet base para todos los productos.
    Permite actualizaciones parciales y agrega ComprarMixin si es necesario.
    """

    def update(self, request, *args, **kwargs):
        """
        Sobrescribe el update para permitir actualizaciones parciales por defecto
        """
        print("Request method:", request.method)
        print("Request data:", request.data)
        print("Request files:", request.FILES)

        partial = kwargs.pop('partial', True)  # partial=True por defecto
        instance = self.get_object()
        serializer = self.get_serializer(instance, data=request.data, partial=partial)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)

        print("Errores del serializer:", serializer.errors)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class CategoriaViewSet(viewsets.ModelViewSet):
    queryset = Categoria.objects.all()
    serializer_class = CategoriaSerializer
    permission_classes=[]

class SubCategoriaViewSet(viewsets.ModelViewSet):
    queryset = SubCategoria.objects.all()
    serializer_class = SubCategoriaSerializer
    permission_classes=[]


class CpuViewSet(ComprarMixin,BaseProductoViewSet):
    queryset = Cpu.objects.all()
    serializer_class = CpuSerializer
    permission_classes=[]

    def get_queryset(self):
        queryset = super().get_queryset()
        fabricante = self.request.query_params.get('fabricante')
        print("Filtrando fabricante:", fabricante)  # Esto va a la consola de Django
        if fabricante:
            queryset = queryset.filter(fabricante__iexact=fabricante)  # más flexible
        return queryset

class PlacaMadreViewSet(ComprarMixin,BaseProductoViewSet):
    queryset = Motherboard.objects.all()
    serializer_class = PlacaMadreSerializer

    def get_queryset(self):
        queryset = super().get_queryset()
        cpu_socket = self.request.query_params.get('cpu_socket')  # viene de la CPU seleccionada
        if cpu_socket:
            queryset = queryset.filter(socket_cpu=cpu_socket)
        return queryset

class GabineteViewSet(ComprarMixin,BaseProductoViewSet):
    queryset = Gabinete.objects.all()
    serializer_class = GabineteSerializer
    permission_classes=[]

class RamViewSet(ComprarMixin,BaseProductoViewSet):
    queryset = Ram.objects.all()
    serializer_class = RamSerializer
    permission_classes=[]

class DiscoViewSet(ComprarMixin,BaseProductoViewSet):
    queryset = Disco.objects.all()
    serializer_class = DiscoSerializer
    permission_classes=[]

class FuenteViewSet(ComprarMixin,BaseProductoViewSet):
    queryset = Fuente.objects.all()
    serializer_class = FuenteSerializer
    permission_classes=[]

class MonitorViewSet(ComprarMixin,BaseProductoViewSet):
    queryset = Monitor.objects.all()
    serializer_class = MonitorSerializer
    permission_classes=[]

class MouseViewSet(ComprarMixin,BaseProductoViewSet):
    queryset = Mouse.objects.all()
    serializer_class = MouseSerializer
    permission_classes=[]

class TecladoViewSet(ComprarMixin,BaseProductoViewSet):
    queryset = Teclado.objects.all()
    serializer_class = TecladoSerializer
    permission_classes=[]

class GpuViewSet(ComprarMixin,BaseProductoViewSet):
    queryset = Gpu.objects.all()
    serializer_class = GPUSerializer
    permission_classes=[]

class CoolerViewSet(ComprarMixin,BaseProductoViewSet):
    queryset = Cooler.objects.all()
    serializer_class = CoolerSerializer
    permission_classes=[]

class PcEscritorioViewSet(ComprarMixin,BaseProductoViewSet):
    queryset = PcEscritorio.objects.all()
    serializer_class = PcEscritorioSerializer
    permission_classes=[]

class NotebookViewSet(ComprarMixin,BaseProductoViewSet):
    queryset = Notebook.objects.all()
    serializer_class = NotebookSerializer
    permission_classes=[]
class PaqueteOfficeViewSet(ComprarMixin,BaseProductoViewSet):
    queryset = Paquete_office.objects.all()
    serializer_class = PaqueteOfficeSerializer
    permission_classes=[]
class SistemaOperativoViewSet(ComprarMixin,BaseProductoViewSet):
    queryset = Sistema_operativo.objects.all()
    serializer_class = SistemaOperativoSerializer
    permission_classes=[]
class PlacaWifiViewSet(ComprarMixin,BaseProductoViewSet):
    queryset = Placa_wifi.objects.all()
    serializer_class = PlacaWifiSerializer
    permission_classes=[]


class CategoriaConSubCategoriaListView(ListAPIView):
    queryset = Categoria.objects.all()
    serializer_class=CategoriaConSubCategoriaSerializer
    permission_classes=[]


@api_view(['GET'])
@permission_classes([AllowAny])
def listar_todos_los_productos(request):
    # Obtener todos los objetos de cada modelo hijo
    modelos = [Cpu, Ram, Cooler, Motherboard, Gabinete, Disco, Fuente, Monitor, Mouse, Teclado, Gpu, PcEscritorio, Notebook,Placa_wifi,Paquete_office,Sistema_operativo]
    productos = []

    for modelo in modelos:
        objetos = modelo.objects.all()
        productos.extend(objetos)

    # Serializar todos los productos usando ProductoGenericoSerializer
    serializer = ProductoGenericoSerializer(productos, many=True)
    return Response(serializer.data)

@api_view(['GET'])
@permission_classes([AllowAny])
def productosUsos(request,uso):
    modelos=[PcEscritorio,Notebook]
    productos=[]
    for modelo in modelos:
        obj = modelo.objects.filter(usos__icontains=uso)
        productos.extend(obj)
    
    return Response(ProductoGenericoSerializer(productos,many=True).data)



class SoloAdminView(APIView):
    permission_classes = [IsAuthenticated]

    def get(self, request):
        # Verificar si el usuario es administrador
        if not request.user.is_staff:
            return Response({"error": "No tienes permiso para acceder"}, status=403)
        
        return Response({"mensaje": "Bienvenido administrador"})

