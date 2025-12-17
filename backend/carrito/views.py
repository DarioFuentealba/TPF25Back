from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated
from rest_framework import status, generics
from .models import CarritoItem, LocalidadArgentina
from .serializers import CarritoItemSerializer
from computacion.models import Notebook, Gpu, Fuente, Cooler, Motherboard, Disco, Ram, PcEscritorio
from django.http import HttpResponse
from io import BytesIO
from reportlab.lib import colors
from reportlab.lib.pagesizes import A4, landscape
from reportlab.lib.styles import getSampleStyleSheet, ParagraphStyle
from reportlab.platypus import SimpleDocTemplate, Paragraph, Spacer, Image, Table, TableStyle
from rest_framework.decorators import api_view, permission_classes
from reportlab.graphics.barcode import qr
from reportlab.graphics.shapes import Drawing
from django.contrib.contenttypes.models import ContentType
import os
from django.db import transaction
from usuario.models import UsuarioExtra
from decimal import Decimal
from pagos.models import Order
import mercadopago
from django.conf import settings
import json
import datetime


# ======== ACTUALIZAR ITEM ========
class CarritoItemUpdateView(generics.UpdateAPIView):
    queryset = CarritoItem.objects.all()
    serializer_class = CarritoItemSerializer


# ======== ELIMINAR ITEM ========
class CarritoItemDeleteView(APIView):
    permission_classes = [IsAuthenticated]

    def delete(self, request, id):
        try:
            item = CarritoItem.objects.get(id=id, usuario=request.user)
            item.delete()
            return Response({"message": "Producto eliminado"})
        except CarritoItem.DoesNotExist:
            return Response({"error": "Producto no encontrado"}, status=status.HTTP_404_NOT_FOUND)


# ======== CARRITO ========

# class CarritoView(APIView):
#     permission_classes = [IsAuthenticated]

#     def get(self, request):
#         """Listar items del carrito del usuario autenticado"""
#         items = CarritoItem.objects.filter(usuario=request.user)
#         serializer = CarritoItemSerializer(items, many=True)
#         return Response({"items": serializer.data})

#     def post(self, request):
#         modelo = request.data.get("modelo", "").lower()
#         producto_id = request.data.get("producto_id")
#         cantidad = int(request.data.get("cantidad", 1))

#         if not modelo or not producto_id:
#             return Response({"error": "Debe enviar modelo y producto_id"}, status=400)

#         # Busca el ContentType correspondiente
#         try:
#             content_type = ContentType.objects.get(model=modelo)
#         except ContentType.DoesNotExist:
#             return Response({"error": f"Modelo '{modelo}' no encontrado."}, status=400)

#         item, creado = CarritoItem.objects.get_or_create(
#             usuario=request.user,
#             content_type=content_type,
#             object_id=producto_id,
#             defaults={"cantidad": cantidad}
#         )

#         if not creado:
#             item.cantidad += cantidad
#             item.save()

#         serializer = CarritoItemSerializer(CarritoItem.objects.filter(usuario=request.user), many=True)
#         return Response({"items": serializer.data}, status=201)

