from rest_framework import viewsets
from rest_framework.decorators import action
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from django.http import HttpResponse
from io import BytesIO
from reportlab.platypus import SimpleDocTemplate, Table, Paragraph, Spacer
from reportlab.lib.pagesizes import A4
from reportlab.lib.styles import getSampleStyleSheet, ParagraphStyle
from .models import OrdenPedido, Pedidos
from .serializers import OrdenPedidoSerializer, PedidosSerializer
from rest_framework.permissions import AllowAny
import datetime

class OrdenPedidoViewSet(viewsets.ModelViewSet):
    queryset = OrdenPedido.objects.all()
    serializer_class = OrdenPedidoSerializer
    permission_classes = [AllowAny]

    def perform_create(self, serializer):
        serializer.save(usuario=self.request.user)

    @action(detail=True, methods=['get'])
    def generar_pdf(self, request, pk=None):
        try:
            orden = self.get_object()
        except OrdenPedido.DoesNotExist:
            return Response({"error": "Orden no encontrada"}, status=404)

        
        pedidos = orden.productos.all() # productos viene porque usamos related_name en el campo orden de la clase Pedido
        buffer = BytesIO()
        doc = SimpleDocTemplate(buffer, pagesize=A4,
                                rightMargin=40, leftMargin=40, topMargin=60, bottomMargin=40)

        styles = getSampleStyleSheet()
        estilo_titulo = ParagraphStyle("Titulo", fontSize=20, alignment=1, textColor="#1E3A8A", spaceAfter=20)
        estilo_celda = ParagraphStyle("Celda", fontSize=10, alignment=1, leading=12)

        contenido = []
        # --- Título-----------------------------------
        contenido.append(Paragraph("Orden de Pedido", estilo_titulo))
        contenido.append(Spacer(1, 10))
        contenido.append(Paragraph(f"ID de Orden: {orden.id}", styles["Normal"]))
        contenido.append(Paragraph(f"Proveedor: {orden.proveedor.nombre}", styles["Normal"]))
        contenido.append(Paragraph(f"Encargado: {orden.usuario.username}", styles["Normal"]))
        fecha = datetime.datetime.now().strftime("%d/%m/%Y %H:%M:%S")
        contenido.append(Paragraph(f"Fecha : {fecha}", styles["Normal"]))
        contenido.append(Spacer(1, 20))

        # --- Tabla de productos--------------------------------------
        data = [["Nombre", "Cantidad", "Característica"]]

        if pedidos.exists():
            for p in pedidos:
                data.append([
                    Paragraph(p.nombre, estilo_celda),
                    str(p.cantidad),
                    Paragraph(p.caracteristicas, estilo_celda)
                ])
        else:
            data.append(["(Sin productos)", "", ""])

        tabla = Table(data, colWidths=[200, 100, 200])
        tabla.setStyle([
            ('BACKGROUND', (0, 0), (-1, 0), "#1E3A8A"),
            ('TEXTCOLOR', (0, 0), (-1, 0), "#FFFFFF"),
            ('ALIGN', (0, 0), (-1, -1), 'CENTER'),
            ('GRID', (0, 0), (-1, -1), 0.5, "#CCCCCC"),
        ])
        contenido.append(tabla)
        contenido.append(Spacer(1, 30))
        # --- Generar PDF
        doc.build(contenido)
        buffer.seek(0)
        response = HttpResponse(buffer, content_type='application/pdf')
        response['Content-Disposition'] = f'inline; filename="orden_{orden.id}.pdf"'
        return response


class PedidoViewSet(viewsets.ModelViewSet):
    queryset = Pedidos.objects.all()
    serializer_class = PedidosSerializer
    permission_classes = [AllowAny]