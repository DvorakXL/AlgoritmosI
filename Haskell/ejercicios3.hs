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