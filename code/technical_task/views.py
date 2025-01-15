from django.shortcuts import render, redirect
from .models import Item
from .forms import TaskForm
from .tasks import simulate_workload

def task_list(request):
    tasks = Item.objects.all()
    return render(request, 'technical_task/task_list.html', {'tasks': tasks})

def add_task(request):
    if request.method == 'POST':
        form = TaskForm(request.POST)
        if form.is_valid():
            # for _ in range(10):
            form.save()
            simulate_workload.delay()
            return redirect('task_list')
    else:
        form = TaskForm()
    return render(request, 'technical_task/add_task.html', {'form': form})
