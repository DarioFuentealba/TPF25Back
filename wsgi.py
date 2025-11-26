import os
from django.core.wsgi import get_wsgi_application

# apuntar al settings.py dentro de backend
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "backend.settings")

application = get_wsgi_application()
