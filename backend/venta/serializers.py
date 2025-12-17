"""Usamos serializers para convertir instancias de modelos a formatos JSON o XML y viceversa."""
from rest_framework import serializers
from .models import Venta, DetalleVenta
from computacion.serializers import (CpuSerializer, PlacaMadreSerializer, GabineteSerializer, RamSerializer, DiscoSerializer, FuenteSerializer,MonitorSerializer, 
                                     MouseSerializer, TecladoSerializer, GPUSerializer,CoolerSerializer,
                                     PcEscritorioSerializer, NotebookSerializer,PaqueteOfficeSerializer,PlacaWifiSerializer,SistemaOperativoSerializer)
from computacion.models import (Cpu, Motherboard, Gabinete, Ram, Disco, Fuente, Monitor, Mouse, Teclado,
                                 Gpu,Cooler,PcEscritorio, Notebook,Paquete_office,Placa_wifi,Sistema_operativo)

class DetalleVentaSerializer(serializers.HyperlinkedModelSerializer):
    producto_tipo = serializers.CharField(write_only=True)
    producto_id = serializers.IntegerField(write_only=True)
    producto = serializers.SerializerMethodField()
    subtotal = serializers.SerializerMethodField()

    class Meta:
        model = DetalleVenta
        fields = ['id', 'cantidad', 'producto_tipo', 'producto_id', 'producto', 'subtotal', 'venta']

    # Verifica el tipo de producto y obtiene su representación
    def get_producto(self, obj): 
        # Mapeo al serilizer
        serializers_map = {
            Cpu : CpuSerializer,
            Motherboard: PlacaMadreSerializer,
            Gabinete: GabineteSerializer,
            Ram: RamSerializer,
            Disco: DiscoSerializer,
            Fuente: FuenteSerializer,
            Monitor: MonitorSerializer,
            Mouse: MouseSerializer,
            Teclado: TecladoSerializer,
            Gpu: GPUSerializer,
            Cooler: CoolerSerializer,
            PcEscritorio: PcEscritorioSerializer,
            Notebook: NotebookSerializer, 
            Paquete_office: PaqueteOfficeSerializer, 
            Placa_wifi: PlacaWifiSerializer, 
            Sistema_operativo: SistemaOperativoSerializer, 
        }

        # Obtine la clase de cada producto en particular
        producto_class = type(obj.producto)
        serializer_class = serializers_map.get(producto_class)
        if serializer_class:
            return serializer_class(obj.producto).data
        return None
    



class VentaSerializer(serializers.HyperlinkedModelSerializer):
    detallesventa= DetalleVentaSerializer(source='detalles',many=True)
    class Meta:
        model = Venta
        fields = ['id', 'fecha', 'monto', 'cliente','detallesventa']