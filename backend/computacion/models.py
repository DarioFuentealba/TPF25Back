from django.db import models

"""
@author: Juan Pablo Urra y Fuentealba Dario 
"""

# CATEGORIA
class Categoria(models.Model):
    nombre = models.CharField(max_length=100)

    def __str__(self):
        return self.nombre
    
#  SUBCATEGORIA   
class SubCategoria(models.Model):
    nombre = models.CharField(max_length=100)
    categoria = models.ForeignKey(Categoria,on_delete=models.CASCADE, related_name='subcategorias')

    def __str__(self):
        return self.nombre

# Se aplica Herencia entre la clase producto y los componentes 
# que vende la tienda. 
class Producto(models.Model):
    nombre = models.TextField()
    precio = models.DecimalField(max_digits=10, decimal_places=2)
    stock = models.IntegerField()
    codigo = models.IntegerField()
    peso = models.DecimalField(max_digits=4,decimal_places=2)
    fabricante = models.CharField(max_length=200)
    oferta = models.BooleanField()
    subcategoria=models.ForeignKey(SubCategoria, on_delete=models.CASCADE, null=False)

    class Meta:
        abstract = True # especifica que la clase producto es abstracta. 

        
# COMPONENTES DE LA TIENDA  DE COMPUTACION 
class Motherboard(Producto):
    memoria = models.CharField(max_length=200)
    socket_memoria = models.CharField(max_length=200)
    socket_gpu = models.CharField(max_length=200)
    socket_sata_disco = models.CharField(max_length=200)
    socket_M2_disco = models.CharField(max_length=200)
    socket_cpu = models.CharField(max_length=200)
    sonido = models.CharField(max_length=200)
    puerto_sata = models.CharField(max_length=200)
    ranura_ram = models.CharField(max_length=200)
    pci = models.CharField(max_length=200)
    usb = models.CharField(max_length=200)
    hdmi = models.CharField(max_length=200)
    vga = models.CharField(max_length=200)
    consumo = models.DecimalField(max_digits=10, decimal_places=2)
    # peso = models.DecimalField(max_digits=4, decimal_places=2)
    foto1 = models.ImageField(upload_to='Componentes/PlacaMadre/', null=True, blank=True)
    foto2 = models.ImageField(upload_to='Componentes/PlacaMadre/', null=True, blank=True)
    foto3 = models.ImageField(upload_to='Componentes/PlacaMadre/', null=True, blank=True)
    foto4 = models.ImageField(upload_to='Componentes/PlacaMadre/', null=True, blank=True)
    foto5 = models.ImageField(upload_to='Componentes/PlacaMadre/', null=True, blank=True)


class Cpu(Producto):
    modelo = models.CharField(max_length=200)
    nucleos = models.IntegerField()
    hilos = models.IntegerField()
    frecuencia = models.CharField(max_length=200)
    proceso_fabricacion = models.CharField(max_length=200)
    grafica_integrada = models.CharField(max_length=255)
    socket = models.CharField(max_length=200)
    incluye_cooler = models.BooleanField()
    tdp_watts = models.DecimalField(max_digits=6, decimal_places=3)
    memoria_l1 = models.CharField(max_length=200)
    memoria_l2 = models.CharField(max_length=200)
    memoria_l3 = models.CharField(max_length=200)
    consumo = models.DecimalField(max_digits=10, decimal_places=2)
    # peso = models.DecimalField(max_digits=4, decimal_places=2)
    foto1 = models.ImageField(upload_to='Componentes/Micros/', null=True, blank=True)
    foto2 = models.ImageField(upload_to='Componentes/Micros/', null=True, blank=True)
    foto3 = models.ImageField(upload_to='Componentes/Micros/', null=True, blank=True)
    foto4 = models.ImageField(upload_to='Componentes/Micros/', null=True, blank=True)


