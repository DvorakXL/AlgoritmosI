# problema duplicar(inout x: seq<int>) 
#     modifica x 
#     asegura: x = x@pre ++ x@pre

def duplicar(x: list): 
    x *= 2

x: list = ['a', 'b', 'c'] 
print("ANTES: ") 
print("x: " + str(x))  
duplicar(x)
print("DESPUES: ") 
print("x: " + str(x))  

