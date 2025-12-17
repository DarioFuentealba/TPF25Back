from rest_framework import serializers
from .models import OrdenPedido, Pedidos

class PedidosSerializer(serializers.ModelSerializer):
    class Meta:
        model = Pedidos
        fields = '__all__'

class OrdenPedidoSerializer(serializers.ModelSerializer):
    productos = PedidosSerializer(many=True, read_only=True)

    class Meta:
        model = OrdenPedido
        fields = ['id', 'proveedor', 'usuario', 'fecha', 'productos']
        read_only_fields = ['usuario', 'fecha']
