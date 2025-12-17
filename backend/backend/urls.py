from django.contrib import admin
from django.urls import path, include
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('admin/', admin.site.urls),
    path("api/usuario/", include("usuario.urls")),   # <- monta la API de usuarios
    path("api/computacion/", include("computacion.urls")),   # <- monta la API de computacion
    path("api/venta/", include("venta.urls")),   # <- monta la API de ventas
    path('api/carrito/', include('carrito.urls')), #Lo del carrito
    path("api/",include('proveedor.urls')),
    path("api/envios/",include('envios.urls')),
    path("api/pedidos/",include('pedidos.urls')),
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

