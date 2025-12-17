#from django.shortcuts import render

#from rest_framework.decorators import api_view
#from rest_framework.response import Response

#@api_view(['GET'])
#def hello(request):
#    return Response({"message": "Hola desde Django!"})


# Armar tu PC empieza aca

from rest_framework import generics
from .models import Marca, Procesador, Motherboard, CompatibilidadMicro, Cooler, CompatibilidadCooler
from .serializers import MarcaSerializer, ProcesadorSerializer, MotherboardSerializer, CoolerSerializer

class MarcaList(generics.ListAPIView):
    queryset = Marca.objects.all()
    serializer_class = MarcaSerializer

class ProcesadorByMarca(generics.ListAPIView):
    serializer_class = ProcesadorSerializer
    def get_queryset(self):
        marca_id = self.request.query_params.get("marca")
        return Procesador.objects.filter(marca_id=marca_id)

class MotherboardByMicro(generics.ListAPIView):
    serializer_class = MotherboardSerializer
    def get_queryset(self):
        micro_id = self.request.query_params.get("micro")
        return Motherboard.objects.filter(
            id__in=CompatibilidadMicro.objects.filter(micro_id=micro_id).values("mother_id")
        )

# Ejemplo: después de elegir mother, filtrar coolers compatibles
class CoolersByMother(generics.ListAPIView):
    serializer_class = CoolerSerializer
    def get_queryset(self):
        mother_id = self.request.query_params.get("mother")
        return Cooler.objects.filter(
            id__in=CompatibilidadCooler.objects.filter(mother_id=mother_id).values("cooler_id")
        )

# Armar tu PC termina aca
