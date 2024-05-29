# Ejercicio 1.1 a)
def pertenece (s: list, e: int) -> bool:
    res: bool = False
    
    for i in range(len(s)):
        if s[i] == e:
            res = True

    return res

# Ejercicio 1.1 b)
def pertenece2 (s: list, e: int) -> bool:
    res: bool = False

    for elem in s:
        if elem == e:
            res = True

    return res

# Ejercicio 1.1 c)
def pertenece3 (s: list[int], e: int) -> bool:
    res: bool = False

    i = 0
    while i < len(s):
        if s[i] == e:
            res = True
        i += 1

    return res

# Ejercicio 1.2
def divide_a_todos (s: list[int], e: int) -> bool:
    res: bool = True

    for elem in s:
        if elem % e != 0:
            res = False

    return res

# Ejercicio 1.3
def suma_total (s: list[int]) -> int:
    res: int = 0

    for elem in s:
        res += elem

    return res

# Ejercicio 1.4
def ordenados (s: list[int]) -> bool:
    res: bool = True
    longitud: int = len(s)
    
    for i in range(longitud-1):
        if s[i] >= s[i+1]:
            res = False

    return res

# Ejercicio 1.5
def longitud_mayor_a_7 (palabras: list[str]) -> bool:
    res: bool = False
    
    for palabra in palabras:
        if len(palabra) > 7:
            res = True

    return res

# Ejercicio 1.6
def es_palindromo (palabra: str) -> bool:
    res: bool = palabra[::-1] == palabra
    return res

# Ejercicio 1.7
def tiene_minuscula (s: str) -> bool:
    for c in s:
        if 'a' <= c and c <= 'z':
            return True
    return False

def tiene_mayuscula (s: str) -> bool:
    for c in s:
        if 'A' <= c and c <= 'Z':
            return True
    return False

def tiene_numero (s: str) -> bool:
    for c in s:
        if '0' <= c and c <= '9':
            return True
    return False
    
def seguridad_de_contraseña (contra: str) -> str:
    res: str = "ROJA"
    longitud: int = len(contra)

    if longitud > 8 and tiene_mayuscula(contra) and tiene_minuscula(contra) and tiene_numero(contra):
        res = "VERDE"
    elif longitud >= 5:
        res = "AMARILLA"

    return res

# Ejercicio 2.1
def cero_en_pos_par (s: list[int]):
    for i in range(0,len(s),2):
        s[i] = 0

# Ejercicio 2.2
def cero_en_pos_par_valor (s: list[int]) -> list[int]:
    s2: list[int] = s.copy()

    for i in range(0,len(s2),2):
        s2[i] = 0
    
    return s2

# Ejercicio 2.3
def es_vocal (char:str) -> bool:
    vocales: list = ['a','e','i','o','u']

    return pertenece(vocales, char)

def sacar_vocales (s: str) -> str:
    s2: list[str] = ""

    for char in s:
        if not es_vocal(char):
            s2 += char
    
    return s2

# Ejercicio 2.4
def reemplaza_vocales (s: str) -> str:
    s2: list[str] = ""

    for char in s:
        if not es_vocal(char):
            s2 += char
        else:
            s2 += "_"
    
    return s2

# Ejercicio 2.5
def da_vuelta_str (s: str) -> str:
    return s[::-1]

# Ejercicio 2.6
def eliminar_repetidos (s: str) -> str:
    s2: str = ""

    for char in s:
        if not pertenece(s2, char):
            s2 += char
    
    return s2

# Ejercicio 4.1
def estudiantes ():
    nombres: list[str] = []
    while True:
        estudiante: str = input()
        
        if estudiante.lower() == "listo":
            print("Nombres de los estudiantes: ")
            for nombre in nombres:
                print(nombre)
            break
        else:
            nombres.append(estudiante)

estudiantes()