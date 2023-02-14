
from django.http import HttpRequest, HttpResponse
from django.template import Template, Context
from modelos.models import Avistamiento, Especie, Lugar


def index(request):

    plantilla_html = open("App_Invemar/plantillas/index.html")
    plantilla_open = Template(plantilla_html.read())
    plantilla_html.close()
    contexto = Context()
    plantilla = plantilla_open.render(contexto)
    return HttpResponse(plantilla)


def especies(request):
    plantilla_html = open("App_Invemar/plantillas/especies.html")
    plantilla_open = Template(plantilla_html.read())
    plantilla_html.close()
    especies_guardadas = Especie.objects.all()

    # print(especies_guardadas)
    # print("".center(100, "#"))
    
    contexto = Context({"especies_guardadas": especies_guardadas})
    plantilla = plantilla_open.render(contexto)
    return HttpResponse(plantilla)


def lugares(request):
    plantilla_html = open("App_Invemar/plantillas/lugares.html")
    plantilla_open = Template(plantilla_html.read())
    plantilla_html.close()
    lugares_guardados = Lugar.objects.all()
    contexto = Context({"lugares_guardados": lugares_guardados})
    plantilla = plantilla_open.render(contexto)
    return HttpResponse(plantilla)


def avistamientos(request):
    plantilla_html = open("App_Invemar/plantillas/avistamientos.html")
    plantilla_open = Template(plantilla_html.read())
    plantilla_html.close()
    avistamientos_guardados = Avistamiento.objects.all()
    contexto = Context({"avistamientos_guardados": avistamientos_guardados})
    plantilla = plantilla_open.render(contexto)
    return HttpResponse(plantilla)


# Formularios
def especies_formulario(request):
    plantilla_html = open("App_Invemar/plantillas/especies_formulario.html")
    plantilla_open = Template(plantilla_html.read())
    plantilla_html.close()
    contexto = Context()
    plantilla = plantilla_open.render(contexto)
    return HttpResponse(plantilla)


def lugares_formulario(request):
    plantilla_html = open("App_Invemar/plantillas/lugares_formulario.html")
    plantilla_open = Template(plantilla_html.read())
    plantilla_html.close()
    contexto = Context()
    plantilla = plantilla_open.render(contexto)
    return HttpResponse(plantilla)


def avistamientos_formulario(request):
    plantilla_html = open("App_Invemar/plantillas/avistamientos_formulario.html")
    plantilla_open = Template(plantilla_html.read())
    plantilla_html.close()
    especies_existentes = Especie.objects.all()
    lugares_existentes = Lugar.objects.all()
    contexto = Context({"especies_existentes": especies_existentes, "lugares_existentes": lugares_existentes})
    plantilla = plantilla_open.render(contexto)
    return HttpResponse(plantilla)


# Carga de informacion
def lugares_formulario_carga(request):
    plantilla_html = open("App_Invemar/plantillas/lugares_formulario_carga.html")
    plantilla_open = Template(plantilla_html.read())
    plantilla_html.close()
    pais = request.GET["pais"]
    departamento = request.GET["departamento"]
    ciudad = request.GET["ciudad"]
    lugar = request.GET["lugar"]
    contexto = Context({"pais": pais, "departamento": departamento, "ciudad": ciudad, "lugar": lugar})
    plantilla = plantilla_open.render(contexto)
    
    # insertando en la BD
    lugar_ = Lugar(pais = pais, departamento = departamento, ciudad = ciudad, lugar = lugar)
    lugar_.save()
    
    return HttpResponse(plantilla)

def especies_formulario_carga(request):
    plantilla_html = open("App_Invemar/plantillas/especies_formulario_carga.html")
    plantilla_open = Template(plantilla_html.read())
    plantilla_html.close()
    nombreComun = request.GET["nombreComun"]
    nombreCientifico = request.GET["nombreCientifico"]
    reino = request.GET["reino"]
    filo = request.GET["filo"]
    clase = request.GET["clase"]
    orden = request.GET["orden"]
    familia = request.GET["familia"]
    genero = request.GET["genero"]
    especie = request.GET["especie"]
    contexto = Context({"nombreComun": nombreComun, "nombreCientifico": nombreCientifico, "reino": reino, "filo": filo, "clase": clase, "orden": orden, "familia": familia, "genero": genero, "especie": especie})
    plantilla = plantilla_open.render(contexto)

    ## insertando en la BD
    especie_ = Especie(nombreComun = nombreComun, nombreCientifico = nombreCientifico, reino = reino, filo = filo, clase = clase, orden = orden, familia = familia, genero = genero, especie = especie,)
    especie_.save()

    return HttpResponse(plantilla)

