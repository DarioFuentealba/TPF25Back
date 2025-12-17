from rest_framework import serializers
from .models import Categoria,SubCategoria,Cpu,Placa_wifi,Paquete_office,Sistema_operativo,Motherboard, Gabinete, Ram, Disco, Fuente, Monitor, Mouse, Teclado, Gpu,Cooler, PcEscritorio, Notebook


class CategoriaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Categoria
        fields = '__all__'

class SubCategoriaSerializer(serializers.ModelSerializer):
    class Meta:
        model = SubCategoria
        fields = '__all__'

class CategoriaConSubCategoriaSerializer(serializers.ModelSerializer):
    subcategorias= SubCategoriaSerializer(many=True, read_only=True)
    class Meta:
        model = Categoria
        fields=['id','nombre','subcategorias']

class CpuSerializer(serializers.ModelSerializer):
    class Meta:
        model = Cpu
        fields = '__all__'

class PlacaMadreSerializer(serializers.ModelSerializer):
    class Meta:
        model = Motherboard
        fields = '__all__'

class GabineteSerializer(serializers.ModelSerializer):
    class Meta:
        model = Gabinete
        fields = '__all__'

class RamSerializer(serializers.ModelSerializer):
    class Meta:
        model = Ram
        fields = '__all__'

class DiscoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Disco
        fields = '__all__'

class FuenteSerializer(serializers.ModelSerializer):
    class Meta:
        model = Fuente
        fields = '__all__'


class MonitorSerializer(serializers.ModelSerializer):
    class Meta:
        model = Monitor
        fields = '__all__'

class MouseSerializer(serializers.ModelSerializer):
    class Meta:
        model = Mouse
        fields = '__all__'

class TecladoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Teclado
        fields = '__all__'

class GPUSerializer(serializers.ModelSerializer):
    class Meta:
        model = Gpu
        fields = '__all__'

class CoolerSerializer(serializers.ModelSerializer):
    class Meta:
        model = Cooler
        fields = '__all__'

class PcEscritorioSerializer(serializers.ModelSerializer):
    class Meta:
        model = PcEscritorio
        fields = '__all__'


class NotebookSerializer(serializers.ModelSerializer):
    class Meta:
        model = Notebook
        fields = '__all__'

class PlacaWifiSerializer(serializers.ModelSerializer):
    class Meta:
        model=Placa_wifi
        fields = '__all__'

class SistemaOperativoSerializer(serializers.ModelSerializer):
    class Meta:
        model=Sistema_operativo
        fields = '__all__'

class PaqueteOfficeSerializer(serializers.ModelSerializer):
    class Meta:
        model=Paquete_office
        fields = '__all__'

class ProductoGenericoSerializer(serializers.Serializer):
    id = serializers.IntegerField(read_only=True)
    nombre = serializers.CharField()
    precio = serializers.DecimalField(max_digits=10, decimal_places=2)
    stock = serializers.IntegerField()
    fabricante = serializers.CharField(max_length=200)
    oferta = serializers.BooleanField()
    subcategoria = SubCategoriaSerializer(read_only=True)

    def to_representation(self, instance):
        # Devuelve el serializer específico según la clase del producto
        if isinstance(instance, Cpu):
            return CpuSerializer(instance).data
        elif isinstance(instance, Motherboard):
            return PlacaMadreSerializer(instance).data
        elif isinstance(instance, Ram):
            return RamSerializer(instance).data
        elif isinstance(instance, Gabinete):
            return GabineteSerializer(instance).data
        elif isinstance(instance, Disco):
            return DiscoSerializer(instance).data
        elif isinstance(instance, Fuente):
            return FuenteSerializer(instance).data
        elif isinstance(instance, Monitor):
            return MonitorSerializer(instance).data
        elif isinstance(instance, Mouse):
            return MouseSerializer(instance).data
        elif isinstance(instance, Teclado):
            return TecladoSerializer(instance).data
        elif isinstance(instance, Gpu):
            return GPUSerializer(instance).data
        elif isinstance(instance, Cooler):
            return CoolerSerializer(instance).data
        elif isinstance(instance, PcEscritorio):
            return PcEscritorioSerializer(instance).data
        elif isinstance(instance, Notebook):
            return NotebookSerializer(instance).data
        elif isinstance(instance,Placa_wifi):
            return PlacaWifiSerializer(instance).data
        elif isinstance(instance,Paquete_office):
            return PaqueteOfficeSerializer(instance).data
        elif isinstance(instance,Sistema_operativo):
            return SistemaOperativoSerializer(instance).data
        # Por defecto, devuelve los campos básicos
        return super().to_representation(instance)
