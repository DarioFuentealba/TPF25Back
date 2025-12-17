# computacion/permissions.py
from rest_framework import permissions

class ProductoPermiso(permissions.BasePermission):
    """
    Todos (autenticados o no) pueden ver productos (GET),
    Solo clientes autenticados pueden comprar (POST 'comprar'),
    Administrador puede modificar cualquier producto.
    """

    def has_permission(self, request, view):
        # GET: permitido para todos
        if request.method in permissions.SAFE_METHODS:
            return True

        # POST en la acción 'comprar': solo usuarios autenticados
        if getattr(view, 'action', None) == 'comprar' and request.user.is_authenticated:
            return True

        # Otros métodos: solo admin
        return request.user.is_staff
    
class SoloAdminPermiso(permissions.BasePermission):
    """
    Permite todas las acciones solo a administradores.
    """
    
    def has_permission(self, request, view):
        # Si es un usuario administrador, permite todo
        return request.user and request.user.is_staff


class SoloAdminEditarPermiso(permissions.BasePermission):
    """
    Permite ver (GET) a todos los usuarios,
    pero solo los administradores pueden crear, modificar o eliminar.
    """
    def has_permission(self, request, view):
        if request.method in permissions.SAFE_METHODS:
            return True
        return request.user and request.user.is_staff
