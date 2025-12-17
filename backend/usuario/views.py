from rest_framework.permissions import IsAuthenticated, AllowAny
from django.shortcuts import get_object_or_404
from django.contrib.auth.models import User
from django.contrib.auth.hashers import check_password
from django.contrib.contenttypes.models import ContentType

from rest_framework import viewsets, status
from rest_framework.decorators import action, api_view, permission_classes
from rest_framework.response import Response
from rest_framework_simplejwt.tokens import RefreshToken
from rest_framework_simplejwt.views import TokenObtainPairView

from .models import Interes, Perfil, PCEspecificacion, FavoritoProducto, UsuarioExtra
from carrito.models import LocalidadArgentina

from .serializers import (
    UsuarioSerializer,
    ProfileSerializer,
    ProfileUpdateSerializer,
    InteresesSerializer,
    PCEspecificacionSerializer,
    FavoritoProductoSerializer,
    CustomTokenObtainPairSerializer
)

# ============================================================
#                  USUARIOS Y REGISTRO
# ============================================================

class UsuarioViewSet(viewsets.ModelViewSet):
    queryset = User.objects.all()
    serializer_class = UsuarioSerializer

    @action(detail=False, methods=["post"], permission_classes=[AllowAny])
    def register(self, request):
        serializer = self.get_serializer(data=request.data)
        if serializer.is_valid():
            user = serializer.save()
            refresh = RefreshToken.for_user(user)
            return Response({
                "user": UsuarioSerializer(user, context={"request": request}).data,
                "refresh": str(refresh),
                "access": str(refresh.access_token),
            }, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    # CAMBIO DE PASSWORD 
    @action(detail=True, methods=['post'], url_path='change_password')
    def change_password(self, request, pk=None):
        user = self.get_object()
        old_password = request.data.get('old_password')
        new_password = request.data.get('new_password')
        confirm_password = request.data.get('confirm_password')

        if not check_password(old_password, user.password):
            return Response({'error': 'La contraseña actual no es correcta.'},
                            status=status.HTTP_400_BAD_REQUEST)

        if new_password != confirm_password:
            return Response({'error': 'Las contraseñas nuevas no coinciden.'},
                            status=status.HTTP_400_BAD_REQUEST)

        user.set_password(new_password)
        user.save()

        return Response({'success': 'Contraseña cambiada correctamente.'},
                        status=status.HTTP_200_OK)



@api_view(['GET'])
@permission_classes([IsAuthenticated])
def usuario_actual(request):
    user = request.user
    serializer = UsuarioSerializer(user, context={'request': request})
    return Response(serializer.data)

# ============================================================
#                         PERFIL
# ============================================================

class ProfileViewSet(viewsets.ModelViewSet):
    serializer_class = ProfileSerializer
    permission_classes = [IsAuthenticated]

    def get_queryset(self):
        return Perfil.objects.filter(user=self.request.user)

    def get_object(self):
        perfil, created = Perfil.objects.get_or_create(user=self.request.user)
        return perfil

    def list(self, request):
        perfil = self.get_object()
        serializer = self.get_serializer(perfil)
        return Response(serializer.data)

    def update(self, request, pk=None):
        perfil = self.get_object()
        serializer = ProfileUpdateSerializer(perfil, data=request.data)
        if serializer.is_valid():
            serializer.save()
            # Devuelve el perfil completo actualizado
            full_serializer = ProfileSerializer(perfil,context={'request':request})
            return Response(full_serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def partial_update(self, request, pk=None):
        perfil = self.get_object()
        serializer = ProfileUpdateSerializer(perfil, data=request.data, partial=True)
        if serializer.is_valid():
            serializer.save()
            full_serializer = ProfileSerializer(perfil,context={'request':request})
            return Response(full_serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    @action(detail=False, methods=['get'])
    def me(self, request):
        perfil = self.get_object()
        serializer = self.get_serializer(perfil)
        return Response(serializer.data)

    # ============================================================
    #                AGREGAR / REMOVER INTERESES
    # ============================================================

    @action(detail=False, methods=['post'])
    def add_interest(self, request):
        """POST /api/perfil/add_interest/ - Agrega un interés
        Body: {"nombre": "Gaming"}
        """
        perfil = self.get_object()
        serializer = InteresesSerializer(data=request.data)
        if serializer.is_valid():
            Interes.objects.get_or_create(
                perfil=perfil,
                nombre=serializer.validated_data['nombre']
            )
            profile_serializer = ProfileSerializer(perfil,context={'request':request})
            return Response(profile_serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    @action(detail=False, methods=['delete'])
    def remove_interest(self, request):
        """DELETE /api/perfil/remove_interest/ - Elimina un interés
        Body: {"nombre": "Gaming"}
        """
        perfil = self.get_object()
        nombre = request.data.get('nombre')
        if not nombre:
            return Response(
                {'error': 'El nombre del interés es requerido'},
                status=status.HTTP_400_BAD_REQUEST
            )

        try:
            interest = Interes.objects.get(perfil=perfil, nombre=nombre)
            interest.delete()
            profile_serializer = ProfileSerializer(perfil,context={'request':request})
            return Response(profile_serializer.data)
        except Interes.DoesNotExist:
            return Response(
                {'error': 'Interés no encontrado'},
                status=status.HTTP_404_NOT_FOUND
            )

    # ============================================================
    #               ESPECIFICACIONES DEL PC
    # ============================================================

    @action(detail=False, methods=['get', 'put', 'patch'])
    def pc_specs(self, request):

        perfil = self.get_object()
        pc_spec, created = PCEspecificacion.objects.get_or_create(perfil=perfil)

        if request.method == 'GET':
            serializer = PCEspecificacionSerializer(pc_spec)
            return Response(serializer.data)

        partial = request.method == 'PATCH'
        serializer = PCEspecificacionSerializer(pc_spec, data=request.data, partial=partial)

        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)

        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    # ============================================================
    #                FAVORITOS
    # ============================================================

    @action(detail=False, methods=['get'])
    def favorites(self, request):
        perfil = request.user.perfil
        favoritos = FavoritoProducto.objects.filter(perfil=perfil)
        serializer = FavoritoProductoSerializer(favoritos, many=True)
        return Response(serializer.data)

    @action(detail=False, methods=['post'])
    def add_favorite(self, request):

        perfil = request.user.perfil
        product_type = request.data.get('product_type')
        product_id = request.data.get('product_id')

        if not product_type or not product_id:
            return Response(
                {'error': 'product_type y product_id son requeridos'},
                status=status.HTTP_400_BAD_REQUEST
            )

        try:
            content_type = ContentType.objects.get(model=product_type.lower())
            model_class = content_type.model_class()

            producto = get_object_or_404(model_class, id=product_id)

            favorite, created = FavoritoProducto.objects.get_or_create(
                perfil=perfil,
                content_type=content_type,
                object_id=product_id
            )

            if created:
                serializer = FavoritoProductoSerializer(favorite)
                return Response(serializer.data, status=status.HTTP_201_CREATED)

            return Response(
                {'message': 'Este producto ya está en favoritos'},
                status=status.HTTP_200_OK
            )

        except ContentType.DoesNotExist:
            return Response(
                {'error': f'Tipo de producto \"{product_type}\" no válido'},
                status=status.HTTP_400_BAD_REQUEST
            )

    @action(detail=False, methods=['delete'])
    def remove_favorite(self, request):
        perfil = request.user.perfil
        favorite_id = request.data.get('favorite_id')

        if favorite_id:
            try:
                favorite = FavoritoProducto.objects.get(id=favorite_id, perfil=perfil)
                favorite.delete()
                return Response({'message': 'Producto eliminado de favoritos'})
            except FavoritoProducto.DoesNotExist:
                return Response({'error': 'Favorito no encontrado'}, status=404)

        product_type = request.data.get('product_type')
        product_id = request.data.get('product_id')

        if not product_type or not product_id:
            return Response(
                {'error': 'favorite_id o (product_type y product_id) son requeridos'},
                status=400
            )

        try:
            content_type = ContentType.objects.get(model=product_type.lower())
            favorite = FavoritoProducto.objects.get(
                perfil=perfil,
                content_type=content_type,
                object_id=product_id
            )
            favorite.delete()
            return Response({'message': 'Producto eliminado de favoritos'})
        except (ContentType.DoesNotExist, FavoritoProducto.DoesNotExist):
            return Response({'error': 'Favorito no encontrado'}, status=404)


    @action(detail=False, methods=['post'], url_path='change_password')
    def change_password(self, request):
        user = request.user
        old_password = request.data.get('old_password')
        new_password = request.data.get('new_password')

        if not user.check_password(old_password):
            return Response({'error': 'Contraseña actual incorrecta'}, status=400)

        user.set_password(new_password)
        user.save()
        return Response({'success': 'Contraseña actualizada correctamente'})


# ============================================================
#               JWT AUTH CUSTOM VIEW
# ============================================================

class CustomTokenObtainPairView(TokenObtainPairView):
    serializer_class = CustomTokenObtainPairSerializer


# ============================================================
#                   COSTO DE ENVÍO
# ============================================================

@api_view(['GET'])
@permission_classes([IsAuthenticated])
def obtener_costo_envio(request):
    user = request.user

    try:
        usuario_extra = UsuarioExtra.objects.get(usuario=user)
        codigo_postal = usuario_extra.codigo_postal
        localidad = get_object_or_404(LocalidadArgentina, codigo_postal=str(codigo_postal))

        return Response({
            "costo_envio": localidad.costo_envio,
            "localidad": localidad.localidad
        })
    except UsuarioExtra.DoesNotExist:
        return Response({"error": "Usuario sin código postal"}, status=400)
    except Exception as e:
        return Response({"error": str(e)}, status=400)



# from rest_framework.permissions import IsAuthenticated
# from django.shortcuts import render
# from .models import Interes,Perfil,PCEspecificacion,FavoritoProducto,UsuarioExtra
# from .serializers import UsuarioSerializer,CustomTokenObtainPairSerializer
# from rest_framework import viewsets, status
# from rest_framework.permissions import AllowAny
# from rest_framework_simplejwt.tokens import RefreshToken
# from rest_framework.decorators import action, api_view,permission_classes
# from rest_framework.response import Response
# from django.contrib.auth.models import User
# from .serializers import ProfileSerializer,ProfileUpdateSerializer,InteresesSerializer,PCEspecificacionSerializer,FavoritoProductoSerializer
# from django.shortcuts import get_object_or_404
# from django.contrib.contenttypes.models import ContentType
# from rest_framework_simplejwt.views import TokenObtainPairView
# from carrito.models import LocalidadArgentina
# from django.contrib.auth.hashers import check_password






# # Usaremos Viewsets para definir la logica de nuestras API REST
# # Los Viewsets proporcionan una forma sencilla de manejar las operaciones CRUD (Crear, Leer,
# # Actualizar, Eliminar) para nuestros modelos.
# class UsuarioViewSet(viewsets.ModelViewSet):
#     queryset = User.objects.all()
#     serializer_class = UsuarioSerializer

#     @action(detail=False, methods=["post"], permission_classes=[AllowAny])
#     def register(self, request):
#         serializer = self.get_serializer(data=request.data)
#         if serializer.is_valid():
#             user = serializer.save()
#             refresh = RefreshToken.for_user(user)
#             return Response({
#                 "user": UsuarioSerializer(user, context={"request": request}).data,
#                 "refresh": str(refresh),
#                 "access": str(refresh.access_token),
#             }, status=status.HTTP_201_CREATED)
#         return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    
#     # CAMBIO DE PASSWORD 
#     @action(detail=True, methods=['post'], url_path='change_password')
#     def change_password(self, request, pk=None):
#         user = self.get_object()
#         old_password = request.data.get('old_password')
#         new_password = request.data.get('new_password')
#         confirm_password = request.data.get('confirm_password')

#         if not check_password(old_password, user.password):
#             return Response({'error': 'La contraseña actual no es correcta.'},
#                             status=status.HTTP_400_BAD_REQUEST)

#         if new_password != confirm_password:
#             return Response({'error': 'Las contraseñas nuevas no coinciden.'},
#                             status=status.HTTP_400_BAD_REQUEST)

#         user.set_password(new_password)
#         user.save()

#         return Response({'success': 'Contraseña cambiada correctamente.'},
#                         status=status.HTTP_200_OK)


# @api_view(['GET'])
# @permission_classes([IsAuthenticated])
# def usuario_actual(request):
#     user=request.user
#     serializer=UsuarioSerializer(user,context={'request':request})
#     return Response(serializer.data)



# class ProfileViewSet(viewsets.ModelViewSet):
#     """
#     ViewSet para gestionar perfiles de usuario
#     """
#     serializer_class = ProfileSerializer
#     permission_classes = [IsAuthenticated]
    
#     def get_queryset(self):
#         """Solo devuelve el perfil del usuario autenticado"""
#         return Perfil.objects.filter(user=self.request.user)
    
#     def get_object(self):
#         """Obtiene el perfil del usuario autenticado"""
#         perfil, created = Perfil.objects.get_or_create(user=self.request.user)
#         return perfil

    
#     def list(self, request):
#         """GET /api/perfil/ - Obtiene el perfil del usuario"""
#         perfil = self.get_object()
#         serializer = self.get_serializer(perfil)
#         return Response(serializer.data)
    
   
#     def update(self, request, pk=None):
#         """PUT /api/perfil/ - Actualiza el perfil completo"""
#         perfil = self.get_object()
#         serializer = ProfileUpdateSerializer(perfil, data=request.data)
#         if serializer.is_valid():
#             serializer.save()
#             # Devuelve el perfil completo actualizado
# <<<<<<< HEAD
#             full_serializer = ProfileSerializer(profile,context={'request':request})
# =======
#             full_serializer = ProfileSerializer(perfil)
# >>>>>>> pabloBackend
#             return Response(full_serializer.data)
#         return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    
    
#     def partial_update(self, request, pk=None):
#         """PATCH /api/perfil/ - Actualiza parcialmente el perfil"""
#         perfil = self.get_object()
#         serializer = ProfileUpdateSerializer(perfil, data=request.data, partial=True)
#         if serializer.is_valid():
#             serializer.save()
# <<<<<<< HEAD
#             full_serializer = ProfileSerializer(profile,context={'request':request})
# =======
#             full_serializer = ProfileSerializer(perfil)
# >>>>>>> pabloBackend
#             return Response(full_serializer.data)
#         return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    
#     @action(detail=False, methods=['get'])
#     def me(self, request):
#         """GET /api/perfil/me/ - Obtiene el perfil del usuario actual"""
#         perfil = self.get_object()
#         serializer = self.get_serializer(perfil)
#         return Response(serializer.data)
    
#     @action(detail=False, methods=['post'])
#     def add_interest(self, request):
# <<<<<<< HEAD
#         """POST /api/profile/add_interest/ - Agrega un interés
#         Body: {"nombre": "Gaming"}
# =======
#         """POST /api/perfil/add_interest/ - Agrega un interés
#         Body: {"name": "Gaming"}
# >>>>>>> pabloBackend
#         """
#         perfil = self.get_object()
#         serializer = InteresesSerializer(data=request.data)
#         if serializer.is_valid():
#             Interes.objects.get_or_create(
# <<<<<<< HEAD
#                 perfil=profile,
#                 nombre=serializer.validated_data['nombre']
#             )
#             profile_serializer = ProfileSerializer(profile,context={'request':request})
# =======
#                 perfil=perfil,
#                 name=serializer.validated_data['name']
#             )
#             profile_serializer = ProfileSerializer(perfil)
# >>>>>>> pabloBackend
#             return Response(profile_serializer.data, status=status.HTTP_201_CREATED)
#         return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    
#     @action(detail=False, methods=['delete'])
#     def remove_interest(self, request):
# <<<<<<< HEAD
#         """DELETE /api/profile/remove_interest/ - Elimina un interés
#         Body: {"nombre": "Gaming"}
#         """
#         profile = self.get_object()
#         nombre = request.data.get('nombre')
#         if not nombre:
# =======
#         """DELETE /api/perfil/remove_interest/ - Elimina un interés
#         Body: {"name": "Gaming"}
#         """
#         perfil = self.get_object()
#         name = request.data.get('name')
#         if not name:
# >>>>>>> pabloBackend
#             return Response(
#                 {'error': 'El nombre del interés es requerido'},
#                 status=status.HTTP_400_BAD_REQUEST
#             )
        
#         try:
# <<<<<<< HEAD
#             interest = Interes.objects.get(profile=profile, nombre=nombre)
#             interest.delete()
#             profile_serializer = ProfileSerializer(profile,context={'request':request})
# =======
#             interest = Interes.objects.get(perfil=perfil, name=name)
#             interest.delete()
#             profile_serializer = ProfileSerializer(perfil)
# >>>>>>> pabloBackend
#             return Response(profile_serializer.data)
#         except Interes.DoesNotExist:
#             return Response(
#                 {'error': 'Interés no encontrado'},
#                 status=status.HTTP_404_NOT_FOUND
#             )
    
#     @action(detail=False, methods=['get', 'put', 'patch'])
#     def pc_specs(self, request):
#         """
#         GET /api/perfil/pc_specs/ - Obtiene las especificaciones del PC
#         PUT /api/perfil/pc_specs/ - Actualiza las especificaciones del PC
#         PATCH /api/perfil/pc_specs/ - Actualiza parcialmente las especificaciones
        
#         Body para PUT/PATCH:
#         {
#             "cpu": 1,
#             "gpu": 5,
#             "ram": 3,
#             "disco": 2,
#             "motherboard": 4,
#         }
#         """
#         perfil = self.get_object()
        
#         # Crear PCSpecification si no existe
#         pc_spec, created = PCEspecificacion.objects.get_or_create(perfil=perfil)
        
#         if request.method == 'GET':
#             serializer = PCEspecificacionSerializer(pc_spec)
#             return Response(serializer.data)
        
#         elif request.method in ['PUT', 'PATCH']:
#             partial = request.method == 'PATCH'
#             serializer = PCEspecificacionSerializer(
#                 pc_spec, 
#                 data=request.data, 
#                 partial=partial
#             )
#             if serializer.is_valid():
#                 serializer.save()
#                 return Response(serializer.data)
#             return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    
#     # SECCION DE FAVORITOS 
#     @action(detail=False, methods=['get'])
#     def favorites(self, request):
#         """GET /api/perfil/favorites/ - Obtiene todos los productos favoritos"""
#         perfil = request.user.perfil
#         favoritos = FavoritoProducto.objects.filter(perfil=perfil)
#         serializer = FavoritoProductoSerializer(favoritos, many=True)
#         return Response(serializer.data)
    
#     @action(detail=False, methods=['post'])
#     def add_favorite(self, request):
#         """POST /api/perfil/add_favorite/ - Agrega un producto a favoritos
#         Body: {
#             "product_type": "cpu",  // cpu, gpu, ram, disco, motherboard, etc.
#             "product_id": 5
#         }
#         """
#         print(request.data)    
#         perfil =request.user.perfil
#         product_type = request.data.get('product_type')
#         product_id = request.data.get('product_id')
#         print(f"Producto_type = {product_type}, product_id={product_id}")

        
#         if not product_type or not product_id:
#             return Response(
#                 {'error': 'product_type y product_id son requeridos'},
#                 status=status.HTTP_400_BAD_REQUEST
#             )
        
#         try:
#             # Obtener el ContentType del modelo
#             content_type = ContentType.objects.get(model=product_type.lower())
#             model_class = content_type.model_class()
            
#             # Verificar que el producto existe
#             producto = get_object_or_404(model_class, id=product_id)
            
#             # Crear o obtener el favorito
#             favorite, created = FavoritoProducto.objects.get_or_create(
#                 perfil=perfil,
#                 content_type=content_type,
#                 object_id=product_id
#             )
            
#             if created:
#                 serializer = FavoritoProductoSerializer(favorite)
#                 return Response(serializer.data, status=status.HTTP_201_CREATED)
#             else:
#                 return Response(
#                     {'message': 'Este producto ya está en favoritos'},
#                     status=status.HTTP_200_OK
#                 )
        
#         except ContentType.DoesNotExist:
#             return Response(
#                 {'error': f'Tipo de producto "{product_type}" no válido'},
#                 status=status.HTTP_400_BAD_REQUEST
#             )
    
#     @action(detail=False, methods=['delete'])
#     def remove_favorite(self, request):
#         """DELETE /api/perfil/remove_favorite/ - Elimina un producto de favoritos
#         Body: {
#             "favorite_id": 5
#         }
#         O:
#         {
#             "product_type": "cpu",
#             "product_id": 5
#         }
#         """
#         perfil = request.user.perfil
#         favorite_id = request.data.get('favorite_id')
        
#         if favorite_id:
#             # Eliminar por ID del favorito
#             try:
#                 favorite = FavoritoProducto.objects.get(id=favorite_id, perfil=perfil)
#                 favorite.delete()
#                 return Response(
#                     {'message': 'Producto eliminado de favoritos'},
#                     status=status.HTTP_200_OK
#                 )
#             except FavoritoProducto.DoesNotExist:
#                 return Response(
#                     {'error': 'Favorito no encontrado'},
#                     status=status.HTTP_404_NOT_FOUND
#                 )
#         else:
#             # Eliminar por tipo y ID de producto
#             product_type = request.data.get('product_type')
#             product_id = request.data.get('product_id')
            
#             if not product_type or not product_id:
#                 return Response(
#                     {'error': 'favorite_id o (product_type y product_id) son requeridos'},
#                     status=status.HTTP_400_BAD_REQUEST
#                 )
            
#             try:
#                 content_type = ContentType.objects.get(model=product_type.lower())
#                 favorite = FavoritoProducto.objects.get(
#                     perfil=perfil,
#                     content_type=content_type,
#                     object_id=product_id
#                 )
#                 favorite.delete()
#                 return Response(
#                     {'message': 'Producto eliminado de favoritos'},
#                     status=status.HTTP_200_OK
#                 )
#             except (ContentType.DoesNotExist, FavoritoProducto.DoesNotExist):
#                 return Response(
#                     {'error': 'Favorito no encontrado'},
#                     status=status.HTTP_404_NOT_FOUND
#                 )
            
#     @action(detail=False, methods=['post'], url_path='change_password')
#     def change_password(self, request):
#         user = request.user
#         old_password = request.data.get('old_password')
#         new_password = request.data.get('new_password')

#         if not user.check_password(old_password):
#             return Response({'error': 'Contraseña actual incorrecta'}, status=status.HTTP_400_BAD_REQUEST)

#         user.set_password(new_password)
#         user.save()
#         return Response({'success': 'Contraseña actualizada correctamente'}, status=status.HTTP_200_OK)




# class CustomTokenObtainPairView(TokenObtainPairView):
#     serializer_class = CustomTokenObtainPairSerializer



# @api_view(['GET'])
# @permission_classes([IsAuthenticated])
# def obtener_costo_envio(request):
#     user = request.user

#     try:
#         usuario_extra = UsuarioExtra.objects.get(usuario=user)
#         codigo_postal = usuario_extra.codigo_postal
#         localidad = get_object_or_404(LocalidadArgentina, codigo_postal=str(codigo_postal))

#         return Response({
#             "costo_envio": localidad.costo_envio,
#             "localidad": localidad.localidad  # 👈 devolvemos también el nombre
#         })
#     except UsuarioExtra.DoesNotExist:
#         return Response({"error": "Usuario sin código postal"}, status=400)
#     except Exception as e:
#         return Response({"error": str(e)}, status=400)
