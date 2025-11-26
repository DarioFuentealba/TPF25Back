from django.urls import include, path
from rest_framework.routers import DefaultRouter
from .views import ProveedorViewSet
# GENERA URL DE MANERA AUTOMATICA PARA EL CRUD

router = DefaultRouter()
router.register(r'proveedor',ProveedorViewSet,basename="Proveedores")


urlpatterns = [
    path('',include(router.urls))
]
