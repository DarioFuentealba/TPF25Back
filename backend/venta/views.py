from django.shortcuts import render
from django.http import HttpResponse
from rest_framework import viewsets
from .serializers import VentaSerializer, DetalleVentaSerializer
from .models import Venta, DetalleVenta
from io import BytesIO
from django.http import FileResponse
from reportlab.lib import colors
from reportlab.lib.pagesizes import A4, landscape
from reportlab.lib.styles import getSampleStyleSheet, ParagraphStyle
from reportlab.platypus import SimpleDocTemplate, Paragraph, Spacer, Image, Table, TableStyle
from rest_framework.decorators import api_view,permission_classes
import os
#from django.contrib.auth.models import User
from rest_framework.permissions import IsAuthenticated
from reportlab.graphics.barcode import qr
from reportlab.graphics.shapes import Drawing


# Create your views here.

class VentaViewSet(viewsets.ModelViewSet):
    serializer_class = VentaSerializer
    queryset = Venta.objects.all()

"""
Genera el pdf con los productos que compra el usuario, con un qr para pagar
@param request
"""
@api_view(['GET'])
@permission_classes([IsAuthenticated])
def generar_pdf(request):
    
    user = request.user
    user_id=user.id
    username= user.username

    #RUTA PERSONALIZADA A ALGUN LADO :)
    user_url = f"https://"

    # Buffer de memoria
    buffer = BytesIO()

    # CONFIGURACION DEL DOCUMENTO
    doc = SimpleDocTemplate(
        buffer,
        pagesize=landscape(A4),
        rightMargin=40,
        leftMargin=40,
        topMargin=60,
        bottomMargin=40
    )
    # DEFINICION DE ESTILOS 
    styles=getSampleStyleSheet()
    estilo_titulo=ParagraphStyle(
        "Titulo",
        fontSize=20,
        alignment=1,
        textColor=colors.HexColor("#1E3A8A"),
        spaceAfter=20
    )

    contenido = []

    # TITULO
    contenido.append(Paragraph("Productos comprados: ",estilo_titulo))
    contenido.append(Spacer(1,20))

    # LOGO DE LA PAGINA
    BASE_DIR=os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    ruta_imagen = os.path.join(BASE_DIR,"Media","Logo_verde_fondo_oscuro_Footer.png")

    if os.path.exists(ruta_imagen):
        imagen = Image(ruta_imagen,width=100,height=100)
        imagen.hAlig = "CENTER"
        contenido.append(imagen)
        contenido.append(Spacer(1,20))
    
    # TEXTO DESCRIPTIVO 
    contenido.append(Paragraph(f"Reporte de Compra para el usuario {username}.", styles['Normal']))
    contenido.append(Spacer(1,10))

    # URL PERSONALIZADA 
    contenido.append(Paragraph(f"Enlace personal: <a href='{user_url}'>{user_url}</a>",styles["Normal"]))
    contenido.append(Spacer(1,30))


    # OBTENCION DE LOS DATOS DE LOS PRODUCTOS COMPRADOS POR EL USUARIO
    # [producto,precio,cantidad]
    data = [
        ["Producto", "Precio", "Stock", "Categoría"],
        ["Teclado Logitech", "$12.000", "23", "Periféricos"],
        ["Mouse Redragon", "$9.500", "15", "Periféricos"],
        ["Monitor Samsung 24''", "$85.000", "8", "Pantallas"],
        ["Notebook HP 15", "$390.000", "5", "Portátiles"],
        ]
    
    tabla = Table(data,colWidths=[150,100,80,120])
    tabla.setStyle([
        ('BACKGROUND',(0,0),(-1,0),colors.HexColor('#1E3A8A')),
        ('TEXCOLOR',(0,0),(-1,0),colors.white),
        ('ALIGN',(0,0),(-1,-1),'CENTER'),
        ('FONTNAME',(0,0),(-1,0),'Helvetica-Bold'),
        ('BOTTOMPADDING',(0,0),(-1,0),10),
        ('GRID',(0,0),(-1,-1),0.5,colors.gray)
    ])

    contenido.append(tabla)
    contenido.append(Spacer(1,30))

    #GENERA EL PDF
    # === GENERAR CÓDIGO QR ===
    qr_data = f"https://tu-sitio.com/pagar/{user_id}"  # o cualquier link de pago
    qr_code = qr.QrCodeWidget(qr_data)
    bounds = qr_code.getBounds()
    width = bounds[2] - bounds[0]
    height = bounds[3] - bounds[1]

    d = Drawing(100, 100, transform=[100. / width, 0, 0, 100. / height, 0, 0])
    d.add(qr_code)

    contenido.append(Paragraph("Escaneá este QR para pagar:", styles['Normal']))
    contenido.append(Spacer(1, 10))
    contenido.append(d)


    doc.build(contenido)
    buffer.seek(0)
    response = HttpResponse(buffer, content_type='application/pdf')
    response['Content-Disposition'] = 'inline; filename="compra.pdf"'
    return response
