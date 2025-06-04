import os

from django.core.exceptions import ValidationError

def validate_allowed_file_type(file, allowed_extensions=None):
    if not file:
        return  # No file to validate

    if allowed_extensions is None:
        allowed_extensions = ['.pdf', '.doc', '.docx', '.jpg', '.jpeg', '.png']

    ext = os.path.splitext(file.name)[1].lower()
    if ext not in allowed_extensions:
        raise ValidationError(f"Invalid file type: {ext}. Allowed types are: {', '.join(allowed_extensions)}.")