class Gpu(Producto):
    consumo = models.DecimalField(max_digits=10, decimal_places=2)
    memoria_capacidad_gb = models.IntegerField()
    memoria_tipo = models.CharField(max_length=200)
    memoria_velocidad = models.CharField(max_length=200)
    resolucion_max = models.CharField(max_length=200)
    refrigeracion = models.CharField(max_length=200)
    socket_gpu = models.CharField(max_length=200)
    # peso = models.DecimalField(max_digits=4, decimal_places=2)
    foto1 = models.ImageField(upload_to='Componentes/PlacaVideo/', null=True, blank=True)
    foto2 = models.ImageField(upload_to='Componentes/PlacaVideo/', null=True, blank=True)
    foto3 = models.ImageField(upload_to='Componentes/PlacaVideo/', null=True, blank=True)
    foto4 = models.ImageField(upload_to='Componentes/PlacaVideo/', null=True, blank=True)
    foto5 = models.ImageField(upload_to='Componentes/PlacaVideo/', null=True, blank=True)


class Ram(Producto):
    tipo = models.CharField(max_length=50)
    capacidad_gb = models.IntegerField()
    latencia = models.CharField(max_length=50)
    consumo = models.DecimalField(max_digits=10, decimal_places=2)
    velocidad = models.IntegerField()
    pin_de_memoria = models.CharField(max_length=150)
    disipador_de_calor = models.CharField(max_length=150)
    # peso = models.DecimalField(max_digits=4, decimal_places=2)
    foto1 = models.ImageField(upload_to='Componentes/Ram/', null=True, blank=True)
    foto2 = models.ImageField(upload_to='Componentes/Ram/', null=True, blank=True)
    foto3 = models.ImageField(upload_to='Componentes/Ram/', null=True, blank=True)
    foto4 = models.ImageField(upload_to='Componentes/Ram/', null=True, blank=True)
    foto5 = models.ImageField(upload_to='Componentes/Ram/', null=True, blank=True)

class Disco(Producto):
    capacidad_gb = models.CharField(max_length=200)
    socket_disco = models.CharField(max_length=100)
    consumo = models.DecimalField(max_digits=10, decimal_places=2)
    velocidad = models.CharField(max_length=150)
    conexion = models.CharField(max_length=150)
    # peso = models.DecimalField(max_digits=4, decimal_places=2)
    foto1 = models.ImageField(upload_to='Componentes/Disco/', null=True, blank=True)
    foto2 = models.ImageField(upload_to='Componentes/Disco/', null=True, blank=True)
    foto3 = models.ImageField(upload_to='Componentes/Disco/', null=True, blank=True)


class Fuente(Producto):
    potencia_nominal=models.DecimalField(max_digits=5, decimal_places=2)
    consumo = models.DecimalField(max_digits=7, decimal_places=2)
    potencia_nominal = models.DecimalField(max_digits=7, decimal_places=2)
    eficiencia = models.CharField(max_length=150)
    ventilador = models.CharField(max_length=150)
    socket_fuente_gpu = models.CharField(max_length=200)
    # peso = models.DecimalField(max_digits=4, decimal_places=2)
    foto1 = models.ImageField(upload_to='Componentes/Fuente/', null=True, blank=True)
    foto2 = models.ImageField(upload_to='Componentes/Fuente/', null=True, blank=True)
    foto3 = models.ImageField(upload_to='Componentes/Fuente/', null=True, blank=True)
    foto4 = models.ImageField(upload_to='Componentes/Fuente/', null=True, blank=True)

