from zk import ZK
import logging
from datetime import datetime, timedelta
from .models import EmployeeAttendance, Employee

logger = logging.getLogger(__name__)

class ZKTecoDevice:
    def __init__(self, ip, port=4370, timeout=5):
        self.ip = ip
        self.port = port
        self.timeout = timeout
        self.device = None

    def connect(self):
        """Connect to the ZKTeco device"""
        try:
            self.device = ZK(self.ip, port=self.port, timeout=self.timeout)
            return self.device.connect()
        except Exception as e:
            logger.error(f"Failed to connect to ZKTeco device: {str(e)}")
            raise

    def disconnect(self):
        """Disconnect from the ZKTeco device"""
        if self.device:
            self.device.disconnect()

    def get_attendance(self, start_date=None, end_date=None):
        """Get attendance records from the device"""
        if not start_date:
            start_date = datetime.now() - timedelta(days=1)
        if not end_date:
            end_date = datetime.now()

        try:
            conn = self.connect()
            attendance_records = conn.get_attendance()
            records = []

            for record in attendance_records:
                if start_date <= record.timestamp <= end_date:
                    try:
                        # Try to find employee by device user ID
                        employee = Employee.objects.get(device_user_id=record.user_id)
                        records.append({
                            'employee': employee,
                            'date': record.timestamp.date(),
                            'clock_in': record.timestamp.time(),
                            'status': 'PRESENT'
                        })
                    except Employee.DoesNotExist:
                        logger.warning(f"Employee not found for device user ID: {record.user_id}")
                        continue

            return records

        except Exception as e:
            logger.error(f"Error getting attendance from device: {str(e)}")
            raise
        finally:
            self.disconnect()

    def sync_attendance(self, start_date=None, end_date=None):
        """Sync attendance records from device to database"""
        records = self.get_attendance(start_date, end_date)
        created_count = 0

        for record in records:
            # Check if record already exists
            if not EmployeeAttendance.objects.filter(
                employee=record['employee'],
                date=record['date']
            ).exists():
                EmployeeAttendance.objects.create(**record)
                created_count += 1

        return created_count 