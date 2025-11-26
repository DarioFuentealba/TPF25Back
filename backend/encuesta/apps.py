from django.apps import AppConfig


class EncuestaConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'encuesta'
    verbose_name = 'Gestor de Encuestas' # gestiona las encuestas para realizar las cotizaciones para el usuario
