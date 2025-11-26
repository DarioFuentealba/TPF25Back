
from rest_framework import serializers
from django.contrib.auth.models import User
from django.contrib.auth.password_validation import validate_password
from .models import Interes,PCEspecificacion,FavoritoProducto, Perfil,UsuarioExtra
from rest_framework_simplejwt.serializers import TokenObtainPairSerializer


class UsuarioSerializer(serializers.ModelSerializer):
    password = serializers.CharField(write_only=True, required=True, validators=[validate_password])
    password2 = serializers.CharField(write_only=True, required=True)
    codigo_postal = serializers.CharField(write_only=True, required=True)  # <-- obligatorio en POST

    class Meta:
        model = User
        fields = ['url', 'id', 'username', 'email', 'first_name', 'last_name', 'password', 'password2','is_superuser','codigo_postal','date_joined']
        extra_kwargs = {
            'url': {'view_name': 'usuario-detail', 'lookup_field': 'pk'},
            'first_name': {'required': False, 'allow_blank': True},
            'last_name': {'required': False, 'allow_blank': True},
            'email': {'required': True},
        }

    def validate(self, attrs):
        if attrs['password'] != attrs['password2']:
            raise serializers.ValidationError({"password": "Las contraseñas no coinciden"})
        return attrs

    def create(self, validated_data):
        codigo_postal = validated_data.pop('codigo_postal')
        validated_data.pop('password2')
        user = User.objects.create_user(
            username=validated_data['username'],
            email=validated_data['email'],
            first_name=validated_data.get('first_name', ''),
            last_name=validated_data.get('last_name', ''),
            password=validated_data['password']
        )
       # Perfil.objects.create(usuario=user)
        # Crear UsuarioExtra y guardar el código postal
        UsuarioExtra.objects.create(usuario=user, codigo_postal=codigo_postal)

        # Agregar código postal a la respuesta
        user.codigo_postal = codigo_postal
        return user

    

    def to_representation(self, instance):
        rep = super().to_representation(instance)
        # Mostrar código postal en la respuesta
        rep['codigo_postal'] = getattr(instance, 'codigo_postal', None)
        return rep
    
    def update(self, instance, validated_data):
        instance.username = validated_data.get('username', instance.username)
        instance.email = validated_data.get('email', instance.email)
        instance.first_name = validated_data.get('first_name', instance.first_name)
        instance.last_name = validated_data.get('last_name', instance.last_name)
        instance.save()
        return instance


class InteresesSerializer(serializers.ModelSerializer):
    """Serializer para los intereses del usuario"""
    class Meta:
        model= Interes
        fields= ['id' ,'nombre']
        read_only_fields=['id']

