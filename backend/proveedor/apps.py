from django.apps import AppConfig


class ProveedorConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'proveedor'
    verbose_name = 'Gestión de Proveedores'# gestiona la compra del duenio de la tienda para reponer stock
