from django.shortcuts import redirect
from django.urls import reverse
from django.contrib import messages
from django.utils import timezone
from .models import SecuritySettings, AuditLog
from django.conf import settings
import re

class SecurityMiddleware:
    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        if not request.user.is_authenticated:
            return self.get_response(request)

        # Skip security checks for certain paths
        if self._should_skip_security(request.path):
            return self.get_response(request)

        # Check IP whitelist
        if not self._check_ip_whitelist(request):
            messages.error(request, "Access denied: IP not in whitelist")
            return redirect('login')

        # Check session timeout
        if self._check_session_timeout(request):
            messages.warning(request, "Session expired. Please login again.")
            return redirect('login')

        # Check MFA requirement
        if self._require_mfa(request):
            if not request.session.get('mfa_verified'):
                return redirect('mfa_verify')

        response = self.get_response(request)
        return response

    def _should_skip_security(self, path):
        skip_paths = [
            '/login/',
            '/logout/',
            '/mfa/',
            '/static/',
            '/media/',
        ]
        return any(path.startswith(p) for p in skip_paths)

    def _check_ip_whitelist(self, request):
        try:
            security_settings = SecuritySettings.objects.first()
            if not security_settings or not security_settings.ip_whitelist:
                return True

            client_ip = self._get_client_ip(request)
            whitelist = [ip.strip() for ip in security_settings.ip_whitelist.split('\n')]
            
            for ip in whitelist:
                if self._ip_matches(client_ip, ip):
                    return True
            return False
        except Exception:
            return True

    def _check_session_timeout(self, request):
        try:
            security_settings = SecuritySettings.objects.first()
            if not security_settings:
                return False

            last_activity = request.session.get('last_activity')
            if not last_activity:
                return True

            timeout_minutes = security_settings.session_timeout_minutes
            last_activity = timezone.datetime.fromisoformat(last_activity)
            if (timezone.now() - last_activity).total_seconds() > (timeout_minutes * 60):
                return True

            request.session['last_activity'] = timezone.now().isoformat()
            return False
        except Exception:
            return False

    def _require_mfa(self, request):
        try:
            security_settings = SecuritySettings.objects.first()
            if not security_settings or not security_settings.require_mfa:
                return False

            # Skip MFA for certain paths
            if request.path in ['/mfa/verify/', '/mfa/setup/']:
                return False

            return True
        except Exception:
            return False

    def _get_client_ip(self, request):
        x_forwarded_for = request.META.get('HTTP_X_FORWARDED_FOR')
        if x_forwarded_for:
            return x_forwarded_for.split(',')[0]
        return request.META.get('REMOTE_ADDR')

    def _ip_matches(self, client_ip, whitelist_ip):
        # Convert IP patterns to regex
        pattern = whitelist_ip.replace('.', r'\.').replace('*', r'\d+')
        return bool(re.match(f'^{pattern}$', client_ip))

class AuditLogMiddleware:
    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        response = self.get_response(request)

        if request.user.is_authenticated:
            self._log_request(request, response)

        return response

    def _log_request(self, request, response):
        try:
            # Skip logging for certain paths
            if self._should_skip_logging(request.path):
                return

            action = self._determine_action(request)
            if not action:
                return

            AuditLog.objects.create(
                user=request.user,
                action=action,
                model_name=self._get_model_name(request),
                object_id=self._get_object_id(request),
                details=self._get_request_details(request),
                ip_address=self._get_client_ip(request),
                user_agent=request.META.get('HTTP_USER_AGENT', ''),
                metadata={
                    'method': request.method,
                    'path': request.path,
                    'status_code': response.status_code,
                }
            )
        except Exception:
            pass

    def _should_skip_logging(self, path):
        skip_paths = [
            '/static/',
            '/media/',
            '/favicon.ico',
        ]
        return any(path.startswith(p) for p in skip_paths)

    def _determine_action(self, request):
        if request.method == 'GET':
            return 'VIEW'
        elif request.method == 'POST':
            return 'CREATE'
        elif request.method == 'PUT':
            return 'UPDATE'
        elif request.method == 'DELETE':
            return 'DELETE'
        return None

    def _get_model_name(self, request):
        path_parts = request.path.strip('/').split('/')
        if len(path_parts) >= 2:
            return path_parts[1].title()
        return ''

    def _get_object_id(self, request):
        path_parts = request.path.strip('/').split('/')
        if len(path_parts) >= 3 and path_parts[2].isdigit():
            return path_parts[2]
        return ''

    def _get_request_details(self, request):
        details = []
        if request.GET:
            details.append(f"Query params: {dict(request.GET)}")
        if request.POST:
            details.append(f"Form data: {dict(request.POST)}")
        return ' | '.join(details)

    def _get_client_ip(self, request):
        x_forwarded_for = request.META.get('HTTP_X_FORWARDED_FOR')
        if x_forwarded_for:
            return x_forwarded_for.split(',')[0]
        return request.META.get('REMOTE_ADDR') 