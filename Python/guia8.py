from queue import LifoQueue as Pila
from queue import Queue as Cola
import random

# Ejercicio 1.1
def contar_lineas (nombre_archivo: str) -> int:
    archivo = open(nombre_archivo, 'r', encoding='utf-8')
    res: int = len(archivo.readlines())
    return res

# Ejercicio 1.2
def pertenece (s: list, e: int) -> bool:
    res: bool = False
    
    for i in range(len(s)):
        if s[i] == e:
            res = True

    return res

def existe_palabra (palabra: str, nombre_archivo: str) -> bool:
    archivo = open(nombre_archivo, 'r', encoding='utf-8')
    existe_palabra: bool = False
    
    for linea in archivo.readlines():
        if pertenece(linea.split(), palabra):
            existe_palabra = True

    return existe_palabra

# Ejercicio 1.3
def cantidad_apariciones (nombre_archivo: str, palabra: str) -> int:
    archivo = open(nombre_archivo, 'r', encoding='utf-8')
    apariciones: int = 0
    
    for linea in archivo.readlines():
        if pertenece(linea.split(), palabra):
            apariciones += 1

    return apariciones

# Ejercicio 8
def generar_nros_al_azar (cantidad: int, desde: int, hasta: int) -> Pila[int]:
    p: Pila[int] = Pila()

    for i in range(cantidad):
        p.put(random.randint(desde, hasta))
    
    return p

# Ejercicio 9
# Parametro IN pila. Debemos crear una copia
def cantidad_elementos (pila: Pila) -> int:
    cuenta: int = 0
    pila_original: list = []

    while not pila.empty():
        pila_original.append(pila.get())
        cuenta += 1
    
    for i in range(len(pila_original)):
        pila.put(pila_original.pop())
    
    return cuenta

# Ejercicio 10
def buscar_el_maximo (pila: Pila[int]) -> int:
    pila_original: list = []
    primer_valor = pila.get()
    maximo: int = primer_valor
    pila_original.append(primer_valor)

    while not pila.empty():
        elemento: int = pila.get()
        if maximo < elemento:
            maximo = elemento
        pila_original.append(elemento)
    
    for i in range(len(pila_original)):
        pila.put(pila_original.pop())
    
    return maximo

# Ejercicio 11
def esta_bien_balanceada (formula: str) -> bool:
    pila_parentesis: Pila[str] = Pila()
    res: bool = True
    
    for char in formula:
        if char == '(':
            pila_parentesis.put(char)
        elif char == ')':
            if pila_parentesis.empty():
                res = False
            else:
                pila_parentesis.get()
    
    res = cantidad_elementos(pila_parentesis) == 0 and res
    return res

# Ejercicio 13
def cola_numeros_al_azar (cantidad: int, desde: int, hasta: int) -> Cola[int]:
    pila_al_azar: Pila[int] = generar_nros_al_azar(cantidad, desde, hasta)
    cola_al_azar: Cola[int] = Cola()

    for i in range(pila_al_azar.qsize()):
        cola_al_azar.put(pila_al_azar.get())
    
    return cola_al_azar


cola = cola_numeros_al_azar(5,5,20)
for i in range(cola.qsize()):
    print(cola.get())