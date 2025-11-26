from django.db import models
from django.contrib.auth.models import User as Usuario


# Modelos para guardar las encuestas realizadas por los usuarios.
class Resultado(models.Model):
    puntaje=models.IntegerField()
    comentario=models.TextField()
class Encuesta(models.Model):
    usuario=models.ForeignKey(Usuario,on_delete=models.CASCADE,null=False)
    fecha=models.DateField(auto_now_add=True)
    resultado =models.ForeignKey(Resultado, on_delete=models.CASCADE, null=False)
