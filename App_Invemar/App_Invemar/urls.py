"""App_Invemar URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path

from App_Invemar.vistas import index
from App_Invemar.vistas import especies
from App_Invemar.vistas import lugares
from App_Invemar.vistas import avistamientos
from App_Invemar.vistas import especies_formulario
from App_Invemar.vistas import lugares_formulario
from App_Invemar.vistas import avistamientos_formulario
from App_Invemar.vistas import lugares_formulario_carga
from App_Invemar.vistas import especies_formulario_carga
from App_Invemar.vistas import avistamientos_formulario_carga
from App_Invemar.vistas import lugares_editar
from App_Invemar.vistas import especies_editar
from App_Invemar.vistas import avistamientos_editar
from App_Invemar.vistas import lugares_actualizar
from App_Invemar.vistas import especies_actualizar
from App_Invemar.vistas import avistamientos_actualizar

urlpatterns = [
    path('admin/', admin.site.urls),
    path('home/', index),
    path('especies/', especies),
    path('lugares/', lugares),
    path('avistamientos/', avistamientos),
    path('especies_formulario/', especies_formulario),
    path('lugares_formulario/', lugares_formulario),
    path('avistamientos_formulario/', avistamientos_formulario),
    path('especies_formulario_carga/', especies_formulario_carga),
    path('lugares_formulario_carga/', lugares_formulario_carga),
    path('avistamientos_formulario_carga/', avistamientos_formulario_carga),
    path('especies_editar/<int:id>', especies_editar),
    path('lugares_editar/<int:id>', lugares_editar),
    path('avistamientos_editar/<int:id>', avistamientos_editar),
    path('especies_actualizar/', especies_actualizar),
    path('lugares_actualizar/', lugares_actualizar),
    path('avistamientos_actualizar/', avistamientos_actualizar),
]
