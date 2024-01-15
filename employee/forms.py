from django import forms  
from employee.models import Employee, Department, Designation, Region, Education, Employement_Record, Certifications, Skills

class EmployeeForm(forms.ModelForm):  
    class Meta:  
        model = Employee  
        fields = "__all__"  

class DepartmentForm(forms.ModelForm):  
    class Meta:  
        model = Department  
        fields = ('id','depart_name')

class DesignationForm(forms.ModelForm):  
    class Meta:  
        model = Designation  
        fields = ('id','design_name')

class RegionForm(forms.ModelForm):  
    class Meta:  
        model = Region  
        fields = ('id','region_name')

class EducationForm(forms.ModelForm):  
    class Meta:  
        model = Education  
        fields = "__all__"

class Employement_RecordForm(forms.ModelForm):  
    class Meta:  
        model = Employement_Record  
        fields = "__all__"

class CertificationsForm(forms.ModelForm):  
    class Meta:  
        model = Certifications  
        fields = "__all__"

class SkillsForm(forms.ModelForm):  
    class Meta:  
        model = Skills  
        fields = "__all__"
        