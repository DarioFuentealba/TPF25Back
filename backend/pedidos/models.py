
from django.db import models
from django.contrib.auth.models import User
from proveedor.models import Proveedores

class OrdenPedido(models.Model):
    proveedor = models.ForeignKey(Proveedores, on_delete=models.CASCADE, related_name='ordenes')
    usuario = models.ForeignKey(User, on_delete=models.CASCADE, related_name='ordenes')
    fecha = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"Orden #{self.id} - {self.proveedor.nombre}"




class Pedidos(models.Model):
    nombre=models.CharField(max_length=255)
    cantidad=models.IntegerField()
    caracteristicas=models.CharField(max_length=255)
    proveedor=models.ForeignKey(Proveedores,on_delete=models.CASCADE,related_name='pedidos')
    orden = models.ForeignKey(OrdenPedido,on_delete=models.CASCADE,related_name='productos',null=True,blank=True)


