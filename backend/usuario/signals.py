from django.db.models.signals import post_migrate
from django.contrib.auth.models import Group
from django.dispatch import receiver
from .models import Perfil
from django.contrib.auth.models import User
from django.db.models.signals import post_save  

@receiver(post_migrate)
def crear_grupos_base(sender, **kwargs):
    # Lista de grupos base
    grupos = ["administrador", "cliente", "empleado"]

    for nombre in grupos:
        Group.objects.get_or_create(name=nombre)


# Señales para crear automáticamente el perfil cuando se crea un usuario
@receiver(post_save, sender=User)
def create_user_profile(sender, instance, created, **kwargs):
    """
    Crea automáticamente un perfil cuando se crea un nuevo usuario
    """
    if created:
        Perfil.objects.create(user=instance)


# @receiver(post_save, sender=User)
# def save_user_profile(sender, instance, **kwargs):
#     """
#     Guarda el perfil cuando se guarda el usuario
#     """
#     if created:
#         Perfil.objects.create(usuario=instance)


