def outer():
    
    enclosed: int = 1

    def inner():
        local: int = 2
        print("INNER: variableGlobal declarada fuera de todo: ", variableGlobal)
        print("INNER: enclosed declarada en outer: ", enclosed)
        print("INNER: local declarada en inner: ", local)
    
    inner()
     
    print("OUTER: variableGlobal declarada fuera de todo: ", variableGlobal)
    print("OUTER: enclosed declarada en outer: ", enclosed)        
    print("OUTER: local declarada en inner: ", local)
    
variableGlobal: int = 3
outer()
print("GLOBAL: variableGlobal declarada fuera de todo: ", variableGlobal)
print("GLOBAL: enclosed declarada en outer: ", enclosed)        
print("GLOBAL: local declarada en inner: ", local)