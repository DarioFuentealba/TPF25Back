from django.db import models
from django.contrib.auth.models import User
from django.contrib.contenttypes.models import ContentType
from django.contrib.contenttypes.fields import GenericForeignKey


class LocalidadArgentina(models.Model):
    provincia = models.CharField(max_length=100)
    localidad = models.CharField(max_length=100)
    codigo_postal = models.CharField(max_length=10)
    costo_envio = models.DecimalField(max_digits=8, decimal_places=2)
    latitud = models.DecimalField(max_digits=6, decimal_places=2)
    longitud = models.DecimalField(max_digits=6, decimal_places=2)

    class Meta:
        db_table = 'localidades_argentina'  # usa la tabla que ya existe en tu BD

    def __str__(self):
        return f"{self.localidad} ({self.codigo_postal})"
    

class CarritoItem(models.Model):
    usuario = models.ForeignKey(User, on_delete=models.CASCADE, related_name="carrito_items")

    # Campos del sistema genérico
    content_type = models.ForeignKey(ContentType, on_delete=models.CASCADE)  # qué tipo de modelo
    object_id = models.PositiveIntegerField()                                # id del producto
    producto = GenericForeignKey('content_type', 'object_id')                # objeto real

    cantidad = models.PositiveIntegerField(default=1)

    class Meta:
        verbose_name = "Item del Carrito"
        verbose_name_plural = "Items del Carrito"
        unique_together = ("usuario", "content_type", "object_id")

    def __str__(self):
        return f"{self.usuario.username} - {self.producto} x{self.cantidad}"
