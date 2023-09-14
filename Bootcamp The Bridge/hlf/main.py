from funciones import *
from variables import mi_var # (10)

tablero = inicializar_tablero()
barco_aleatorio = generar_b_aleatorio(3)
tablero = colocar_barco(barco_aleatorio, tablero)
tablero = disparar((random.randint(0,9),random.randint(0,9)), tablero)

print(tablero)

print_var(mi_var)
