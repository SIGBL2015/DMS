from django.conf import settings
from django.core.mail import send_mail
from django.template.loader import render_to_string
from django.utils import timezone
from datetime import timedelta
from ..models import User, PayrollWorkflowTask, AuditLog

class NotificationService:
    """
    Service for sending intelligent notifications to users based on their preferences
    and the urgency of the task.
    """
    
    def __init__(self):
        self.default_from_email = getattr(settings, 'DEFAULT_FROM_EMAIL', 'noreply@example.com')
        self.sms_api_key = getattr(settings, 'SMS_API_KEY', None)
        self.push_api_key = getattr(settings, 'PUSH_API_KEY', None)
    
    def get_optimal_channel(self, user, task):
        """
        Determine the optimal notification channel for a user based on their preferences
        and the urgency of the task.
        
        Args:
            user: The user to notify
            task: The task that requires notification
            
        Returns:
            str: The optimal notification channel ('email', 'sms', or 'push')
        """
        # In a real implementation, this would check user preferences
        # For now, we'll use a simple algorithm based on task urgency
        
        # Get user preferences (in a real implementation, this would come from a user profile)
        user_preferences = self._get_user_preferences(user)
        
        # Calculate task urgency (0-100)
        urgency = self._calculate_urgency(task)
        
        # Determine optimal channel based on urgency and user preferences
        if urgency > 80 and user_preferences.get('sms_enabled', True):
            return 'sms'
        elif urgency > 50 and user_preferences.get('push_enabled', True):
            return 'push'
        else:
            return 'email'
    
    def _get_user_preferences(self, user):
        """
        Get user notification preferences.
        In a real implementation, this would come from a user profile.
        """
        # This is a placeholder for the actual user preferences
        # In a real implementation, this would come from a user profile
        return {
            'email_enabled': True,
            'sms_enabled': True,
            'push_enabled': True,
            'quiet_hours_start': '22:00',
            'quiet_hours_end': '08:00',
            'notification_frequency': 'immediate'  # 'immediate', 'daily', 'weekly'
        }
    
    def _calculate_urgency(self, task):
        """
        Calculate the urgency of a task (0-100).
        """
        urgency = 50  # Default urgency
        
        # Check if task is overdue
        if task.due_date and task.due_date < timezone.now():
            urgency += 30
        
        # Check if task is due soon
        elif task.due_date and task.due_date < timezone.now() + timedelta(days=1):
            urgency += 20
        
        # Check if task is part of a critical workflow
        if task.workflow_instance.workflow.name in ['Critical Payroll Processing', 'Emergency Payment']:
            urgency += 20
        
        # Check if task has been reassigned multiple times
        reassignment_count = PayrollWorkflowTask.objects.filter(
            workflow_instance=task.workflow_instance,
            step=task.step
        ).count()
        
        if reassignment_count > 2:
            urgency += 10
        
        # Cap urgency at 100
        return min(urgency, 100)
    
    def create_personalized_message(self, task, user):
        """
        Create a personalized message for a user based on the task.
        
        Args:
            task: The task that requires notification
            user: The user to notify
            
        Returns:
            str: The personalized message
        """
        # Get task details
        workflow_name = task.workflow_instance.workflow.name
        step_name = task.step.name
        calculation = task.workflow_instance.payroll_calculation
        employee_name = calculation.employee.get_full_name()
        due_date = task.due_date.strftime('%B %d, %Y') if task.due_date else 'No due date'
        
        # Create personalized message
        message = f"Hello {user.get_full_name() or user.username},\n\n"
        message += f"You have a task in the {workflow_name} workflow.\n"
        message += f"Step: {step_name}\n"
        message += f"Employee: {employee_name}\n"
        message += f"Due Date: {due_date}\n\n"
        
        if task.due_date and task.due_date < timezone.now():
            message += "This task is overdue. Please take action as soon as possible.\n\n"
        elif task.due_date and task.due_date < timezone.now() + timedelta(days=1):
            message += "This task is due soon. Please take action.\n\n"
        
        message += "You can view and take action on this task by clicking the link below:\n"
        message += f"{settings.SITE_URL}/payroll/workflows/tasks/{task.pk}/\n\n"
        message += "Thank you,\nPayroll System"
        
        return message
    
    def send_notification(self, user, task):
        """
        Send a notification to a user about a task.
        
        Args:
            user: The user to notify
            task: The task that requires notification
        """
        # Determine optimal channel
        channel = self.get_optimal_channel(user, task)
        
        # Create personalized message
        message = self.create_personalized_message(task, user)
        
        # Send notification through the optimal channel
        if channel == 'email':
            self.send_email(user.email, message)
        elif channel == 'sms':
            self.send_sms(user.profile.phone_number, message)
        elif channel == 'push':
            self.send_push_notification(user.profile.device_id, message)
        
        # Log the notification
        self._log_notification(user, task, channel)
    
    def send_email(self, email, message, subject=None):
        """
        Send an email notification.
        
        Args:
            email: The recipient's email address
            message: The message to send
            subject: The email subject (optional)
        """
        if subject is None:
            subject = 'Payroll Task Notification'
        
        send_mail(
            subject=subject,
            message=message,
            from_email=self.default_from_email,
            recipient_list=[email],
            fail_silently=False,
        )
    
    def send_sms(self, phone_number, message):
        """
        Send an SMS notification.
        
        Args:
            phone_number: The recipient's phone number
            message: The message to send
        """
        # This is a placeholder for the actual SMS sending logic
        # In a real implementation, this would use an SMS service like Twilio
        print(f"Sending SMS to {phone_number}: {message}")
    
    def send_push_notification(self, device_id, message):
        """
        Send a push notification.
        
        Args:
            device_id: The recipient's device ID
            message: The message to send
        """
        # This is a placeholder for the actual push notification logic
        # In a real implementation, this would use a push notification service
        print(f"Sending push notification to device {device_id}: {message}")
    
    def schedule_notification(self, user, task, delay_days=1):
        """
        Schedule a notification for a future date.
        
        Args:
            user: The user to notify
            task: The task that requires notification
            delay_days: Number of days to delay the notification
        """
        # This is a placeholder for the actual scheduling logic
        # In a real implementation, this would use a task queue like Celery
        print(f"Scheduling notification for {user.username} about task {task.id} in {delay_days} days")
    
    def _log_notification(self, user, task, channel):
        """
        Log a notification for audit purposes.
        
        Args:
            user: The user who was notified
            task: The task that required notification
            channel: The notification channel used
        """
        AuditLog.objects.create(
            user=user,
            action='NOTIFICATION',
            model_name='PayrollWorkflowTask',
            object_id=str(task.id),
            details=f'Sent {channel} notification for task {task.id}',
            ip_address=None,
            user_agent=None
        ) 