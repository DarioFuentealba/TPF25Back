from django.urls import include, path
from rest_framework.routers import DefaultRouter
from .views import VentaViewSet
from .views import generar_pdf
# URLs generadas automaticamente usando Routers y ViewSets

router = DefaultRouter()
router.register(r'venta', VentaViewSet)


# Seccion para el manejo de URLs manuales. Para casos de uso especial como autenticacion
# y permisos. 


# Urls necesarias para el enrutamiento de las vistas
urlpatterns=[
    path('', include(router.urls)),
    path('reporte/',generar_pdf,name="Reporte PDF"),
]