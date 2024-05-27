def elegirMayor(x: int, y: int) -> int:
    z: int
    print("x = " + str(x) + " | y = " + str(y) )
    if x > y :
        print("x es mayor que y")
        z = x
        print("(Se cumple B) -> z toma el valor de x")
    else:   
        print("y es mayor o igual que x")
        z = y
        print("(No se cumple B) -> z toma el valor de y")
        
    return z

x: int = 4
y: int = 12

mayor: int = elegirMayor(x, y)
print("z = " + str(mayor))