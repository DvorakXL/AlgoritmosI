# Ejercicio 1
def ultima_aparicion (s: list[int], e: int) -> int:
    ultimo_indice: int = 0
    longitud: int = len(s)

    for i in range(longitud):
        if s[i] == e:
            ultimo_indice = i

    return ultimo_indice

# Ejercicio 2
def pertenece_a_ambos (s: list[int], t: list[int], e: int) -> bool:
    return (e in s) and (e in t)


def elementos_exclusivos (s: list[int], t: list[int]) -> list[int]:
    res: list[int] = []
    syt: list[int] = s + t
    longitud: int = len(syt)

    for i in range(longitud):
        if not pertenece_a_ambos(s, t, syt[i]):
            if not (syt[i] in res):
                res.append(syt[i])
    
    return res

# Ejercicio 3
def interseccion_diccionarios (d1: dict[str,str], d2: dict[str,str]) -> dict[str,str]:
    res: dict[str,str] = {}

    for clave, valor in d1.items():
        if clave in d2:
            res[clave] = valor
    
    return res

def contar_traducciones_iguales (ing: dict[str,str], ale: dict[str,str]) -> int:
    res: int = 0
    palabras_en_ambos: dict[str,str] = interseccion_diccionarios(ing, ale)

    for clave in palabras_en_ambos.keys():
        if ing[clave] == ale[clave]:
            res += 1
    
    return res

# Ejercicio 4
def contar_repeticiones (lista: list[int], e: int) -> int:
    res: int = 0

    for i in range(len(lista)):
        if lista[i] == e:
            res += 1
    
    return res

def convertir_a_diccionario (lista: list[int]) -> dict[int,int]:
    res: dict[int,int] = {}

    for i in range(len(lista)):
        elem: int = lista[i]
        if not elem in res:
            repeticiones: int = contar_repeticiones(lista, elem)
            res[elem] = repeticiones
    
    return res