class Monitor(Producto):
    panel = models.CharField(max_length=150)
    pantalla = models.CharField(max_length=150)
    tamanio = models.CharField(max_length=150)
    vga = models.CharField(max_length=150)
    display_port = models.CharField(max_length=150)
    usb = models.CharField(max_length=150)
    hdmi = models.CharField(max_length=150)
    resolucion = models.CharField(max_length=150)
    consumo = models.DecimalField(max_digits=5, decimal_places=2)
    # peso = models.DecimalField(max_digits=4, decimal_places=2)
    foto1 = models.ImageField(upload_to='Componentes/Monitor/', null=True, blank=True)
    foto2 = models.ImageField(upload_to='Componentes/Monitor/', null=True, blank=True)
    foto3 = models.ImageField(upload_to='Componentes/Monitor/', null=True, blank=True)
    foto4 = models.ImageField(upload_to='Componentes/Monitor/', null=True, blank=True)


class Mouse(Producto):
    color = models.CharField(max_length=50)
    conexion = models.CharField(max_length=255)
    botones = models.CharField(max_length=50)
    iluminacion = models.CharField(max_length=50)
    consumo = models.DecimalField(max_digits=5, decimal_places=2)
    # peso = models.DecimalField(max_digits=4, decimal_places=2)
    foto1 = models.ImageField(upload_to='Componentes/Mouse/', null=True, blank=True)
    foto2 = models.ImageField(upload_to='Componentes/Mouse/', null=True, blank=True)
    foto3 = models.ImageField(upload_to='Componentes/Mouse/', null=True, blank=True)
    foto4 = models.ImageField(upload_to='Componentes/Mouse/', null=True, blank=True)
    foto5 = models.ImageField(upload_to='Componentes/Mouse/', null=True, blank=True)
    foto6 = models.ImageField(upload_to='Componentes/Mouse/', null=True, blank=True)
    foto7 = models.ImageField(upload_to='Componentes/Mouse/', null=True, blank=True)
    foto8 = models.ImageField(upload_to='Componentes/Mouse/', null=True, blank=True)

class Teclado(Producto):
    color=models.CharField(max_length=50)
    conexion=models.CharField(max_length=50)
    iluminacion=models.CharField(max_length=50)
    consumo=models.DecimalField(max_digits=5, decimal_places=2)
    # peso = models.DecimalField(max_digits=4, decimal_places=2)
    foto1= models.ImageField(upload_to='Componentes/Teclado/', null=True, blank=True)
    foto2= models.ImageField(upload_to='Componentes/Teclado/', null=True, blank=True)
    foto3= models.ImageField(upload_to='Componentes/Teclado/', null=True, blank=True)
    foto4= models.ImageField(upload_to='Componentes/Teclado/', null=True, blank=True)
    foto5= models.ImageField(upload_to='Componentes/Teclado/', null=True, blank=True)
    foto6= models.ImageField(upload_to='Componentes/Teclado/', null=True, blank=True)
    foto7= models.ImageField(upload_to='Componentes/Teclado/', null=True, blank=True)


class Gabinete(Producto):
    ventana=models.CharField(max_length=255)
    colores=models.CharField(max_length=150)
    usb=models.CharField(max_length=150)
    audio_hd=models.CharField(max_length=150)
    ancho=models.CharField(max_length=50)
    alto=models.CharField(max_length=50)
    profundidad=models.CharField(max_length=50)
    ventiladores= models.CharField(max_length=150)
    incluidos=models.CharField(max_length=150)
    radiadores=models.CharField(max_length=150)
    consumo=models.DecimalField(max_digits=5, decimal_places=2)
    # peso = models.DecimalField(max_digits=4, decimal_places=2)
    foto1= models.ImageField(upload_to='Componentes/Gabinetes/', null=True, blank=True)
    foto2= models.ImageField(upload_to='Componentes/Gabinetes/', null=True, blank=True)
    foto3= models.ImageField(upload_to='Componentes/Gabinetes/', null=True, blank=True)
    foto4= models.ImageField(upload_to='Componentes/Gabinetes/', null=True, blank=True)
    foto5= models.ImageField(upload_to='Componentes/Gabinetes/', null=True, blank=True)
    foto6= models.ImageField(upload_to='Componentes/Gabinetes/', null=True, blank=True)
    foto7= models.ImageField(upload_to='Componentes/Gabinetes/', null=True, blank=True)


