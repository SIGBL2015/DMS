from django.utils import timezone
from django.db.models import Avg, Count, F, Q
from datetime import timedelta
from ..models import PayrollWorkflow, PayrollWorkflowInstance, PayrollWorkflowTask, AuditLog

class WorkflowOptimizer:
    """
    Service for analyzing workflow performance and identifying bottlenecks.
    """
    
    def analyze_workflow_performance(self, workflow_id=None, days=30):
        """
        Analyze the performance of workflows and identify bottlenecks.
        
        Args:
            workflow_id: The ID of a specific workflow to analyze (optional)
            days: Number of days to analyze (default: 30)
            
        Returns:
            dict: Analysis results including bottlenecks and recommendations
        """
        # Calculate the date range
        end_date = timezone.now()
        start_date = end_date - timedelta(days=days)
        
        # Get workflow instances in the date range
        instances = PayrollWorkflowInstance.objects.filter(
            created_at__gte=start_date,
            created_at__lte=end_date
        )
        
        if workflow_id:
            instances = instances.filter(workflow_id=workflow_id)
        
        # Analyze workflow completion time
        completion_times = self._analyze_completion_times(instances)
        
        # Analyze step performance
        step_performance = self._analyze_step_performance(instances)
        
        # Identify bottlenecks
        bottlenecks = self._identify_bottlenecks(step_performance)
        
        # Generate recommendations
        recommendations = self._generate_recommendations(bottlenecks, completion_times)
        
        return {
            'completion_times': completion_times,
            'step_performance': step_performance,
            'bottlenecks': bottlenecks,
            'recommendations': recommendations
        }
    
    def _analyze_completion_times(self, instances):
        """
        Analyze the completion time of workflows.
        
        Args:
            instances: QuerySet of PayrollWorkflowInstance objects
            
        Returns:
            dict: Analysis of completion times
        """
        # Calculate average completion time
        completed_instances = instances.filter(status='COMPLETED')
        avg_completion_time = completed_instances.annotate(
            completion_time=F('completed_at') - F('created_at')
        ).aggregate(avg_time=Avg('completion_time'))['avg_time']
        
        # Calculate completion rate
        total_instances = instances.count()
        completed_count = completed_instances.count()
        completion_rate = (completed_count / total_instances * 100) if total_instances > 0 else 0
        
        # Calculate average time per step
        avg_time_per_step = completed_instances.annotate(
            step_count=Count('tasks'),
            completion_time=F('completed_at') - F('created_at')
        ).aggregate(
            avg_time=Avg(F('completion_time') / F('step_count'))
        )['avg_time']
        
        return {
            'avg_completion_time': avg_completion_time,
            'completion_rate': completion_rate,
            'avg_time_per_step': avg_time_per_step,
            'total_instances': total_instances,
            'completed_count': completed_count
        }
    
    def _analyze_step_performance(self, instances):
        """
        Analyze the performance of individual workflow steps.
        
        Args:
            instances: QuerySet of PayrollWorkflowInstance objects
            
        Returns:
            dict: Analysis of step performance
        """
        # Get all tasks for the instances
        tasks = PayrollWorkflowTask.objects.filter(workflow_instance__in=instances)
        
        # Group tasks by step and calculate metrics
        step_metrics = tasks.values('step__name').annotate(
            total_tasks=Count('id'),
            avg_completion_time=Avg(F('completed_at') - F('created_at')),
            overdue_count=Count('id', filter=Q(
                due_date__lt=timezone.now(),
                status__in=['PENDING', 'IN_PROGRESS']
            )),
            reassignment_count=Count('id', filter=Q(
                reassigned_from__isnull=False
            ))
        )
        
        # Calculate additional metrics
        for metric in step_metrics:
            # Calculate completion rate
            completed_tasks = tasks.filter(
                step__name=metric['step__name'],
                status='COMPLETED'
            ).count()
            metric['completion_rate'] = (
                completed_tasks / metric['total_tasks'] * 100
            ) if metric['total_tasks'] > 0 else 0
            
            # Calculate overdue rate
            metric['overdue_rate'] = (
                metric['overdue_count'] / metric['total_tasks'] * 100
            ) if metric['total_tasks'] > 0 else 0
            
            # Calculate reassignment rate
            metric['reassignment_rate'] = (
                metric['reassignment_count'] / metric['total_tasks'] * 100
            ) if metric['total_tasks'] > 0 else 0
        
        return step_metrics
    
    def _identify_bottlenecks(self, step_performance):
        """
        Identify bottlenecks in the workflow based on step performance.
        
        Args:
            step_performance: dict of step performance metrics
            
        Returns:
            list: Identified bottlenecks
        """
        bottlenecks = []
        
        for step in step_performance:
            # Check for high overdue rate
            if step['overdue_rate'] > 20:
                bottlenecks.append({
                    'step_name': step['step__name'],
                    'type': 'HIGH_OVERDUE_RATE',
                    'metric': step['overdue_rate'],
                    'threshold': 20,
                    'description': f"Step '{step['step__name']}' has a high overdue rate of {step['overdue_rate']:.1f}%"
                })
            
            # Check for high reassignment rate
            if step['reassignment_rate'] > 15:
                bottlenecks.append({
                    'step_name': step['step__name'],
                    'type': 'HIGH_REASSIGNMENT_RATE',
                    'metric': step['reassignment_rate'],
                    'threshold': 15,
                    'description': f"Step '{step['step__name']}' has a high reassignment rate of {step['reassignment_rate']:.1f}%"
                })
            
            # Check for long completion time
            if step['avg_completion_time'] and step['avg_completion_time'].total_seconds() > 86400:  # 24 hours
                bottlenecks.append({
                    'step_name': step['step__name'],
                    'type': 'LONG_COMPLETION_TIME',
                    'metric': step['avg_completion_time'].total_seconds() / 3600,  # Convert to hours
                    'threshold': 24,
                    'description': f"Step '{step['step__name']}' has a long average completion time of {step['avg_completion_time'].total_seconds() / 3600:.1f} hours"
                })
        
        return bottlenecks
    
    def _generate_recommendations(self, bottlenecks, completion_times):
        """
        Generate recommendations for improving workflow performance.
        
        Args:
            bottlenecks: list of identified bottlenecks
            completion_times: dict of completion time metrics
            
        Returns:
            list: Recommendations for improvement
        """
        recommendations = []
        
        # Add recommendations based on bottlenecks
        for bottleneck in bottlenecks:
            if bottleneck['type'] == 'HIGH_OVERDUE_RATE':
                recommendations.append({
                    'type': 'STAFFING',
                    'priority': 'HIGH',
                    'description': f"Consider adding more staff or redistributing workload for step '{bottleneck['step_name']}'",
                    'impact': 'Reduced overdue rate and improved workflow efficiency'
                })
            
            elif bottleneck['type'] == 'HIGH_REASSIGNMENT_RATE':
                recommendations.append({
                    'type': 'TRAINING',
                    'priority': 'MEDIUM',
                    'description': f"Provide additional training for staff handling step '{bottleneck['step_name']}'",
                    'impact': 'Reduced reassignment rate and improved task completion'
                })
            
            elif bottleneck['type'] == 'LONG_COMPLETION_TIME':
                recommendations.append({
                    'type': 'PROCESS',
                    'priority': 'HIGH',
                    'description': f"Review and optimize the process for step '{bottleneck['step_name']}'",
                    'impact': 'Reduced completion time and improved workflow efficiency'
                })
        
        # Add recommendations based on completion times
        if completion_times['completion_rate'] < 80:
            recommendations.append({
                'type': 'PROCESS',
                'priority': 'HIGH',
                'description': 'Review overall workflow process to identify and address completion issues',
                'impact': 'Improved workflow completion rate'
            })
        
        if completion_times['avg_completion_time'] and completion_times['avg_completion_time'].total_seconds() > 604800:  # 7 days
            recommendations.append({
                'type': 'PROCESS',
                'priority': 'HIGH',
                'description': 'Implement workflow automation for repetitive tasks',
                'impact': 'Reduced overall completion time'
            })
        
        return recommendations
    
    def log_analysis(self, analysis_results, user):
        """
        Log the workflow analysis for audit purposes.
        
        Args:
            analysis_results: dict of analysis results
            user: User who performed the analysis
        """
        AuditLog.objects.create(
            user=user,
            action='ANALYZE',
            model_name='PayrollWorkflow',
            object_id=None,
            details=f"Analyzed workflow performance: {len(analysis_results['bottlenecks'])} bottlenecks identified, {len(analysis_results['recommendations'])} recommendations generated",
            ip_address=None,
            user_agent=None
        ) 