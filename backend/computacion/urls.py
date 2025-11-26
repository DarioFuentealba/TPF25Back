from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import (listar_todos_los_productos,productosUsos,CategoriaViewSet,CategoriaConSubCategoriaListView,
                    SubCategoriaViewSet, CpuViewSet, PlacaMadreViewSet, GabineteViewSet,
                    RamViewSet, DiscoViewSet, FuenteViewSet, MonitorViewSet, MouseViewSet, 
                    TecladoViewSet, GpuViewSet,CoolerViewSet,PcEscritorioViewSet,NotebookViewSet,
                    PlacaWifiViewSet,SistemaOperativoViewSet,PaqueteOfficeViewSet)

# URLs generadas automaticamente usando Routers y ViewSets

router = DefaultRouter()
router.register(r'cpus', CpuViewSet)
router.register(r'motherboards', PlacaMadreViewSet) 
router.register(r'gabinetes', GabineteViewSet)
router.register(r'rams', RamViewSet)
router.register(r'discos', DiscoViewSet)
router.register(r'fuentes', FuenteViewSet)
router.register(r'monitores', MonitorViewSet)
router.register(r'mouses', MouseViewSet)
router.register(r'teclados', TecladoViewSet)
router.register(r'gpus', GpuViewSet)
router.register(r'coolers', CoolerViewSet)
router.register(r'pc_escritorios', PcEscritorioViewSet)
router.register(r'notebooks', NotebookViewSet)
router.register(r'categorias', CategoriaViewSet)
router.register(r'sub_categorias', SubCategoriaViewSet)
router.register(r'sistemas_operativos', SistemaOperativoViewSet)
router.register(r'placas_wifi', PlacaWifiViewSet)
router.register(r'paquetes_office', PaqueteOfficeViewSet)

# Seccion para el manejo de URLs manuales. Para casos de uso especial como autenticacion
# y permisos. 


# Urls necesarias para el enrutamiento de las vistas
urlpatterns=[
    path('', include(router.urls)),
    path('categoria-con-subcategorias/',CategoriaConSubCategoriaListView.as_view(),name='categoria-con-subcategorias'),
    path('todos_los_productos/',listar_todos_los_productos, name='todos_los_productos'),
    path('productos-por-uso/<str:uso>/',productosUsos, name='productos-por-uso'),

]
