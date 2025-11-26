from django.db import models
from django.contrib.auth.models import User as Usuario
from computacion.models import Producto
from django.contrib.contenttypes.models import ContentType
from django.contrib.contenttypes.fields import GenericForeignKey

# La tienda realiza varias ventas 
# y cada venta se relaciona con un usuario.
"""Implementacion de herencia con django
    ContentType se utiliza para manejar las relaciones entre una clase padre y sus hijas 
    junto con otros modelos. Por ejemplo en el caso de producto (clase padre) y detalleVenta
    que es una clase sin herencia. 
    GenericForeingKey se utiliza para definir una relación genérica entre dos modelos.
"""
class Venta(models.Model):
    fecha =models.DateTimeField(auto_now_add=True)
    monto = models.DecimalField(max_digits=10, decimal_places=2)
    cliente = models.ForeignKey(Usuario, on_delete=models.CASCADE)


# Detalle Venta es nuestra tabla itermedia entre venta y producto  
# Se usa la clase Generic Foreing Key y ContentType para hacer la relacion entre un modelo 
# y un modelo generico. 
class DetalleVenta(models.Model):
    cantidad = models.IntegerField()
    content_type=models.ForeignKey(ContentType, on_delete=models.CASCADE)
    object_id=models.PositiveIntegerField()
    producto = GenericForeignKey('content_type', 'object_id')
    venta = models.ForeignKey(Venta, related_name='detalles',on_delete=models.CASCADE)


class QrVenta(models.Model):
    imagen = models.FileField(upload_to='qr_ventas/', null=True, blank=True)
    venta = models.ForeignKey(Venta, on_delete=models.CASCADE)