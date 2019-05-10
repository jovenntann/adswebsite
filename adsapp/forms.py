from django import forms

class CustomerForm(forms.Form):
    firstname = forms.CharField(max_length=50)
    lastname = forms.CharField(max_length=50)
    email = forms.EmailField(max_length=70)
    number = forms.CharField(max_length=80)