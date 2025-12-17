from rest_framework.test import APITestCase
from rest_framework import status

class BaseApiCrudTest(APITestCase):
    model = None          # Modelo que se va a testear
    url = ""              # Endpoint de la API
    default_data = {}     # Datos para la API

    # Opcional: FK necesaria para algunos modelos
    fk_field_name = None  # Nombre del campo FK en el modelo (ORM)
    fk_instance = None    # Instancia de la FK (ORM)

    def setUp(self):
        # --- Crear objeto en la base de datos (ORM) ---
        if self.model:
            data_orm = self.default_data.copy()
            if self.fk_field_name and self.fk_instance:
                # Para ORM, asignamos la instancia completa, no el ID
                data_orm[self.fk_field_name] = self.fk_instance
            self.obj = self.model.objects.create(**data_orm)

    # --- Test: Crear objeto vía API ---
    def test_create(self):
        response = self.client.post(self.url, self.default_data, format="json")
        print(response.data)  # <- esto te dirá qué campo falla
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)


    # --- Test: Listar objetos vía API ---
    def test_list(self):
        response = self.client.get(self.url, format="json")
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertTrue(len(response.data) >= 1)

    # --- Test: Obtener detalle vía API ---
    def test_retrieve(self):
        response = self.client.get(f"{self.url}{self.obj.id}/", format="json")
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(response.data["id"], self.obj.id)

    # --- Test: Actualizar objeto vía API ---
    def test_update(self):
        updated_data = self.default_data.copy()
        updated_data["nombre"] = "Nuevo nombre"
        response = self.client.put(f"{self.url}{self.obj.id}/", updated_data, format="json")
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.obj.refresh_from_db()
        self.assertEqual(self.obj.nombre, "Nuevo nombre")

    # --- Test: Eliminar objeto vía API ---
    def test_delete(self):
        response = self.client.delete(f"{self.url}{self.obj.id}/", format="json")
        self.assertEqual(response.status_code, status.HTTP_204_NO_CONTENT)
        self.assertFalse(self.model.objects.filter(id=self.obj.id).exists())



from computacion.models import Cpu, Categoria, SubCategoria

class CpuApiTest(BaseApiCrudTest):
    model = Cpu
    url = "/api/computacion/cpus/"

    def setUp(self):
        # Crear FK necesarias
        categoria = Categoria.objects.create(nombre="Hardware")
        subcategoria = SubCategoria.objects.create(nombre="CPU", categoria=categoria)
        self.fk_field_name = "subcategoria"  # nombre exacto en el modelo
        self.fk_instance = subcategoria      # instancia para ORM

        # Datos para la API (subcategoria usa ID)
        self.default_data = {
            "nombre": "Core i3",
            "precio": 300.0,
            "stock": 3,
            "fabricante": "AMD",
            "oferta": True,
            "modelo": "AMD Ryzen 3 4100",
            "nucleos": 6,
            "hilos": 12,
            "frecuencia": "3.7GHz",
            "proceso_fabricacion": "7nm",
            "grafica_itegrada": False,
            "socket": "AM4",
            "incluye_cooler": True,
            "tdp_watts": 65.0,
            "memoria_l1": "384KB",
            "memoria_l2": "3MB",
            "memoria_l3": "32MB",
            "foto": None,
            "subcategoria": subcategoria.id  # para la API se envía ID
        }

        super().setUp()
