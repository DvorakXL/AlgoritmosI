-- Ej 1a)
f :: Integer -> Integer
f 1 = 8
f 4 = 131
f 16 = 16

--Ej 1b)
g :: Integer -> Integer
g 8 = 16
g 16 = 4
g 131 = 1

--Ej 1c)
h :: Integer -> Integer
h x = f(g x)

k :: Integer -> Integer
k x = g(f x)

--Ej 2c)
maximo3 :: Int -> Int -> Int -> Int
maximo3 x y z 
    | x >= y && x >= z = x
    | y >= x && y >= z = y
    | otherwise = z

--Ej 2g)
sumaDistintos :: Int -> Int -> Int -> Int
sumaDistintos x y z
    | x /= y && x /= z && y /= z = x + y + z
    | x /= y && x /= z && y == z = x
    | x /= y && x == z && y /= z = y
    | x == y && x /= z && y /= z = z
    | otherwise = 0

--Ej 2i)
digitoUnidades :: Integer -> Integer
digitoUnidades x
    | x >= 0 = mod x 10
    | otherwise = mod x (-10)

--Ej 2j)
digitoDecenas :: Integer -> Integer
digitoDecenas x
    | x >= 0 = mod (div x 10) 10
    | otherwise = -mod (div x 10) (-10)

--Ej 4b)
todoMenor :: (Float, Float) -> (Float, Float) -> Bool
todoMenor t1 t2
    | fst t1 < fst t2 && snd t1 < snd t2 = True
    | otherwise = False