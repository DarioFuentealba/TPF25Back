[
  { "nombre": "Teclado Logitech", "precio": 12000, "stock": 23, "categoria": "Periféricos" },
  { "nombre": "Mouse Redragon", "precio": 9500, "stock": 15, "categoria": "Periféricos" },
  { "nombre": "Monitor Samsung 24''", "precio": 85000, "stock": 8, "categoria": "Pantallas" },
  { "nombre": "Notebook HP 15", "precio": 390000, "stock": 5, "categoria": "Portátiles" }
]



import json
from reportlab.lib import colors
from reportlab.lib.pagesizes import A4
from reportlab.platypus import SimpleDocTemplate, Paragraph, Spacer, Table, TableStyle
from reportlab.lib.styles import getSampleStyleSheet, ParagraphStyle
from reportlab.pdfgen import canvas


# ---------------------------
# FUNCIONES AUXILIARES
# ---------------------------

def encabezado_y_pie(canvas, doc):
    """Encabezado y pie de página."""
    canvas.saveState()
    width, height = A4
    canvas.setFont("Helvetica-Bold", 10)
    canvas.drawString(40, height - 40, "DevShare - Reporte dinámico")
    canvas.setFont("Helvetica", 9)
    canvas.drawString(270, 20, f"Página {doc.page}")
    canvas.restoreState()


def cargar_datos_json(ruta_archivo):
    """Lee los datos desde un archivo JSON."""
    with open(ruta_archivo, "r", encoding="utf-8") as f:
        return json.load(f)


# ---------------------------
# CONFIGURACIÓN DEL DOCUMENTO
# ---------------------------

doc = SimpleDocTemplate(
    "reporte_dinamico.pdf",
    pagesize=A4,
    rightMargin=40,
    leftMargin=40,
    topMargin=60,
    bottomMargin=40
)

styles = getSampleStyleSheet()
estilo_titulo = ParagraphStyle(
    "Titulo",
    parent=styles["Title"],
    textColor=colors.HexColor("#1E3A8A"),
    alignment=1,
    spaceAfter=20
)
estilo_texto = ParagraphStyle(
    "Texto",
    parent=styles["Normal"],
    fontSize=11,
    leading=15,
    spaceAfter=10,
    alignment=4
)

# ---------------------------
# CONTENIDO DEL PDF
# ---------------------------

contenido = []

contenido.append(Paragraph("Reporte dinámico de productos", estilo_titulo))
contenido.append(Spacer(1, 20))
contenido.append(Paragraph("Datos cargados automáticamente desde un archivo JSON.", estilo_texto))
contenido.append(Spacer(1, 20))

# Cargar datos del JSON
productos = cargar_datos_json("productos.json")

# Crear encabezado de la tabla
data = [["Producto", "Precio", "Stock", "Categoría"]]

# Agregar filas dinámicamente
for p in productos:
    data.append([p["nombre"], f"${p['precio']:,}", str(p["stock"]), p["categoria"]])

# Crear la tabla
tabla = Table(data, colWidths=[160, 100, 80, 120])
tabla.setStyle(TableStyle([
    ('BACKGROUND', (0, 0), (-1, 0), colors.HexColor("#1E3A8A")),
    ('TEXTCOLOR', (0, 0), (-1, 0), colors.white),
    ('ALIGN', (0, 0), (-1, -1), 'CENTER'),
    ('GRID', (0, 0), (-1, -1), 0.5, colors.gray),
    ('FONTNAME', (0, 0), (-1, 0), 'Helvetica-Bold'),
    ('BACKGROUND', (0, 1), (-1, -1), colors.whitesmoke),
]))

contenido.append(tabla)

# Generar PDF
doc.build(contenido, onFirstPage=encabezado_y_pie, onLaterPages=encabezado_y_pie)
print("✅ PDF dinámico generado: reporte_dinamico.pdf")
