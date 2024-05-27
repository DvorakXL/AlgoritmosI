# problema duplicar(in x: seq<int>, out y: seq<int>) 
#     asegura: y = x ++ x

def duplicar(x: list, y: list): 
    y.clear()
    y += x
    y *= 2 

x: list = ['a', 'b', 'c'] 
y: list = ['d', 'e'] 
print("ANTES: ") 
print("x: " + str(x))  
print("y: " + str(y))
duplicar(x, y)
print("DESPUES: ") 
print("x: " + str(x))  
print("y: " + str(y))
