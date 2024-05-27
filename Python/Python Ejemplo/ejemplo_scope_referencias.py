# problema duplicar(in x: seq<int>, out y: seq<int>) 
#     asegura: y = x ++ x

def duplicar(x: list, y: list): 
    print("- y" + str(y) + str(id(y)))
    print("- x" + str(x) + str(id(x)))
    y += x
    print("- y" + str(y) + str(id(y)))
    print("- x" + str(x) + str(id(x)))
    y *= 2 
    print("-- y" + str(y))
    print("-- x" + str(x))

x: list = ['a', 'b', 'c'] 
y: list = ['d', 'e'] 
print("ANTES: ") 
print("x: " + str(x))  
print("y: " + str(y))
duplicar(x, y)
print("DESPUES: ") 
print("x: " + str(x))  
print("y: " + str(y))