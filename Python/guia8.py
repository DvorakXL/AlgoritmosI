from queue import LifoQueue as Pila
from queue import Queue as Cola
import random

# Funciones auxiliares
def print_pila (pila: Pila) -> None:
    copia_pila: Pila = Pila()

    while not pila.empty():
        elemento = pila.get()
        copia_pila.put(elemento)
        print(elemento)
    
    # Restauro el estado previo de cola
    mover_pila(pila, copia_pila)

def print_cola (cola: Cola) -> None:
    copia_cola: Cola = Cola()

    while not cola.empty():
        elemento = cola.get()
        copia_cola.put(elemento)
        print(elemento)
    
    # Restauro el estado previo de cola
    mover_cola(cola, copia_cola)

def vaciar_cola (cola: Cola) -> None:
    while not cola.empty():
        cola.get()

def vaciar_pila (pila: Pila) -> None:
    while not pila.empty():
        pila.get()

def mover_pila (hacia: Pila, desde: Pila) -> None:
    # El parametro 'hacia' es de salida. Vaciamos la pila si tiene elementos
    vaciar_pila(hacia)

    # Esto vacia la pila 'desde' y pone sus elementos en 'hacia'
    while not desde.empty():
        elemento = desde.get()
        hacia.put(elemento)

def mover_cola (hacia: Cola, desde: Cola) -> None:
    # El parametro 'hacia' es de salida. Vaciamos la cola si tiene elementos
    vaciar_cola(hacia)

    # Esto vacia la cola 'desde' y pone sus elementos en 'hacia'
    while not desde.empty():
        elemento = desde.get()
        hacia.put(elemento)


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

# Ejercicio 12
def evaluar_expresion (formula: str) -> float:
    pila_operandos: Pila[str] = Pila()
    evaluado: float = 0
    operadores: list[str] = ['+','-','*','/']
    
    tokens: list[str] = formula.split(' ')
    for token in tokens:
        if not pertenece(operadores, token):
            pila_operandos.put(token)
        else:
            y: int = int(pila_operandos.get())
            x: int = 0

            if pila_operandos.empty():
                x = evaluado
            else:
                x = int(pila_operandos.get())

            if token == operadores[0]:
                evaluado = x + y
            elif token == operadores[1]:
                evaluado = x - y
            elif token == operadores[2]:
                evaluado = x * y
            elif token == operadores[3]:
                evaluado = int(x / y)

    return evaluado

# Ejercicio 13
def cola_numeros_al_azar (cantidad: int, desde: int, hasta: int) -> Cola[int]:
    pila_al_azar: Pila[int] = generar_nros_al_azar(cantidad, desde, hasta)
    cola_al_azar: Cola[int] = Cola()

    for i in range(cantidad_elementos(pila_al_azar)):
        cola_al_azar.put(pila_al_azar.get())
    
    return cola_al_azar

# Ejercicio 14
def cantidad_elementos_cola (cola: Cola) -> int:
    copia_cola: Cola = Cola()
    longitud = 0

    # Suma uno a longitud por cada elemento dentro de la cola
    while not cola.empty():
        elemento = cola.get()
        copia_cola.put(elemento)
        longitud += 1

    # Restauro el estado previo de la cola
    mover_pila(cola, copia_cola)
    
    return longitud

# Ejercicio 15
def buscar_el_maximo_cola (cola: Cola[int]) -> int:
    primer_valor = cola.get()
    copia_cola: Cola = Cola()
    copia_cola.put(primer_valor)
    maximo = primer_valor

    # Suma uno a longitud por cada elemento dentro de la cola
    while not cola.empty():
        elemento = cola.get()
        copia_cola.put(elemento)

        if elemento > maximo:
            maximo = elemento

    # Restauro el estado previo de la cola
    mover_pila(cola, copia_cola)
    
    return maximo

# Ejercicio 16
def armar_secuencia_de_bingo () -> Cola[int]:
    cola_numeros: Cola[int] = Cola()
    lista_numeros: list[int] = []

    # Genera los numeros del 0 al 99
    for i in range(0,100):
        lista_numeros.append(i)

    # Escoge indices al azar
    while not len(lista_numeros) == 0:
        indice_al_azar = random.randint(0,len(lista_numeros)-1)
        cola_numeros.put(lista_numeros[indice_al_azar])
        lista_numeros.pop(indice_al_azar)
    
    return cola_numeros

def generar_carton () -> list[int]:
    carton: list[int] = []

    while len(carton) < 12:
        numero_generado: int = random.randint(0,99)
        if not pertenece(carton, numero_generado):
            carton.append(numero_generado)
    
    return carton

# Supongo que piden hallar cuantos turnos para completar todo el carton
def jugar_carton_de_bingo (carton: list[int], bolillero: Cola[int]) -> int:
    copia_bolillero: Cola[int] = Cola()
    copia_carton: list[int] = []
    cantidad_jugadas: int = 0

    while not len(carton) == 0:
        bola: int = bolillero.get()
        copia_bolillero.put(bola)

        if pertenece(carton, bola):
            copia_carton.append(bola)
            carton.remove(bola)
        cantidad_jugadas += 1

    for elem in copia_carton:
        carton.append(elem)
    mover_cola(bolillero, copia_bolillero)

    return cantidad_jugadas

# Ejercicio 17
def anotar_paciente (cola: Cola[tuple[int,str,str]], prioridad: int, nombre: str, especialidad: str) -> None:
    cola.put((prioridad,nombre,especialidad))

def n_pacientes_urgentes (cola: Cola[tuple[int,str,str]]) -> int:
    copiar_cola: Cola[(int,str,str)] = Cola()
    cuenta: int = 0
    nivel_urgencia: int = 3

    while not cola.empty():
        elem: tuple[int,str,str] = cola.get()
        copiar_cola.put(elem)
        if elem[0] <= nivel_urgencia:
            cuenta += 1
    
    mover_cola(cola, copiar_cola)
    return cuenta

def agrupar_por_longitud (nombre_archivo: str) -> dict:
    archivo = open(nombre_archivo, 'r', encoding='utf-8')
    diccionario: dict = {}
    for linea in archivo.readlines():
        palabras = linea.split(' ')
        
        for palabra in palabras:
            longitud = len(palabra)
            if longitud in diccionario:
                diccionario[longitud] += 1
            else:
                diccionario[longitud] = 1
    
    return diccionario

# ----------------- Testing -----------------------
print(agrupar_por_longitud('archivo.txt'))