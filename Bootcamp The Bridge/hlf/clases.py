class Bombardero():
    def __init__(self, coordenadas):
        self.coordenadas = coordenadas
        self.eslora 

class Portaaviones():
    def __init__(self, coordenadas):
        self.coordenadas = coordenadas

bombardero = Bombardero([(2,2), (2,3)]) #por ejemplo
portaaviones = Portaaviones([(0,3), (0,4), (0,5), (0,6)])


def generar_bombardero(eslora):
    barco_bombardero = []

    fila_random = random.randint(0,9)
    columna_random = random.randint(0,9)
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

