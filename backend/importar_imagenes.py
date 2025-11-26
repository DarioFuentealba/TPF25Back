import os
import django

# Configura Django
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'backend.settings')
django.setup()

from django.core.files import File
from computacion.models import (
    Motherboard, Cpu, Gpu, Ram, Disco, Fuente, 
    Monitor, Mouse, Teclado, Gabinete, Cooler, 
    PcEscritorio, Notebook
)

# Diccionario con los modelos y sus carpetas correspondientes
MODELOS_PRODUCTOS = {
    'PlacaMadre': Motherboard,
    'Micros': Cpu,
    'PlacaVideo': Gpu,
    'Ram': Ram,
    'Disco': Disco,
    'Fuente': Fuente,
    'Monitor': Monitor,
    'Mouse': Mouse,
    'Teclado': Teclado,
    'Gabinetes': Gabinete,
    'Cooler': Cooler,
    'CompuArmada': PcEscritorio,
    'Notebook': Notebook,
}

def importar_imagenes(ruta_base_imagenes):
    """
    Importa imágenes desde una carpeta base.
    
    Estructura esperada:
    ruta_base_imagenes/
        motherboards/
            producto1.jpg
            producto2.png
        cpus/
            producto3.jpg
        ...
    
    Args:
        ruta_base_imagenes: Ruta donde tu compañero tiene las carpetas con imágenes
    """
    
    resultados = {
        'exitosos': 0,
        'no_encontrados': 0,
        'errores': 0
    }
    
    for carpeta, Modelo in MODELOS_PRODUCTOS.items():
        ruta_carpeta = os.path.join(ruta_base_imagenes, carpeta)
        
        if not os.path.exists(ruta_carpeta):
            print(f"⚠️  Carpeta no encontrada: {ruta_carpeta}")
            continue
        
        print(f"\n📁 Procesando {carpeta}...")
        
        for filename in os.listdir(ruta_carpeta):
            if not filename.lower().endswith(('.jpg', '.jpeg', '.png', '.gif', '.webp')):
                continue
            
            # Extraer el nombre base sin extensión
            nombre_producto = os.path.splitext(filename)[0]
            
            try:
                # Buscar el producto por nombre
                producto = Modelo.objects.get(nombre__iexact=nombre_producto)
                
                ruta_completa = os.path.join(ruta_carpeta, filename)
                
                # Guardar la imagen en el producto
                with open(ruta_completa, 'rb') as f:
                    producto.foto.save(filename, File(f), save=True)
                
                print(f"  ✓ {filename} → {producto.nombre}")
                resultados['exitosos'] += 1
                
            except Modelo.DoesNotExist:
                print(f"  ✗ Producto no encontrado: {nombre_producto}")
                resultados['no_encontrados'] += 1
                
            except Exception as e:
                print(f"  ❌ Error con {filename}: {str(e)}")
                resultados['errores'] += 1
    
    # Resumen
    print("\n" + "="*50)
    print("RESUMEN DE IMPORTACIÓN")
    print("="*50)
    print(f"✓ Exitosos: {resultados['exitosos']}")
    print(f"✗ No encontrados: {resultados['no_encontrados']}")
    print(f"❌ Errores: {resultados['errores']}")
    print("="*50)


def importar_imagenes_por_id(ruta_base_imagenes):
    """
    Alternativa: Si los nombres de archivo son IDs de productos.
    
    Estructura esperada:
    ruta_base_imagenes/
        motherboards/
            1.jpg
            2.png
        cpus/
            3.jpg
        ...
    """
    
    resultados = {
        'exitosos': 0,
        'no_encontrados': 0,
        'errores': 0
    }
    
    for carpeta, Modelo in MODELOS_PRODUCTOS.items():
        ruta_carpeta = os.path.join(ruta_base_imagenes, carpeta)
        
        if not os.path.exists(ruta_carpeta):
            print(f"⚠️  Carpeta no encontrada: {ruta_carpeta}")
            continue
        
        print(f"\n📁 Procesando {carpeta}...")
        
        for filename in os.listdir(ruta_carpeta):
            if not filename.lower().endswith(('.jpg', '.jpeg', '.png', '.gif', '.webp')):
                continue
            
            # Extraer el ID del nombre de archivo
            try:
                producto_id = int(os.path.splitext(filename)[0])
            except ValueError:
                print(f"  ⚠️  Nombre de archivo no válido (debe ser un ID): {filename}")
                continue
            
            try:
                producto = Modelo.objects.get(id=producto_id)
                
                ruta_completa = os.path.join(ruta_carpeta, filename)
                
                with open(ruta_completa, 'rb') as f:
                    producto.foto.save(filename, File(f), save=True)
                
                print(f"  ✓ {filename} → ID {producto_id}: {producto.nombre}")
                resultados['exitosos'] += 1
                
            except Modelo.DoesNotExist:
                print(f"  ✗ Producto con ID {producto_id} no encontrado")
                resultados['no_encontrados'] += 1
                
            except Exception as e:
                print(f"  ❌ Error con {filename}: {str(e)}")
                resultados['errores'] += 1
    
    # Resumen
    print("\n" + "="*50)
    print("RESUMEN DE IMPORTACIÓN")
    print("="*50)
    print(f"✓ Exitosos: {resultados['exitosos']}")
    print(f"✗ No encontrados: {resultados['no_encontrados']}")
    print(f"❌ Errores: {resultados['errores']}")
    print("="*50)

    print(f"Buscando en: {RUTA_IMAGENES}")
    print(f"¿Existe la ruta? {os.path.exists(RUTA_IMAGENES)}")
    print(f"Contenido: {os.listdir(RUTA_IMAGENES) if os.path.exists(RUTA_IMAGENES) else 'No existe'}")

if __name__ == "__main__":
    # CONFIGURA AQUÍ LA RUTA DONDE ESTÁN LAS IMÁGENES DE TU COMPAÑERO
    RUTA_IMAGENES = '../frontend/src/assets/Imagenes/Productos/Componentes'
    
    # Opción 1: Si los archivos se llaman como el producto (por nombre)
    #importar_imagenes(RUTA_IMAGENES)
    
    # Opción 2: Si los archivos se llaman por ID del producto
    importar_imagenes_por_id(RUTA_IMAGENES)