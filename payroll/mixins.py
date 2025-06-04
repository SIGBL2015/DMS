from django.core.exceptions import PermissionDenied
from django.shortcuts import redirect
from django.contrib import messages
from django.urls import reverse_lazy
from .models import PayrollPermission, AuditLog
from functools import wraps
from django.http import HttpResponseRedirect

def has_payroll_permission(module, permission_type):
    """
    Decorator to check if a user has a specific payroll permission
    """
    def decorator(view_func):
        @wraps(view_func)
        def _wrapped_view(request, *args, **kwargs):
            # Superusers always have permission
            if request.user.is_superuser:
                return view_func(request, *args, **kwargs)
                
            # Check if user has the specific permission
            has_permission = PayrollPermission.objects.filter(
                user=request.user,
                module=module,
                permission_type=permission_type
            ).exists()
            
            if not has_permission:
                messages.error(request, f"You don't have permission to {permission_type.lower()} {module}.")
                return redirect('payroll:dashboard')
                
            return view_func(request, *args, **kwargs)
        return _wrapped_view
    return decorator

class PayrollPermissionMixin:
    """
    Mixin to add permission checking to class-based views
    """
    module = None
    permission_type = None
    
    def has_permission(self):
        # Superusers always have permission
        if self.request.user.is_superuser:
            return True
            
        # Check if user has the specific permission
        return PayrollPermission.objects.filter(
            user=self.request.user,
            module=self.module,
            permission_type=self.permission_type
        ).exists()
    
    def dispatch(self, request, *args, **kwargs):
        if not self.has_permission():
            messages.error(request, f"You don't have permission to {self.permission_type.lower()} {self.module}.")
            return redirect('payroll:dashboard')
        return super().dispatch(request, *args, **kwargs)

def log_audit(user, action, model_name, object_id, details='', ip_address=None):
    """
    Helper function to log audit events
    """
    return AuditLog.objects.create(
        user=user,
        action=action,
        model_name=model_name,
        object_id=object_id,
        details=details,
        ip_address=ip_address
    )

class SoftDeleteMixin:
    """
    Mixin to perform a soft-delete by marking is_active=False if available.
    """
    def delete(self, request, *args, **kwargs):
        self.object = self.get_object()
        if hasattr(self.object, 'is_active'):
            self.object.is_active = False
            self.object.save()
        else:
            self.object.delete()
        return HttpResponseRedirect(self.get_success_url()) 