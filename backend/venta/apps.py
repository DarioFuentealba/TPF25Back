from django.apps import AppConfig


class VentaConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'venta'
    verbose_name='venta' # gestiona las ventas que hace la tienda