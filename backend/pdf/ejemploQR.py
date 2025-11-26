# EN EL VIEWS 
from io import BytesIO
from django.http import FileResponse
from rest_framework.decorators import api_view
from reportlab.graphics.barcode import qr
from reportlab.graphics.shapes import Drawing
from reportlab.graphics import renderPDF
from reportlab.lib.pagesizes import A4
from reportlab.pdfgen import canvas


@api_view(["GET"])
def generar_pdf_qr(request):
    # Datos para el QR
    data_qr = "https://www.tusitio.com/perfil/usuario123"

    # Crear buffer en memoria
    buffer = BytesIO()

    # Crear el PDF
    c = canvas.Canvas(buffer, pagesize=A4)
    width, height = A4

    # Título
    c.setFont("Helvetica-Bold", 16)
    c.drawString(100, height - 100, "Reporte con Código QR")

    # Generar el QR
    qr_code = qr.QrCodeWidget(data_qr)
    bounds = qr_code.getBounds()
    qr_width = bounds[2] - bounds[0]
    qr_height = bounds[3] - bounds[1]

    d = Drawing(120, 120)
    d.add(qr_code)
    renderPDF.draw(d, c, 100, height - 300)

    c.drawString(100, height - 320, "Escaneá el código para ver tu perfil.")

    # Finalizar PDF
    c.showPage()
    c.save()

    buffer.seek(0)
    return FileResponse(buffer, as_attachment=True, filename="reporte_qr.pdf")


# en la URLS
# from django.urls import path
# from .views import generar_pdf_qr

# urlpatterns = [
#     path("generar-pdf-qr/", generar_pdf_qr, name="generar_pdf_qr"),
# ]

# EN REACT 
# import React from "react";

# export default function BotonGenerarPDF() {
#   const handleGenerarPDF = async () => {
#     try {
#       const response = await fetch("http://localhost:8000/api/generar-pdf-qr/", {
#         method: "GET",
#       });

#       const blob = await response.blob();
#       const url = window.URL.createObjectURL(blob);
#       const a = document.createElement("a");
#       a.href = url;
#       a.download = "reporte_qr.pdf";
#       a.click();
#     } catch (error) {
#       console.error("Error generando el PDF:", error);
#     }
#   };

#   return (
#     <button
#       onClick={handleGenerarPDF}
#       className="bg-blue-500 text-white p-2 rounded hover:bg-blue-600"
#     >
#       Generar PDF con QR
#     </button>
#   );
# }
