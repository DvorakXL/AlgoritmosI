-- Ejercicio 2 --
-- 1)
pertenece :: (Eq t) => t -> [t] -> Bool
pertenece _ [] = False
pertenece y (x:xs) = y == x || pertenece y xs

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