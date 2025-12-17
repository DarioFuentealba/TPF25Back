from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated
from .models import CarritoItem
from computacion.models import Producto
from .serializers import CarritoItemSerializer
from rest_framework import status

class CarritoView(APIView):
    permission_classes = [IsAuthenticated]

    # GET /api/carrito/
    def get(self, request):
        items = CarritoItem.objects.filter(usuario=request.user)
        serializer = CarritoItemSerializer(items, many=True)
        return Response({"items": serializer.data})

    # POST /api/carrito/
    def post(self, request):
        producto_id = request.data.get("producto_id")
        cantidad = request.data.get("cantidad", 1)
        try:
            producto = Producto.objects.get(id=producto_id)
        except Producto.DoesNotExist:
            return Response({"error": "Producto no encontrado"}, status=status.HTTP_404_NOT_FOUND)
        
        item, creado = CarritoItem.objects.get_or_create(usuario=request.user, producto=producto)
        if not creado:
            item.cantidad += int(cantidad)
            item.save()
        serializer = CarritoItemSerializer(item)
        return Response(serializer.data, status=status.HTTP_201_CREATED)

class CarritoItemUpdateView(APIView):
    permission_classes = [IsAuthenticated]

    # PATCH /api/carrito/{id}/update/
    def patch(self, request, id):
        cantidad = request.data.get("cantidad")
        item = CarritoItem.objects.get(id=id, usuario=request.user)
        item.cantidad = cantidad
        item.save()
        return Response({"message": "Cantidad actualizada"})

class CarritoItemDeleteView(APIView):
    permission_classes = [IsAuthenticated]

    # DELETE /api/carrito/{id}/remove/
    def delete(self, request, id):
        item = CarritoItem.objects.get(id=id, usuario=request.user)
        item.delete()
        return Response({"message": "Producto eliminado"})
