from reportlab.lib import colors
from reportlab.lib.pagesizes import A4, landscape
from reportlab.platypus import SimpleDocTemplate, Paragraph, Spacer, Image, Table, TableStyle
from reportlab.lib.styles import getSampleStyleSheet, ParagraphStyle
from reportlab.pdfgen import canvas


# ---------------------------
# FUNCIONES AUXILIARES
# ---------------------------

def encabezado_y_pie(canvas, doc):
    """
    Dibuja el encabezado y el pie de página en cada página del PDF.
    """
    canvas.saveState() # para no afectar a los elementos del encabezado
    width, height = A4

    # Encabezado
    canvas.setFont("Helvetica-Bold", 10)
    canvas.drawString(40, height - 40, "PowerTech - Reporte generado con ReportLab")

    # Pie de página
    canvas.setFont("Helvetica", 9)
    canvas.drawString(270, 20, f"Página {doc.page}")

    canvas.restoreState()


# ---------------------------
# CONFIGURACIÓN DEL DOCUMENTO
# ---------------------------

# Creación del documento PDF
doc = SimpleDocTemplate(
    "reporte_completo.pdf",
    pagesize=landscape(A4),  # PDF apaisado
    rightMargin=40,
    leftMargin=40,
    topMargin=60,
    bottomMargin=40
)

# Obtener estilos base
styles = getSampleStyleSheet()

# Crear algunos estilos personalizados
estilo_titulo = ParagraphStyle(
    "TituloPrincipal",
    parent=styles["Title"],
    fontSize=24,
    textColor=colors.HexColor("#1E3A8A"),  # azul oscuro
    alignment=1,  # Centrado
    spaceAfter=20
)

estilo_subtitulo = ParagraphStyle(
    "Subtitulo",
    parent=styles["Normal"],
    fontSize=14,
    textColor=colors.gray,
    alignment=1,
    spaceAfter=30
)

estilo_texto = ParagraphStyle(
    "Texto",
    parent=styles["Normal"],
    fontSize=11,
    leading=15,
    spaceAfter=10,
    alignment=4  # Justificado
)


# ---------------------------
# CONTENIDO DEL PDF
# ---------------------------

contenido = []

# Título principal
titulo = Paragraph("Informe General de Productos", estilo_titulo)
subtitulo = Paragraph("Generado automáticamente con ReportLab + Platypus", estilo_subtitulo)
contenido.append(titulo)
contenido.append(subtitulo)
contenido.append(Spacer(1, 20))

import os
from reportlab.platypus import Image

# Obtener la ruta absoluta del proyecto
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

# Ruta absoluta de la imagen
ruta_imagen = os.path.join(BASE_DIR, "media", "logo192.png")

# Crear el Flowable de la imagen
#imagen = Image(ruta_imagen, width=120, height=120)

# Imagen (ajustá la ruta a una imagen que tengas)
try:
    imagen = Image(ruta_imagen, width=100, height=100)
    imagen.hAlign = "CENTER"
    contenido.append(imagen)
    contenido.append(Spacer(1, 20))
except:
    contenido.append(Paragraph("(Imagen no encontrada)", styles["Italic"]))
    contenido.append(Spacer(1, 20))

# Texto con estilo
texto = Paragraph(
    """Este informe fue generado automáticamente utilizando la biblioteca ReportLab de Python.
    El objetivo es mostrar cómo combinar diferentes tipos de elementos en un único documento PDF.
    A continuación, se presenta una tabla con información de ejemplo que podría representar productos,
    usuarios o cualquier otro tipo de datos de tu sistema.""",
    estilo_texto
)
contenido.append(texto)
contenido.append(Spacer(1, 20))

# Tabla de ejemplo
data = [
    ["Producto", "Precio", "Stock", "Categoría"],
    ["Teclado Logitech", "$12.000", "23", "Periféricos"],
    ["Mouse Redragon", "$9.500", "15", "Periféricos"],
    ["Monitor Samsung 24''", "$85.000", "8", "Pantallas"],
    ["Notebook HP 15", "$390.000", "5", "Portátiles"],
]

tabla = Table(data, colWidths=[150, 100, 80, 120])
tabla.setStyle(TableStyle([
    ('BACKGROUND', (0, 0), (-1, 0), colors.HexColor("#1E3A8A")),
    ('TEXTCOLOR', (0, 0), (-1, 0), colors.white),
    ('ALIGN', (0, 0), (-1, -1), 'CENTER'),
    ('FONTNAME', (0, 0), (-1, 0), 'Helvetica-Bold'),
    ('BOTTOMPADDING', (0, 0), (-1, 0), 10),
    ('BACKGROUND', (0, 1), (-1, -1), colors.whitesmoke),
    ('GRID', (0, 0), (-1, -1), 0.5, colors.gray),
]))

contenido.append(tabla)
contenido.append(Spacer(1, 30))

# Párrafo final
final = Paragraph(
    """Este documento puede personalizarse fácilmente para incluir gráficos, tablas dinámicas,
    e incluso información obtenida directamente desde una base de datos o una API.""",
    estilo_texto
)
contenido.append(final)

# ---------------------------
# GENERAR EL PDF
# ---------------------------
doc.build(contenido, onFirstPage=encabezado_y_pie, onLaterPages=encabezado_y_pie)
print("✅ PDF generado exitosamente: reporte_completo.pdf")
