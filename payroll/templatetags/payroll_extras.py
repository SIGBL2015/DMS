from django import template

register = template.Library()

@register.filter
def action_badge(action):
    """Returns the appropriate Bootstrap badge color for an audit log action."""
    badge_colors = {
        'CREATE': 'success',
        'UPDATE': 'info',
        'DELETE': 'danger',
        'VIEW': 'secondary',
        'LOGIN': 'primary',
        'LOGOUT': 'warning',
        'EXPORT': 'dark',
        'IMPORT': 'dark',
        'APPROVE': 'success',
        'REJECT': 'danger',
        'CALCULATE': 'info',
        'PAY': 'success',
        'CANCEL': 'danger',
    }
    return badge_colors.get(action, 'secondary')

@register.filter(name='add_class')
def add_class(field, css_class):
    return field.as_widget(attrs={"class": css_class}) 