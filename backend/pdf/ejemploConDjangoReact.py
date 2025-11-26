# ESTO VA EN UN ARCHIVO VIEWS
from django.http import HttpResponse
from reportlab.lib.pagesizes import A4
from reportlab.platypus import SimpleDocTemplate, Paragraph, Spacer, Table, TableStyle
from reportlab.lib.styles import getSampleStyleSheet
from reportlab.lib import colors
import io


def generar_pdf(request):
    # Crear un buffer en memoria donde guardar el PDF
    buffer = io.BytesIO()

    # Configurar el documento
    doc = SimpleDocTemplate(buffer, pagesize=A4)
    styles = getSampleStyleSheet()

    # Contenido del PDF
    contenido = []

    # Título
    titulo = Paragraph("Reporte generado con Django + ReportLab", styles["Title"])
    contenido.append(titulo)
    contenido.append(Spacer(1, 12))

    # Texto
    parrafo = Paragraph(
        "Este PDF fue generado dinámicamente desde una vista Django.",
        styles["Normal"]
    )
    contenido.append(parrafo)
    contenido.append(Spacer(1, 20))

    # Tabla de ejemplo
    data = [
        ["Producto", "Precio", "Stock"],
        ["Teclado Logitech", "$12.000", "23"],
        ["Mouse Redragon", "$9.500", "15"],
        ["Monitor Samsung 24''", "$85.000", "8"],
    ]

    tabla = Table(data)
    tabla.setStyle(TableStyle([
        ('BACKGROUND', (0, 0), (-1, 0), colors.HexColor("#1E3A8A")),
        ('TEXTCOLOR', (0, 0), (-1, 0), colors.white),
        ('ALIGN', (0, 0), (-1, -1), 'CENTER'),
        ('GRID', (0, 0), (-1, -1), 0.5, colors.gray),
        ('BACKGROUND', (0, 1), (-1, -1), colors.whitesmoke),
    ]))
    contenido.append(tabla)

    # Construir el PDF
    doc.build(contenido)

    # Preparar la respuesta HTTP
    buffer.seek(0)
    response = HttpResponse(buffer, content_type='application/pdf')
    response['Content-Disposition'] = 'attachment; filename="reporte.pdf"'
    return response


# ESTO VA EN UN ARCHIVO URLS
#from django.urls import path
#from . import views

# urlpatterns = [
#     path('generar-pdf/', views.generar_pdf, name='generar_pdf'),
# ]

# SE PUEDE VER EN 
#http://127.0.0.1:8000/generar-pdf/

# ESTO VA EN EL FRONT CON REACT
# import React from "react";

# export default function GenerarPDF() {
#   const generarPDF = () => {
#     window.open("http://127.0.0.1:8000/generar-pdf/", "_blank");
#   };

#   return (
#     <button onClick={generarPDF} className="btn btn-primary">
#       Generar PDF
#     </button>
#   );
# }
