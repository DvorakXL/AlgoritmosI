# Ejercicio 1
def acomodar (lista: list[str]) -> list[str]:
    res: list[str] = []

    for i in range(len(lista)):
        elem: str = lista[i]
        if elem == "UP":
            res.append("UP")
    
    for i in range(len(lista)):
        elem: str = lista[i]
        if elem == "LLA":
            res.append("LLA")

    return res

# Ejercicio 2
def pos_umbral (lista: list[int], u: int) -> int:
    ingresantes: int = 0

    for i in range(len(lista)):
        elem: int = lista[i]

        if elem > 0:
            ingresantes += elem

        if ingresantes > u:
            return i
    
    return -1

# Ejercicio 3
def columnas_repetidas (matriz: list[list[int]]) -> bool:
    fila_izq: list[int] = []
    fila_der: list[int] = []

    for i in range(len(matriz)):
        fila: list[int] = matriz[i]
        punto_medio: int = int(len(fila)/2)

        for j in range(len(fila)):
            if j < punto_medio:
                fila_izq.append(fila[j])
            else:
                fila_der.append(fila[j])
    
    return fila_izq == fila_der

# Ejercicio 4
def posiciones_de_nacion (nacion: str, naciones: list[str], torneos: dict[int,list[str]]) -> list[int]:
    res: list[int] = [0]*len(naciones)

    for posiciones in torneos.values():
        for i in range(len(posiciones)):
            if posiciones[i] == nacion:
                res[i] += 1
    
    return res

def cuenta_posiciones_por_nacion (naciones: list[str], torneos: dict[int,list[str]]) -> list[int]:
    res: dict[str,list[int]] = {}

    for i in range(len(naciones)):
        nacion: str = naciones[i]
        res[nacion] = posiciones_de_nacion(nacion, naciones, torneos)
    
    return res