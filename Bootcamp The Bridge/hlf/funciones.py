import numpy as np
import random

dict_caracteres = {"vacio":" ", "barco":"O", "tocado":"X", "agua":"-"}
lista_caracteres = [" ", "O", "X", "-"]

def print_var(var):
    print(var)

def inicializar_tablero(tamaño=10):
    tablero = np.full((tamaño,tamaño), " ")
    return tablero

def colocar_barcos(lista_barcos, tablero):
    for barco in lista_barcos:
        tablero = colocar_barco(barco, tablero)
    return tablero 

def colocar_barco(barco, tablero):
    for coordenada in barco:
        tablero[coordenada] = "O"
    return tablero 

def disparar(casilla, tablero):
    if tablero[casilla] == "O":
        print("Has acertado el disparo")
        tablero[casilla] = "X"
    elif tablero[casilla] == " ":
        print("Has fallado el disparo")
        tablero[casilla] = "-"
    return tablero

def generar_b_aleatorio(eslora): #BARCO ALEATORIO
    barco_random = []

    fila_random = random.randint(2,6)
    columna_random = random.randint(2,6)
    orien = random.choice(["Norte", "Sur", "Este", "Oeste"])
    barco_random.append((fila_random,columna_random))

    while len(barco_random) < eslora: #importante el while
        if orien == "Norte":
            fila_random = fila_random - 1
        if orien == "Sur":
            fila_random = fila_random + 1
        if orien == "Este":
            columna_random = columna_random + 1
        if orien == "Oeste":
            columna_random = columna_random - 1

        barco_random.append((fila_random,columna_random))

    return barco_random


def generar_bombardero(eslora):
    barco_bombardero = []

    fila_random = random.randint(1,7)
    columna_random = random.randint(1,7)
    orientacion = random.choice(["Norte", "Sur", "Este", "Oeste"])
    barco_bombardero.append((fila_random,columna_random))

    while len(barco_bombardero) < eslora:
        if orientacion == "Norte":
            fila_random = fila_random - 1
        if orientacion == "Sur":
            fila_random = fila_random + 1
        if orientacion == "Este":
            columna_random = columna_random + 1
        if orientacion == "Oeste":
            columna_random = columna_random - 1

        barco_bombardero.append((fila_random,columna_random))

    return barco_bombardero


def generar_portaaviones(eslora): #LAS CLASES LAS HE PUESTO AQUI, OSEA NO HE HECHO CLASES PORQUE NO CONSEGUÍA METERLAS
    barco_portaaviones = []

    fila_random = random.randint(4,5)
    columna_random = random.randint(4,5)
    orientacion = random.choice(["Norte", "Sur", "Este", "Oeste"])
    barco_portaaviones.append((fila_random,columna_random))

    while len(barco_portaaviones) < eslora:
        if orientacion == "Norte":
            fila_random = fila_random - 1
        if orientacion == "Sur":
            fila_random = fila_random + 1
        if orientacion == "Este":
            columna_random = columna_random + 1
        if orientacion == "Oeste":
            columna_random = columna_random - 1

        barco_portaaviones.append((fila_random,columna_random))

    return barco_portaaviones


tablero = inicializar_tablero() #HE TENIDO QUE CUADRAR LOS BARCOS EN LAS COORDENADAS DE MANERA QUE NO SE ME FUERAN FUERA DE LA PANTALLA
barco_aleatorio = generar_b_aleatorio(3)
barco_bombardero_aleatorio = generar_bombardero(2)
barco_portaaviones_aleatorio = generar_bombardero(4) 
tablero = colocar_barco(barco_aleatorio, tablero) 
tablero = colocar_barco(barco_bombardero_aleatorio, tablero)
tablero = colocar_barco(barco_portaaviones_aleatorio, tablero)   
tablero = disparar((random.randint(1,8),random.randint(1,8)), tablero) #1 NO ME DEJABA HACERLO FUNCIÓN
tablero = disparar((random.randint(1,8),random.randint(1,8)), tablero) #2
tablero = disparar((random.randint(1,8),random.randint(1,8)), tablero) #3
tablero = disparar((random.randint(1,8),random.randint(1,8)), tablero) #4
tablero = disparar((random.randint(1,8),random.randint(1,8)), tablero) #5
tablero = disparar((random.randint(1,8),random.randint(1,8)), tablero) #6
tablero = disparar((random.randint(1,8),random.randint(1,8)), tablero) #7
tablero = disparar((random.randint(1,8),random.randint(1,8)), tablero) #8
tablero = disparar((random.randint(1,8),random.randint(1,8)), tablero) #9
tablero = disparar((random.randint(1,8),random.randint(1,8)), tablero) #10
tablero = disparar((random.randint(1,8),random.randint(1,8)), tablero) #11
tablero = disparar((random.randint(1,8),random.randint(1,8)), tablero) #12
tablero = disparar((random.randint(1,8),random.randint(1,8)), tablero) #13
tablero = disparar((random.randint(1,8),random.randint(1,8)), tablero) #14
tablero = disparar((random.randint(1,8),random.randint(1,8)), tablero) #15
tablero = disparar((random.randint(1,8),random.randint(1,8)), tablero) #16
tablero = disparar((random.randint(1,8),random.randint(1,8)), tablero) #17
tablero = disparar((random.randint(1,8),random.randint(1,8)), tablero) #18
tablero = disparar((random.randint(1,8),random.randint(1,8)), tablero) #19
tablero = disparar((random.randint(1,8),random.randint(1,8)), tablero) #20
tablero = disparar((random.randint(1,8),random.randint(1,8)), tablero) #21
tablero = disparar((random.randint(1,8),random.randint(1,8)), tablero) #22
tablero = disparar((random.randint(1,8),random.randint(1,8)), tablero) #23
tablero = disparar((random.randint(1,8),random.randint(1,8)), tablero) #24
tablero = disparar((random.randint(1,8),random.randint(1,8)), tablero) #25
tablero = disparar((random.randint(1,8),random.randint(1,8)), tablero) #26
tablero = disparar((random.randint(1,8),random.randint(1,8)), tablero) #27
tablero = disparar((random.randint(1,8),random.randint(1,8)), tablero) #28
tablero = disparar((random.randint(1,8),random.randint(1,8)), tablero) #29
tablero = disparar((random.randint(1,8),random.randint(1,8)), tablero) #30



""" lista_barcos = [barco_aleatorio, barco_portaaviones_aleatorio, barco_bombardero_aleatorio]
print("Portaaviones Miguel:", barco_portaaviones_aleatorio, "Bombardero Javier:", barco_bombardero_aleatorio) """
""" for barco in lista_barcos:
    tablero = colocar_barco(barco, tablero) """


vidas = 30
while vidas > 0:
    if True:
        vidas = vidas - 1
    print("Quedan", vidas, "disparos.")

print("Resultado final:")
print(tablero)

lista_barcos = [barco_aleatorio, barco_portaaviones_aleatorio, barco_bombardero_aleatorio]
print("Portaaviones Miguel:", barco_portaaviones_aleatorio, "Bombardero Javier:", barco_bombardero_aleatorio)

if np.count_nonzero(tablero == "X") >= 4:  #YO HE PREFERIDO HACERLO A UN OBJETIVO DE DISPAROS, YA QUE TARDABAN EN HUNDIR MUCHOS DISPAROS
    print("¡Has alcanzado el objetivo de los 4 disparos!")
else:
    print("No has logrado el objetivo de los 4 disparos alcanzados.")


    

