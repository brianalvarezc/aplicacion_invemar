from django.db import models

class Especie(models.Model):
        nombreComun = models.CharField(max_length=50)
        nombreCientifico = models.CharField(max_length=50)
        reino = models.CharField(max_length=50)
        filo = models.CharField(max_length=50)
        clase = models.CharField(max_length=50)
        orden = models.CharField(max_length=50)
        familia = models.CharField(max_length=50)
        genero = models.CharField(max_length=50)
        especie = models.CharField(max_length=50)


class Lugar(models.Model):
        pais = models.CharField(max_length=50)
        departamento = models.CharField(max_length=50)
        ciudad = models.CharField(max_length=50)
        lugar = models.CharField(max_length=50)

class Avistamiento(models.Model):
        
        especie = models.ForeignKey(Especie, on_delete=models.CASCADE)
        lugar = models.ForeignKey(Lugar, on_delete=models.CASCADE)
        latitud = models.CharField(max_length=50)
        longitud = models.CharField(max_length=50)
        autor = models.CharField(max_length=50)
        notas = models.CharField(max_length=200)

