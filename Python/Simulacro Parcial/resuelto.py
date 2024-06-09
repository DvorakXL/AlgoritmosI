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

s = [-1,2,3,5]
t = [3,5,8,10]

print(elementos_exclusivos(s,t))