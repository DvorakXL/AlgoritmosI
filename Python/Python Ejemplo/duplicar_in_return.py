# problema duplicar(in x: seq<int>): seq<int>
#     asegura: res = x ++ x

def duplicar(x: list): 
    y: list = x.copy()
    y *= 2 
    return y


x: list = ['a', 'b', 'c'] 
print("ANTES: ") 
print("x: " + str(x))  
y: list = duplicar(x)
print("DESPUES: ") 
print("x: " + str(x))  
print("y: " + str(y))
