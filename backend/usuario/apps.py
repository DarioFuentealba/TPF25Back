from django.apps import AppConfig


class UsuarioConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'usuario'
    verbose_name = 'Gestión de Usuarios'# gestiona las actividades del usuario,como 
    # alta, baja , actualizacion de perfil y autenticacion. 
    def ready(self):
        import usuario.signals
