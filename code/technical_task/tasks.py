from celery import shared_task
import time

from django.http import JsonResponse

@shared_task
def simulate_workload():
    time.sleep(5)  
    return {"status": True}