class CarritoView(APIView):
    permission_classes = [IsAuthenticated]

    def get(self, request):
        """Listar items del carrito del usuario autenticado"""
        items = CarritoItem.objects.filter(usuario=request.user)
        serializer = CarritoItemSerializer(items, many=True)
        return Response({"items": serializer.data})

    def post(self, request):
        # Diccionario que mapea los nombres del frontend a los modelos Django
        MODELOS_MAP = {
            "cpu": "cpu",
            "placamadre": "motherboard",
            "cooler": "cooler",
            "ram": "ram",
            "disco": "disco",
            "gpu": "gpu",
            "placa_wifi": "placa_wifi",
            "gabinete": "gabinete",
            "monitor": "monitor",
            "mouse": "mouse",
            "teclado": "teclado",
            "fuente": "fuente",
            "sistema_operativo": "sistema_operativo",
            "paquete_office": "paquete_office",
            "notebook": "notebook",
            "pc_escritorio": "pcescritorio",
        }

        modelo_input = request.data.get("modelo", "").strip().lower().replace(" ", "_")

        producto_id = request.data.get("producto_id")
        cantidad = int(request.data.get("cantidad", 1))

        if not modelo_input or not producto_id:
            return Response({"error": "Debe enviar modelo y producto_id"}, status=400)

        modelo_real = MODELOS_MAP.get(modelo_input)
        if not modelo_real:
            return Response({"error": f"Modelo '{modelo_input}' no reconocido"}, status=400)

        try:
            content_type = ContentType.objects.get(model=modelo_real)
        except ContentType.DoesNotExist:
            return Response({"error": f"Modelo '{modelo_real}' no encontrado"}, status=400)

        # Crear o actualizar item en el carrito
        item, creado = CarritoItem.objects.get_or_create(
            usuario=request.user,
            content_type=content_type,
            object_id=producto_id,
            defaults={"cantidad": cantidad}
        )

        if not creado:
            item.cantidad += cantidad
            item.save()

        serializer = CarritoItemSerializer(CarritoItem.objects.filter(usuario=request.user), many=True)
        return Response({"items": serializer.data}, status=201)