class PCEspecificacionSerializer(serializers.ModelSerializer):
    """Serializer para las especificaciones del PC"""
    # Campos anidados para mostrar información del producto
    cpu_details = serializers.SerializerMethodField()
    gpu_details = serializers.SerializerMethodField()
    ram_details = serializers.SerializerMethodField()
    disco_details = serializers.SerializerMethodField()
    motherboard_details = serializers.SerializerMethodField()

    
    class Meta:
        model = PCEspecificacion
        fields = [
            'id', 'cpu', 'gpu', 'ram', 'disco', 
            'motherboard',
            'cpu_details', 'gpu_details', 'ram_details',
            'disco_details', 'motherboard_details',
        ]
    
    def get_cpu_details(self, obj):
        if obj.cpu:
            return {
                'id': obj.cpu.id,
                'nombre': obj.cpu.nombre,
                'precio': str(obj.cpu.precio),
                'fabricante': obj.cpu.fabricante,
                'modelo': obj.cpu.modelo,
                'nucleos': obj.cpu.nucleos,
                'foto': obj.cpu.foto1.url if obj.cpu.foto1 else None
            }
        return None
    
    def get_gpu_details(self, obj):
        if obj.gpu: 
            return {
                'id': obj.gpu.id,
                'nombre': obj.gpu.nombre,
                'precio': str(obj.gpu.precio),
                'fabricante': obj.gpu.fabricante,
                'memoria': obj.gpu.memoria_capacidad_gb,
                'foto': obj.gpu.foto1.url if obj.gpu.foto1 else None
            }
        return None
    
    def get_ram_details(self, obj):
        if obj.ram:
            return {
                'id': obj.ram.id,
                'nombre': obj.ram.nombre,
                'precio': str(obj.ram.precio),
                'fabricante': obj.ram.fabricante,
                'capacidad': obj.ram.capacidad_gb,
                'foto': obj.ram.foto1.url if obj.ram.foto1 else None
            }
        return None
    
    def get_disco_details(self, obj):
        if obj.disco:
            return {
                'id': obj.disco.id,
                'nombre': obj.disco.nombre,
                'precio': str(obj.disco.precio),
                'fabricante': obj.disco.fabricante,
                'capacidad': obj.disco.capacidad_gb,
                'foto': obj.disco.foto1.url if obj.disco.foto1 else None
            }
        return None
    
    def get_motherboard_details(self, obj):
        if obj.motherboard:
            return {
                'id': obj.motherboard.id,
                'nombre': obj.motherboard.nombre,
                'precio': str(obj.motherboard.precio),
                'fabricante': obj.motherboard.fabricante,
                'socket': obj.motherboard.socket,
                'foto': obj.motherboard.foto1.url if obj.motherboard.foto1 else None
            }
        return None


class FavoritoProductoSerializer(serializers.ModelSerializer):
    """Serializer para productos favoritos"""
    product_details = serializers.SerializerMethodField()
    product_type = serializers.SerializerMethodField()
    
    class Meta:
        model = FavoritoProducto
        fields = ['id', 'added_at', 'product_type', 'product_details', 'content_type', 'object_id']
        read_only_fields = ['id', 'added_at']
    
    def get_product_details(self, obj):
        if obj.producto:
            return {
                'id': obj.object_id,
                'nombre': obj.producto.nombre,
                'precio': str(obj.producto.precio),
                'fabricante': obj.producto.fabricante,
                'stock': obj.producto.stock,
                'oferta': obj.producto.oferta,
                'foto': getattr(obj.producto, 'foto1', None).url if hasattr(obj.producto, 'foto1') and obj.producto.foto1 else None
            }
        return None
    
    def get_product_type(self, obj):
        return obj.content_type.model if obj.content_type else None


class ProfileSerializer(serializers.ModelSerializer):
    """Serializer completo del perfil con toda la información anidada"""
    user = UsuarioSerializer(read_only=True)
    interes = InteresesSerializer(many=True, read_only=True)
    pc_specs = PCEspecificacionSerializer(read_only=True)
    favoritos = FavoritoProductoSerializer(many=True, read_only=True)
    favoritos_count = serializers.SerializerMethodField()
    
    class Meta:
        model = Perfil
        fields = [
            'id', 'user', 'biografia', 'avatar', 'experiencia',
             'interes', 'pc_specs',
            'favoritos', 'favoritos_count'
        ]
        read_only_fields = ['id']
    
    def get_favoritos_count(self, obj):
        return obj.favoritos.count()


class ProfileUpdateSerializer(serializers.ModelSerializer):
    """Serializer simplificado para actualizar el perfil"""
    class Meta:
        model = Perfil
        fields = ['biografia', 'avatar', 'experiencia']


# GUARDA EN EL TOKEN DE ACCESSO EL NOMBRE Y SI EL USUARIO ES ADMINISTRADOR
class CustomTokenObtainPairSerializer(TokenObtainPairSerializer):
    default_error_messages={"no_active_account":"Usuario o contraseña incorrecta. Inténtelo uevamente"}

    @classmethod
    def get_token(cls, user):
        token = super().get_token(user)
        # Agregamos más datos
        token['username'] = user.username
        token['is_superuser'] = user.is_superuser
        return token