def avistamientos_formulario_carga(request):
    plantilla_html = open("App_Invemar/plantillas/avistamientos_formulario_carga.html")
    plantilla_open = Template(plantilla_html.read())
    plantilla_html.close()
    
    especie = request.GET["especie"]
    lugar = request.GET["lugar"]
    latitud = request.GET["latitud"]
    longitud = request.GET["longitud"]
    autor = request.GET["autor"]
    notas = request.GET["notas"]
    contexto = Context({"especie": especie, "lugar": lugar, "latitud": latitud, "longitud": longitud, "autor": autor, "notas": notas})
    plantilla = plantilla_open.render(contexto)
    
    ## insertando en la BD
    especie_ = Especie.objects.get(id=especie)
    lugar_ = Lugar.objects.get(id=lugar)
    avistamiento = Avistamiento(especie = especie_, lugar = lugar_, latitud = latitud, longitud = longitud, autor = autor, notas = notas,)
    avistamiento.save()

    ## entregando la pagina
    return HttpResponse(plantilla)

def avistamientos_editar(request, id):
    plantilla_html = open("App_Invemar/plantillas/avistamientos_editar.html")
    plantilla_open = Template(plantilla_html.read())
    plantilla_html.close()
    avistamientos_guardados = Avistamiento.objects.get(id=id)
    especies_existentes = Especie.objects.all()
    especie_seleccionada = Especie.objects.get(id=avistamientos_guardados.especie_id)
    lugares_existentes = Lugar.objects.all()
    lugar_seleccionado = Lugar.objects.get(id=avistamientos_guardados.lugar_id)
    contexto = Context({"avistamientos_guardados": avistamientos_guardados, "especies_existentes": especies_existentes, "lugares_existentes": lugares_existentes, "especie_seleccionada": especie_seleccionada, "lugar_seleccionado": lugar_seleccionado})
    plantilla = plantilla_open.render(contexto)
    return HttpResponse(plantilla)

def especies_editar(request, id):
    plantilla_html = open("App_Invemar/plantillas/especies_editar.html")
    plantilla_open = Template(plantilla_html.read())
    plantilla_html.close()
    especies_guardadas = Especie.objects.get(id=id)
    contexto = Context({"especies_guardadas": especies_guardadas})
    plantilla = plantilla_open.render(contexto)
    return HttpResponse(plantilla)

def lugares_editar(request, id):
    plantilla_html = open("App_Invemar/plantillas/lugares_editar.html")
    plantilla_open = Template(plantilla_html.read())
    plantilla_html.close()
    lugares_guardados = Lugar.objects.get(id=id)
    contexto = Context({"lugares_guardados": lugares_guardados})
    plantilla = plantilla_open.render(contexto)
    return HttpResponse(plantilla)

################## Editar ################
def lugares_actualizar(request):
    plantilla_html = open("App_Invemar/plantillas/lugares_actualizar.html")
    plantilla_open = Template(plantilla_html.read())
    plantilla_html.close()

    id = request.GET["id"]
    lugar = Lugar.objects.get(id=id)

    lugar.pais = request.GET["pais"]
    lugar.departamento = request.GET["departamento"]
    lugar.ciudad = request.GET["ciudad"]
    lugar.lugar = request.GET["lugar"]

    contexto = Context()
    plantilla = plantilla_open.render(contexto)
    
    # insertando en la BD
    lugar.save()
    
    return HttpResponse(plantilla)

def especies_actualizar(request):
    plantilla_html = open("App_Invemar/plantillas/especies_actualizar.html")
    plantilla_open = Template(plantilla_html.read())
    plantilla_html.close()

    id = request.GET["id"]
    especie = Especie.objects.get(id=id)

    especie.nombreComun = request.GET["nombreComun"]
    especie.nombreCientifico = request.GET["nombreCientifico"]
    especie.reino = request.GET["reino"]
    especie.filo = request.GET["filo"]
    especie.clase = request.GET["clase"]
    especie.orden = request.GET["orden"]
    especie.familia = request.GET["familia"]
    especie.genero = request.GET["genero"]
    especie.especie = request.GET["especie"]

    contexto = Context()
    plantilla = plantilla_open.render(contexto)
    
    # insertando en la BD
    especie.save()
    
    return HttpResponse(plantilla)


def avistamientos_actualizar(request):
    plantilla_html = open("App_Invemar/plantillas/avistamientos_actualizar.html")
    plantilla_open = Template(plantilla_html.read())
    plantilla_html.close()

    id = request.GET["id"]
    avistamiento = Avistamiento.objects.get(id=id)

    avistamiento.especie_id = request.GET["especie"]
    avistamiento.lugar_id = request.GET["lugar"]
    avistamiento.latitud = request.GET["latitud"]
    avistamiento.longitud = request.GET["longitud"]
    avistamiento.autor = request.GET["autor"]
    avistamiento.notas = request.GET["notas"]

    contexto = Context()
    plantilla = plantilla_open.render(contexto)
    
    # insertando en la BD
    avistamiento.save()
    
    return HttpResponse(plantilla)














################################################
if __name__ == "__main__":
    from Clases.clases import Avistamiento, Especie, Lugar
    especie = Especie("Texto", "NombreCientificus", "Texto", "Texto", "Texto", "Texto", "Texto", "Texto", "Texto")
    lugar = Lugar("Texto", "Texto", "Texto", "LugarLugar")
    print(especie)
    print(lugar)

    avistamiento = Avistamiento(especie, lugar, "1564165",  "5165126",  "Brian",  "notasnotasnotasnotas")
    print(avistamiento)