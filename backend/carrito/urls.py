
from django.urls import path
from .views import CarritoView, CarritoItemUpdateView, CarritoItemDeleteView,generar_pdf,finalizar_compra

urlpatterns = [
    path('', CarritoView.as_view(), name='ver_carrito'),
    path('agregar/', CarritoView.as_view(), name='agregar_carrito'),
    path('<int:pk>/update/', CarritoItemUpdateView.as_view(), name='actualizar_item'),
    path('<int:id>/remove/', CarritoItemDeleteView.as_view(), name='eliminar_item'),
    path('pdf/', generar_pdf, name='pdf'),
    path('finalizar/', finalizar_compra, name='finalizar_compra'),
]