# ======== GENERAR PDF CON QR ========
@api_view(['GET'])
@permission_classes([IsAuthenticated])
def generar_pdf(request):
    user = request.user
    username = user.username

    buffer = BytesIO()
    doc = SimpleDocTemplate(buffer, pagesize=landscape(A4),
                            rightMargin=40, leftMargin=40, topMargin=60, bottomMargin=40)

    styles = getSampleStyleSheet()
    estilo_titulo = ParagraphStyle("Titulo", fontSize=20, alignment=1, textColor="#1E3A8A", spaceAfter=20)
    estilo_celda = ParagraphStyle("Celda", fontSize=10, alignment=1, leading=12)

    contenido = []
    contenido.append(Paragraph("Productos en tu carrito", estilo_titulo))
    contenido.append(Spacer(1, 20))

    # Logo
    BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    ruta_imagen = os.path.join(BASE_DIR, "media", "Logo_verde_fondo_oscuro_Footer.png")
    if os.path.exists(ruta_imagen):
        imagen = Image(ruta_imagen, width=100, height=100)
        imagen.hAlign = "CENTER"
        contenido.append(imagen)
        contenido.append(Spacer(1, 20))
    fecha = datetime.datetime.now().strftime("%d/%m/%Y %H:%M:%S")
    contenido.append(Paragraph(f"Fecha : {fecha}", styles["Normal"]))
    contenido.append(Paragraph(f"Reporte de carrito del usuario: {username}", styles["Normal"]))
    contenido.append(Spacer(1, 20))

    # Datos del carrito
    carrito_items = CarritoItem.objects.filter(usuario=user)
    data = [["Nombre", "Precio", "Cantidad", "Subtotal"]]
    total = 0
    for item in carrito_items:
        producto = item.producto
        if not producto:
            continue
        nombre = getattr(producto, "nombre", "Sin nombre")
        precio = getattr(producto, "precio", 0)
        cantidad = item.cantidad
        subtotal = precio * cantidad
        total += subtotal
        data.append([Paragraph(nombre, estilo_celda), f"${precio:.2f}", str(cantidad), f"${subtotal:.2f}"])

    if not carrito_items.exists():
        data.append(["(Sin productos en el carrito)", "", "", ""])
    data.append(["", "", "Total:", f"${total:.2f}"])

    tabla = Table(data, colWidths=[250, 100, 80, 100])
    tabla.setStyle([
        ('BACKGROUND', (0, 0), (-1, 0), "#1E3A8A"),
        ('TEXTCOLOR', (0, 0), (-1, 0), "#FFFFFF"),
        ('ALIGN', (0, 0), (-1, -1), 'CENTER'),
        ('GRID', (0, 0), (-1, -1), 0.5, "#CCCCCC"),
        ('FONTNAME', (-2, -1), (-1, -1), 'Helvetica-Bold')
    ])
    contenido.append(tabla)
    contenido.append(Spacer(1, 30))

    # Envío
    try:
        usuario_extra = UsuarioExtra.objects.get(usuario=user)
        codigo_postal = usuario_extra.codigo_postal
        localidad = LocalidadArgentina.objects.get(codigo_postal=str(codigo_postal))
        costo_envio = localidad.costo_envio
        nombre_localidad = localidad.localidad
    except Exception:
        costo_envio = 0
        nombre_localidad = "(Sin Localidad Registrada)"

    total_general = total + Decimal(costo_envio)
    contenido.append(Paragraph(f"Localidad: {nombre_localidad}", styles["Normal"]))
    contenido.append(Paragraph(f"Costo de Envio: ${costo_envio:.2f}", styles["Normal"]))
    contenido.append(Paragraph(f"TOTAL GENERAL: ${total_general:.2f}", estilo_celda))
    contenido.append(Spacer(1, 30))

    # Crear orden
    order = Order.objects.create(
        user=user,
        title=f"Compra de {username}",
        description=f"Total general del carrito (incluyendo envio a {nombre_localidad})",
        amount=total_general
    )

    # SDK Mercado Pago
    sdk = mercadopago.SDK(settings.MERCADOPAGO_ACCESS_TOKEN)

    preference_data = {
        "items": [
            {"title": order.title, "description": order.description, "quantity": 1, "currency_id": "ARS", "unit_price": float(order.amount)}
        ],
        "back_urls": {
            "success": f"{settings.FRONTEND_URL}/pagos/success",
            "failure": f"{settings.FRONTEND_URL}/pagos/failure",
            "pending": f"{settings.FRONTEND_URL}/pagos/pending"
        },
        "auto_return": "approved",
        "external_reference": str(order.id),
        "notification_url": f"{settings.BACKEND_URL}/api/pagos/webhook/"
    }

    try:
        preference = sdk.preference().create(preference_data)
        print("🟩 Respuesta Mercado Pago:")
        print(json.dumps(preference, indent=4, ensure_ascii=False))

        # Guardar id de la preferencia
        order.preference_id = preference["response"]["id"]
        order.save()

    except Exception as e:
        print("❌ Error Mercado Pago:", str(e))
        return Response({"error": str(e)}, status=500)

    # Generar QR
    qr_url = preference["response"].get("sandbox_init_point", preference["response"].get("init_point"))
    qr_code = qr.QrCodeWidget(qr_url)
    bounds = qr_code.getBounds()
    width, height = bounds[2] - bounds[0], bounds[3] - bounds[1]
    d = Drawing(100, 100, transform=[100./width, 0, 0, 100./height, 0, 0])
    d.add(qr_code)

    contenido.append(Paragraph("Escaneá este QR para pagar:", styles["Normal"]))
    contenido.append(Spacer(1, 10))
    contenido.append(d)

    # Crear PDF
    doc.build(contenido)
    buffer.seek(0)
    response = HttpResponse(buffer, content_type='application/pdf')
    response['Content-Disposition'] = f'inline; filename="carrito_{username}.pdf"'
    return response



# FINALIZAR COMPRA 
@api_view(['POST'])
@permission_classes([IsAuthenticated])
def finalizar_compra(request):
    user = request.user
    carrito_items = CarritoItem.objects.filter(usuario=user)

    if not carrito_items.exists():
        return Response({"error": "No hay productos en el carrito"}, status=400)

    with transaction.atomic():
        for item in carrito_items:
            producto = item.producto  # objeto genérico (CPU, Notebook, etc.)
            if producto is None:
                continue

            # Reducir stock si existe
            if hasattr(producto, "stock"):
                if producto.stock >= item.cantidad:
                    producto.stock -= item.cantidad
                    producto.save()
                else:
                    return Response({
                        "error": f"No hay suficiente stock de {getattr(producto, 'nombre', 'Producto')}"
                    }, status=400)

        # Una vez actualizados los stocks, vaciamos el carrito
        carrito_items.delete()

    return Response({"message": "Compra finalizada correctamente"})

@api_view(["DELETE"])
@permission_classes([IsAuthenticated])
def vaciar_carrito(request):
    CarritoItem.objects.filter(usuario=request.user).delete()
    return Response({"message": "Carrito vaciado"}, status=200)
