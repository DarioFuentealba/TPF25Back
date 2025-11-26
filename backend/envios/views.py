import requests
import math
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from django.contrib.auth.models import User
from usuario.models import UsuarioExtra
from carrito.models import LocalidadArgentina
from rest_framework.permissions import IsAuthenticated

# 📍 Coordenadas fijas de tu local (Neuquén)
LOCAL_LAT = -38.9516
LOCAL_LON = -68.0591


def obtener_coordenadas(codigo_postal):
    """Usa Zipopotamus para obtener lat/lon desde un código postal argentino"""
    url = f"https://api.zippopotam.us/ar/{codigo_postal}"
    try:
        res = requests.get(url, timeout=5)
        if res.status_code == 200:
            data = res.json()
            place = data["places"][0]
            lat = place.get("latitude")
            lon=place.get("longitude")

            # VERIFICACION PARA SABER SI ESXISTE O NO LATITUD Y LONGITUD
            if not lat or not lon:
                print("Error:Coordenadas vacias para codigo postal", codigo_postal)
                return None,None
            
            return float(place["latitude"]), float(place["longitude"])
        
    except Exception as e:
        print("Error obteniendo coordenadas:", e)
    return None, None


def haversine(lat1, lon1, lat2, lon2):
    """Distancia entre dos coordenadas en km"""
    R = 6371  # radio de la Tierra
    phi1, phi2 = math.radians(lat1), math.radians(lat2)
    dphi = math.radians(lat2 - lat1)
    dlambda = math.radians(lon2 - lon1)

    a = math.sin(dphi / 2) ** 2 + math.cos(phi1) * math.cos(phi2) * math.sin(dlambda / 2) ** 2
    c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a))

    return R * c


class CalcularEnvioView(APIView):
    permission_classes = [IsAuthenticated]
    def get(self, request, producto_id):
        user = request.user
        # OBTENER EL CODIGO POSTAL DEL USUARIO 
        try:
            usuario_extra = UsuarioExtra.objects.get(usuario=user)
            codigo_postal = usuario_extra.codigo_postal
        except UsuarioExtra.DoesNotExist:
            return Response({"error": "Usuario sin código postal"}, status=status.HTTP_400_BAD_REQUEST)

        # Coordenadas del cliente
        lat_cli, lon_cli = obtener_coordenadas(codigo_postal)
        if not lat_cli:
            return Response({"error": "Código postal inválido"}, status=status.HTTP_400_BAD_REQUEST)

        try:
            localidad=LocalidadArgentina.objects.get(codigo_postal=codigo_postal)
        except LocalidadArgentina.DoesNotExist:
            return Response({"error":f"No se encontro el costo de envio para CP {codigo_postal}"})

        # Calculamos la distancia
        distancia_km = haversine(LOCAL_LAT, LOCAL_LON, lat_cli, lon_cli)

        # Costo simple: $100 + $5/km, máximo $10000
        # costo_envio = min(100 + distancia_km * 5, 10000)
        # return Response({
        #     "distancia_km": round(distancia_km, 2),
        #     "costo_envio": round(costo_envio, 2)
        # })
        return Response({
            "provincia":localidad.provincia,
            "localidad":localidad.localidad,
            "codigo_postal":localidad.codigo_postal,
            "costo_envio":float(localidad.costo_envio),
            "latitud":float(localidad.latitud),
            "longitud":float(localidad.longitud)
        })