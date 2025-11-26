# computacion/mixins.py
from rest_framework.decorators import action
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated

class ComprarMixin:
    """
    Mixin que agrega la acción 'comprar' a cualquier ViewSet de producto.
    Solo usuarios autenticados pueden comprar.
    """
    @action(detail=True, methods=['post'], permission_classes=[IsAuthenticated])
    def comprar(self, request, pk=None):
        producto = self.get_object()
        
        # Aquí podrías agregar lógica de stock, precio, etc.
        return Response({
            "message": f"Has comprado el producto '{producto.nombre}' (ID: {producto.id})"
        })
