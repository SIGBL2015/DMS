import os
import json
from django.conf import settings
from django.core.files.storage import default_storage
from django.core.files.base import ContentFile
from .models import PayrollCalculation, PayrollWorkflow, PayrollWorkflowInstance

class DocumentProcessor:
    """
    Service for processing payroll documents using AI/OCR to extract information
    and automatically create payroll calculations and workflow instances.
    """
    
    def __init__(self):
        # Initialize any required API clients or services
        self.api_key = getattr(settings, 'DOCUMENT_PROCESSING_API_KEY', None)
        self.api_endpoint = getattr(settings, 'DOCUMENT_PROCESSING_API_ENDPOINT', None)
    
    def process_document(self, document_file, document_type):
        """
        Process a document file and extract relevant information.
        
        Args:
            document_file: The uploaded document file
            document_type: Type of document (e.g., 'PAYSLIP', 'TAX_FORM')
            
        Returns:
            dict: Extracted data from the document
        """
        # In a real implementation, this would call an external API
        # For now, we'll simulate the extraction process
        
        # Save the file temporarily
        file_path = default_storage.save(f'temp/{document_file.name}', ContentFile(document_file.read()))
        
        try:
            # Simulate API call to document processing service
            extracted_data = self._simulate_extraction(file_path, document_type)
            
            # Clean up the temporary file
            default_storage.delete(file_path)
            
            return extracted_data
        except Exception as e:
            # Clean up the temporary file in case of error
            default_storage.delete(file_path)
            raise e
    
    def _simulate_extraction(self, file_path, document_type):
        """
        Simulate the extraction of data from a document.
        In a real implementation, this would call an external API.
        """
        # This is a placeholder for the actual API call
        # In a real implementation, this would use a service like Google Cloud Vision,
        # Amazon Textract, or a similar OCR service
        
        # For demonstration purposes, we'll return mock data
        if document_type == 'PAYSLIP':
            return {
                'employee_id': 'EMP123',
                'employee_name': 'John Doe',
                'period': '2023-05',
                'gross_salary': 5000.00,
                'total_deductions': 1000.00,
                'net_salary': 4000.00,
                'payment_date': '2023-05-31',
                'components': [
                    {'name': 'Basic Salary', 'amount': 4000.00},
                    {'name': 'Allowance', 'amount': 1000.00},
                    {'name': 'Tax', 'amount': -1000.00}
                ]
            }
        elif document_type == 'TAX_FORM':
            return {
                'employee_id': 'EMP123',
                'employee_name': 'John Doe',
                'tax_year': 2023,
                'taxable_amount': 60000.00,
                'tax_amount': 12000.00
            }
        else:
            return {}
    
    def create_payroll_calculation(self, extracted_data, user):
        """
        Create a payroll calculation based on extracted data.
        
        Args:
            extracted_data: Data extracted from the document
            user: The user who uploaded the document
            
        Returns:
            PayrollCalculation: The created payroll calculation
        """
        from ..models import Employee, PayrollPeriod, PayrollCalculation, PayrollComponentDetail
        
        # Find the employee
        try:
            employee = Employee.objects.get(employee_id=extracted_data.get('employee_id'))
        except Employee.DoesNotExist:
            # In a real implementation, you might want to create the employee
            # or handle this case differently
            raise ValueError(f"Employee with ID {extracted_data.get('employee_id')} not found")
        
        # Find or create the payroll period
        period_name = extracted_data.get('period')
        try:
            period = PayrollPeriod.objects.get(name=period_name)
        except PayrollPeriod.DoesNotExist:
            # In a real implementation, you might want to create the period
            # or handle this case differently
            raise ValueError(f"Payroll period {period_name} not found")
        
        # Create the payroll calculation
        calculation = PayrollCalculation.objects.create(
            employee=employee,
            period=period,
            gross_salary=extracted_data.get('gross_salary', 0),
            total_deductions=extracted_data.get('total_deductions', 0),
            net_salary=extracted_data.get('net_salary', 0),
            status='DRAFT',
            created_by=user
        )
        
        # Create component details
        for component_data in extracted_data.get('components', []):
            from ..models import SalaryComponent
            
            try:
                component = SalaryComponent.objects.get(name=component_data.get('name'))
            except SalaryComponent.DoesNotExist:
                # In a real implementation, you might want to create the component
                # or handle this case differently
                continue
            
            PayrollComponentDetail.objects.create(
                payroll_calculation=calculation,
                component=component,
                amount=component_data.get('amount', 0)
            )
        
        return calculation
    
    def create_workflow_instance(self, calculation, workflow_name="Standard Payroll Processing", user=None):
        """
        Create a workflow instance for a payroll calculation.
        
        Args:
            calculation: The payroll calculation
            workflow_name: Name of the workflow to use
            user: The user who initiated the workflow
            
        Returns:
            PayrollWorkflowInstance: The created workflow instance
        """
        try:
            workflow = PayrollWorkflow.objects.get(name=workflow_name, is_active=True)
        except PayrollWorkflow.DoesNotExist:
            raise ValueError(f"Workflow {workflow_name} not found or not active")
        
        # Create the workflow instance
        instance = PayrollWorkflowInstance.objects.create(
            workflow=workflow,
            payroll_calculation=calculation,
            status='PENDING',
            created_by=user
        )
        
        return instance 