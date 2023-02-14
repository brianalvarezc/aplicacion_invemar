class Especie():
    def __init__(self, nombreComun, nombreCientifico, reino, filo, clase, orden, familia, genero, especie):
        self.nombreComun = nombreComun
        self.nombreCientifico = nombreCientifico
        self.reino = reino
        self.filo = filo
        self.clase = clase
        self.orden = orden
        self.familia = familia
        self.genero = genero
        self.especie = especie

    def __str__(self) -> str:
        return f" {self.nombreComun} {self.nombreCientifico} {self.reino} {self.filo} {self.clase} {self.orden} {self.familia} {self.genero} {self.especie}"


class Lugar():
    def __init__(self, pais, departamento, ciudad, lugar) -> None:
        self.pais = pais
        self.departamento = departamento
        self.ciudad = ciudad
        self.lugar = lugar

    def __str__(self) -> str:
        return f" {self.pais} {self.departamento} {self.ciudad} {self.lugar}"

class Avistamiento():
    def __init__(self, especie, lugar, latitud, longitud, autor, notas) -> None:
        
        self.especie = especie.nombreCientifico
        self.lugar = lugar.lugar
        self.latitud = latitud
        self.longitud = longitud
        self.autor = autor
        self.notas = notas

    def __str__(self) -> str:
        return f" {self.especie} {self.lugar} {self.latitud} {self.longitud} {self.autor} {self.notas}"






#################### Pruebas #################### 
if __name__ == "__main__":
    especie = Especie("Texto", "NombreCientificus", "Texto", "Texto", "Texto", "Texto", "Texto", "Texto", "Texto")
    lugar = Lugar("Texto", "Texto", "Texto", "LugarLugar")
    print(especie)
    print(lugar)

    avistamiento = Avistamiento(especie, lugar, "1564165",  "5165126",  "Brian",  "notasnotasnotasnotas")
    print(avistamiento)