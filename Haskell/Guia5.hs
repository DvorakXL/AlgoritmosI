-- Ejercicio 1 --
-- 1)
longitud :: [t] -> Int
longitud [] = 0
longitud (x:xs) = 1 + longitud xs

-- 2)
ultimo :: [t] -> t
ultimo (x:xs)
    | longitud xs == 0 = x
    | otherwise = ultimo xs

-- 3)
principio :: [t] -> [t]
principio [x] = []
principio (x:xs) = x : principio xs

-- 4)
reverso :: [t] -> [t]
reverso [] = []
reverso (x:xs) = reverso xs ++ [x]

-- Ejercicio 2 --
-- 1)
pertenece :: (Eq t) => t -> [t] -> Bool
pertenece _ [] = False
pertenece y (x:xs) = y == x || pertenece y xs

-- 2)
todosIguales :: (Eq t) => [t] -> Bool
todosIguales [] = False
todosIguales [x] = True
todosIguales (x:xs) = pertenece x xs && todosIguales xs

-- 3)
todosDistintos :: (Eq t) => [t] -> Bool
todosDistintos [] = False
todosDistintos [x] = True
todosDistintos (x:xs) = not (pertenece x xs) && todosDistintos xs

-- 4)
hayRepetidos :: (Eq t) => [t] -> Bool
hayRepetidos [] = False
hayRepetidos (x:xs) = pertenece x xs || hayRepetidos xs

-- 5)
quitar :: (Eq t) => t -> [t] -> [t]
quitar _ [] = []
quitar y (x:xs)
    | y == x = xs
    | otherwise = x:quitar y xs

-- 6)
quitarTodos :: (Eq t) => t -> [t] -> [t]
quitarTodos _ [] = []
quitarTodos e (x:xs)
    | e == x = pasoRecursivo
    | otherwise = x:pasoRecursivo
    where pasoRecursivo = quitarTodos e xs

-- 7)
eliminarRepetidos :: (Eq t) => [t] -> [t]
eliminarRepetidos [] = []
eliminarRepetidos (x:xs) = x:quitarTodos x pasoRecursivo
    where pasoRecursivo = eliminarRepetidos xs

-- 8)
mismosElementos :: (Eq t) => [t] -> [t] -> Bool
mismosElementos [] [] = True
mismosElementos _ [] = False
mismosElementos [] _ = False
mismosElementos (x:xs) (y:ys) = pertenece x (y:ys) && pertenece y (x:xs) && pasoRecursivo
    where pasoRecursivo = mismosElementos (eliminarRepetidos xs) (eliminarRepetidos ys)

-- Ejercicio 3 --
-- 3)
maximo :: (Ord t) => [t] -> t
maximo [x] = x
maximo (x:xs)
    | x >= maximo xs = x
    | otherwise = maximo xs

-- 9) La especificacion es para enteros pero lo hice con genericos porque si xd
ordenar :: (Ord t, Eq t) => [t] -> [t]
ordenar [] = []
ordenar [x] = [x]
ordenar xs = ordenarAux xs []

ordenarAux :: (Ord t, Eq t) => [t] -> [t] -> [t]
ordenarAux [] aux = aux
ordenarAux xs aux = ordenarAux (quitar (maximo xs) xs) (maximo xs:aux)

-- Ejercicio 4 --
-- a)
sacarBlancosRepetidos :: [Char] -> [Char]
sacarBlancosRepetidos [] = []
sacarBlancosRepetidos [x] = [x]
sacarBlancosRepetidos (x:y:xs)
    | x == y && x == ' ' = sacarBlancosRepetidos (y:xs)
    | otherwise = x:sacarBlancosRepetidos (y:xs)

-- b)
contarPalabras :: [Char] -> Int
contarPalabras xs = contarPalabrasAux xs 0

contarPalabrasAux :: [Char] -> Int -> Int
contarPalabrasAux [] _ = 0
contarPalabrasAux [x] _
    | x /= ' ' = 1
    | otherwise = 0
contarPalabrasAux (x:y:xs) aux
    | y == ' ' && x /= ' ' = contarPalabrasAux xs aux+1
    | otherwise = contarPalabrasAux (y:xs) aux