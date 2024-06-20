import os
import django
import logging
import sys

# Add the project directory to the PYTHONPATH
sys.path.append('/var/www/html/dms')

# Set the DJANGO_SETTINGS_MODULE environment variable
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'doc_management_system.settings')

# Configure Django
django.setup()

from datetime import datetime, timedelta
from django.core.mail import send_mail
from django.utils import timezone
from employee.models import Project
from django.conf import settings
from smtplib import SMTPException

logging.basicConfig(level=logging.INFO, filename='/var/www/html/dms/employee/cron.log', filemode='a', format='%(name)s - %(levelname)s - %(message)s')
logger = logging.getLogger(__name__)

def em_expiry_check_job():
    try:
       now = timezone.now().date()  # Convert to date to remove time part
       first_day_of_month = now.replace(day=1)
       next_month = (first_day_of_month + timedelta(days=32)).replace(day=1)
       last_day_of_month = next_month - timedelta(days=1)
       print(f"Last day of month: {last_day_of_month}")
       logger.info(f"First day of month: {first_day_of_month.isoformat()}")
       logger.info(f"Last day of month: {last_day_of_month.isoformat()}")

       em_expiring_this_month = Project.objects.filter(em_expire_date__range=(first_day_of_month, last_day_of_month))
       logger.info(f"ems found: {em_expiring_this_month}")
       if em_expiring_this_month.exists():
            em_list = "\n".join([f"{em.title} - {em.em_expire_date}" for em in em_expiring_this_month])
            subject = "EM Expiring This Month"
            message = f"The following EMs are expiring this month:\n\n{em_list}"
            from_email = settings.DEFAULT_FROM_EMAIL
            recipient_list = ['', '']

            try:
               send_mail(subject, message, from_email, recipient_list)
               logger.info("Expiry emails sent successfully.")
            except SMTPException as e:
                logger.error(f"SMTPException occurred: {e}", exc_info=True)
            except Exception as e:
                logger.error(f"Error sending email: {e}", exc_info=True)
        #else:
         #   logger.info("No ems expiring this month.")
    except Exception as e:
        logger.error(f"Error sending expiry emails: {e}")

if __name__ == "__main__":
    logger.info("Starting send_expiry_emails script")
    em_expiry_check_job()
    logger.info("Finished send_expiry_emails script")