class Cooler(Producto):
    color=models.CharField(max_length=50)
    consumo=models.DecimalField(max_digits=5, decimal_places=2)
    cooler_incluidos=models.IntegerField()
    iluminacion=models.CharField(max_length=150)
    socket_cpu = models.CharField(max_length=150)
    # peso = models.DecimalField(max_digits=4, decimal_places=2)
    foto1= models.ImageField(upload_to='Componentes/Cooler/', null=True, blank=True)
    foto2= models.ImageField(upload_to='Componentes/Cooler/', null=True, blank=True)
    foto3= models.ImageField(upload_to='Componentes/Cooler/', null=True, blank=True)


class PcEscritorio(Producto):
    envio_gratis=models.CharField(max_length=50)
    sistema_operativo=models.CharField(max_length=50)
    teclado_extra=models.CharField(max_length=100)
    usos=models.CharField(max_length=150)
    almacenamiento=models.CharField(max_length=50)
    pantalla_tamanio=models.CharField(max_length=50)
    pantalla_tactil=models.CharField(max_length=50)
    pantalla_led=models.CharField(max_length=50)
    memoria_ram=models.CharField(max_length=50)
    gpu_dedicada=models.CharField(max_length=50)
    procesador=models.CharField(max_length=50)
    # peso = models.DecimalField(max_digits=4, decimal_places=2)
    foto1= models.ImageField(upload_to='CompuArmada/', null=True, blank=True)
    foto2= models.ImageField(upload_to='CompuArmada/', null=True, blank=True)



class Notebook(Producto):
    envio_gratis=models.CharField(max_length=50)
    sistema_operativo=models.CharField(max_length=50)
    usos=models.CharField(max_length=150)
    teclado_extra=models.CharField(max_length=100)
    almacenamiento=models.CharField(max_length=50)
    pantalla_tamanio=models.CharField(max_length=50)
    pantalla_tactil=models.CharField(max_length=50)
    pantalla_led=models.CharField(max_length=50)
    memoria_ram=models.CharField(max_length=50)
    gpu_dedicada=models.CharField(max_length=50)
    procesador=models.CharField(max_length=50)
    # peso = models.DecimalField(max_digits=4, decimal_places=2)
    foto1= models.ImageField(upload_to='Notebook/', null=True, blank=True)
    foto2= models.ImageField(upload_to='Notebook/', null=True, blank=True)

class Placa_wifi(Producto):
    frecuencia=models.CharField(max_length=150)
    velocidad=models.CharField(max_length=100)
    consumo=models.DecimalField(max_digits=5,decimal_places=2)
    # peso = models.DecimalField(max_digits=4, decimal_places=2)
    foto1= models.ImageField(upload_to='Componentes/PlacaWifi/', null=True, blank=True)
    foto2= models.ImageField(upload_to='Componentes/PlacaWifi/', null=True, blank=True)
    foto3= models.ImageField(upload_to='Componentes/PlacaWifi/', null=True, blank=True)


class Sistema_operativo(Producto):
    detalle=models.CharField(max_length=150)
    # peso = models.DecimalField(max_digits=4, decimal_places=2)
    foto1= models.ImageField(upload_to='Componentes/SO/', null=True, blank=True)
    foto2= models.ImageField(upload_to='Componentes/SO/', null=True, blank=True)
    foto3= models.ImageField(upload_to='Componentes/SO/', null=True, blank=True)
    foto4= models.ImageField(upload_to='Componentes/SO/', null=True, blank=True)
    foto5= models.ImageField(upload_to='Componentes/SO/', null=True, blank=True)

class Paquete_office(Producto):
    # peso = models.DecimalField(max_digits=4, decimal_places=2)
    foto1=models.ImageField(upload_to='Componentes/Office/',null=True,blank=True)
    foto2=models.ImageField(upload_to='Componentes/Office/',null=True,blank=True)


