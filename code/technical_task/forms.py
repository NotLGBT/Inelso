from django import forms
from .models import Item

class TaskForm(forms.ModelForm):
    class Meta:
        model = Item
        # fields = ("title", "description")
        fields = ()
