from django.shortcuts import render

# Create your views here.
from rest_framework import viewsets, status
from rest_framework.decorators import action
from rest_framework.response import Response
from django.conf import settings
import mercadopago
from .models import Order
from .serializers import OrderSerializer

class OrderViewSet(viewsets.ModelViewSet):
    queryset = Order.objects.all()
    serializer_class = OrderSerializer

    @action(detail=True, methods=['post'])
    def create_preference(self, request, pk=None):
        """Crea una preferencia de pago en Mercado Pago"""
        order = self.get_object()
        
        try:
            # Inicializar SDK de Mercado Pago
            sdk = mercadopago.SDK(settings.MERCADOPAGO_ACCESS_TOKEN)
            
            # Crear preferencia
            preference_data = {
                "items": [
                    {
                        "title": order.title,
                        "description": order.description,
                        "quantity": 1,
                        "currency_id": "ARS",
                        "unit_price": float(order.amount)
                    }
                ],
                "back_urls": {
                    "success": f"{settings.FRONTEND_URL}/payment/success",
                    "failure": f"{settings.FRONTEND_URL}/payment/failure",
                    "pending": f"{settings.FRONTEND_URL}/payment/pending"
                },
                "auto_return": "approved",
                "external_reference": str(order.id),
                "notification_url": f"{settings.BACKEND_URL}/api/payments/webhook/"
            }
            
            preference_response = sdk.preference().create(preference_data)
            preference = preference_response["response"]
            
            # Guardar preference_id
            order.preference_id = preference["id"]
            order.save()
            
            return Response({
                "preference_id": preference["id"],
                "init_point": preference["init_point"],
                "sandbox_init_point": preference["sandbox_init_point"],
            })
        
        except Exception as e:
            return Response(
                {"error": str(e)}, 
                status=status.HTTP_500_INTERNAL_SERVER_ERROR
            )

    @action(detail=False, methods=['post'], url_path='webhook')
    def webhook(self, request):
        """Webhook para recibir notificaciones de Mercado Pago"""
        
        try:
            # Mercado Pago envía el tipo de notificación
            topic = request.query_params.get('topic') or request.data.get('type')
            
            if topic == 'payment':
                payment_id = request.query_params.get('id') or request.data.get('data', {}).get('id')
                
                # Obtener información del pago
                sdk = mercadopago.SDK(settings.MERCADOPAGO_ACCESS_TOKEN)
                payment_info = sdk.payment().get(payment_id)
                
                if payment_info["status"] == 200:
                    payment = payment_info["response"]
                    external_reference = payment.get("external_reference")
                    
                    if external_reference:
                        try:
                            order = Order.objects.get(id=external_reference)
                            order.payment_id = str(payment_id)
                            order.status = payment["status"]
                            order.save()
                        except Order.DoesNotExist:
                            pass
            
            return Response({"status": "ok"}, status=status.HTTP_200_OK)
        
        except Exception as e:
            return Response(
                {"error": str(e)}, 
                status=status.HTTP_500_INTERNAL_SERVER_ERROR
            )