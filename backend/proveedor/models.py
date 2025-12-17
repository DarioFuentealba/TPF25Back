from django.db import models

# Create your models here.
class Proveedores(models.Model):
    nombre=models.CharField(max_length=100,verbose_name="proveedor")
    contacto=models.CharField(max_length=100, verbose_name="contacto")
    telefono=models.CharField(max_length=100, verbose_name="telefono")
    email=models.EmailField(max_length=254,verbose_name="email")
    cuit=models.CharField(max_length=150, verbose_name="Cuit")
    activo=models.BooleanField(verbose_name="Activo",default=False)
    categoria=models.CharField(max_length=50,verbose_name="Categoria")
