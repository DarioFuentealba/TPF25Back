from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import UsuarioViewSet, ProfileViewSet,usuario_actual,CustomTokenObtainPairView, obtener_costo_envio
from rest_framework_simplejwt.views import(
    TokenRefreshView,
)

# URLs generadas automaticamente usando Routers y ViewSets

router = DefaultRouter()
router.register(r'usuarios', UsuarioViewSet,basename="usuario")
router.register(r'perfil', ProfileViewSet,basename="perfil")
# router.register(r'roles', RolViewSet,basename="rol")
# router.register(r'menus', MenuViewSet,basename="menu")

# Seccion para el manejo de URLs manuales. Para casos de uso especial como autenticacion
# y permisos. 


# Urls necesarias para el enrutamiento de las vistas
urlpatterns=[
    path('', include(router.urls)),
    path('login/',CustomTokenObtainPairView.as_view(),name='token_obtain_pair'),
    path('adm/',usuario_actual,name='admin_user'),
    path('token/refresh/',TokenRefreshView.as_view(),name='token_refresh'),
    path('costo-envio/',obtener_costo_envio, name='obtener_costo_envio'),
]
