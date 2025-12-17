from django.db import models
from django.contrib.auth.models import User
from django.contrib.contenttypes.fields import GenericForeignKey
from django.contrib.contenttypes.models import ContentType
from django.dispatch import receiver
from django.db.models.signals import post_save


class UsuarioExtra(models.Model):
    usuario = models.OneToOneField(User, on_delete=models.CASCADE, related_name="extra")
    codigo_postal = models.CharField(max_length=10, null=False, blank=False)
    def __str__(self):
        return f"{self.usuario.username} - {self.codigo_postal}"




class Perfil (models.Model):
    """
    Modelo de perfil del usuario
    """
    EXPERIENCIA=[('principiante','Principiante'),('intermedio','Intermedio'),('experto','Experto')]
    user = models.OneToOneField(User,on_delete=models.CASCADE,related_name='perfil',verbose_name='Usuario')
    biografia = models.TextField(max_length=1000,blank=True,null=True,verbose_name="Biografia")
    avatar = models.ImageField(upload_to='avatar/',blank=True,null=True,verbose_name='Avatar')
    experiencia =  models.CharField(max_length=50,choices=EXPERIENCIA,default='principiante',verbose_name='Nivel de experiencia')

    class Meta:
        verbose_name='Perfil'
        verbose_name_plural = 'Perfiles'


class Interes(models.Model):
    '''
        Modelo para los intereses del usuario
    '''   
    perfil = models.ForeignKey(Perfil,on_delete=models.CASCADE,related_name="interes",verbose_name='Perfil')
    nombre = models.CharField(max_length=50,verbose_name='Interes')
    
    class Meta:
        verbose_name='Interes'
        verbose_name_plural = 'Intereses'
        unique_together = ['perfil','nombre']

class PCEspecificacion():
    """
    Modelo se relaciona con las clases hijas de producto
    """
    perfil = models.OneToOneField(Perfil,on_delete=models.CASCADE,related_name='pc_espc',verbose_name='Perfil')
    cpu = models.ForeignKey('computacion.Cpu',on_delete=models.SET_NULL,blank=True,null=True,
                            verbose_name='cpu',related_name='pc_espec_cpu')
    
    motherboard = models.ForeignKey('computacion.Motherboard',on_delete=models.SET_NULL,blank=True,null=True,
                            verbose_name='motherboard',related_name='pc_espec_motherboard')
    
    ram = models.ForeignKey('computacion.Ram',on_delete=models.SET_NULL,blank=True,null=True,
                            verbose_name='ram',related_name='pc_espec_ram')
    
    gpu = models.ForeignKey('computacion.Gpu',on_delete=models.SET_NULL,blank=True,null=True,
                            verbose_name='gpu',related_name='pc_espec_gpu')
    
    disco = models.ForeignKey('computacion.Disco',on_delete=models.SET_NULL,blank=True,null=True,
                            verbose_name='disco',related_name='pc_espec_disco')
    class Meta:
        verbose_name='Especificacion de PC'
        verbose_name_plural='Especificaciones de PC'    


class FavoritoProducto(models.Model):
    """
    Modelo para productos favoritos del usuario.
    Usa GenericForeignKey para relacionarse con cualquier tipo de producto
    (Cpu, Gpu, Motherboard, Ram, etc.) ya que Producto es abstracto.
    """
    perfil = models.ForeignKey(
        Perfil,
        on_delete=models.CASCADE,
        related_name='favoritos',
        verbose_name='Perfil'
    )
    
    # GenericForeignKey para relacionarse con cualquier modelo hijo de Producto
    content_type = models.ForeignKey(
        ContentType,
        on_delete=models.CASCADE,
        verbose_name='Tipo de producto'
    )
    object_id = models.PositiveIntegerField(
        verbose_name='ID del producto'
    )
    producto = GenericForeignKey('content_type', 'object_id')
    
    added_at = models.DateTimeField(
        auto_now_add=True,
        verbose_name='Fecha de agregado'
    )
    
    class Meta:
        verbose_name = 'Producto Favorito'
        verbose_name_plural = 'Productos Favoritos'
        ordering = ['-added_at']
        # Evita que el mismo producto se agregue dos veces como favorito
        unique_together = ['perfil', 'content_type', 'object_id']
    
    def __str__(self):
        return f'{self.perfil.user.username} - {self.producto.nombre}'
    
    def get_product_name(self):
        """Método auxiliar para obtener el nombre del producto"""
        return self.producto.nombre if self.producto else 'Producto eliminado'
    
    def get_product_price(self):
        """Método auxiliar para obtener el precio del producto"""
        return self.producto.precio if self.producto else None
    
    def get_product_type(self):
        """Método auxiliar para obtener el tipo de producto"""
        return self.content_type.model





