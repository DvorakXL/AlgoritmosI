def duplicar(valor: str, referencia: list):  
    valor *= 2
    print("Dentro de la función duplicar: str: " + valor)
    referencia *= 2
    print("Dentro de la función duplicar:  referencia: " + str(referencia)) 


x: str = "abc"
y: list = ['a', 'b', 'c'] 
print("ANTES: ") 
print("x: " + x)  
print("y: " + str(y))
duplicar(x, y)
print("DESPUES: ") 
print("x: "  + x)
print("y: " + str(y))