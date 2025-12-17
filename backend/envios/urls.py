from django.urls import path
from .views import CalcularEnvioView

urlpatterns = [
    path('<int:producto_id>/', CalcularEnvioView.as_view(), name='calcular_envio'),
]
