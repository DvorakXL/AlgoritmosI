def ejemploGlobalScope():
    print("x: " + str(x))
     
def sumarEnElGlobal():
    global x
    x = x + 120
    print("x: " + str(x))

x: int = 20
ejemploGlobalScope()
sumarEnElGlobal()
ejemploGlobalScope()
print("x: " + str(x))