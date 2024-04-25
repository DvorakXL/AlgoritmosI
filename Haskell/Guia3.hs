-- Ej 1a)
f :: Int -> Int
f 1 = 8
f 4 = 131
f 16 = 16

--Ej 1b)
g :: Int -> Int
g 8 = 16
g 16 = 4
g 131 = 1

--Ej 1c)
h :: Int -> Int
h x = f(g x)

k :: Int -> Int
k x = g(f x)

---------------------------------------------------------

--Ej 2a)
absoluto :: Int -> Int
absoluto x
    | x >= 0 = x
    | x < 0 = -x

--Ej 2b)
maximoabsoluto :: Int -> Int -> Int
maximoabsoluto x y = max (absoluto x) (absoluto y)

--Ej 2c)
maximo3 :: Int -> Int -> Int -> Int
maximo3 x y z 
    | x >= y && x >= z = x
    | y >= x && y >= z = y
    | otherwise = z

--Ej 2d)
algunoEs0 :: Float -> Float -> Bool
algunoEs0 0 1 = True
algunoEs0 1 0 = True
algunoEs0 0 0 = True
algunoEs0 x y = False

--Ej 2e)
ambosSon0 :: Float -> Float -> Bool
ambosSon0 0 0 = True
ambosSon0 x y = False

--Ej 2f)
mismoIntervalo :: Float -> Float -> Bool
mismoIntervalo x y
    | x <= 3 && y <=3 = True -- (-inf, 3]
    | 3 < x && x <= 7 && 3 < y && y <= 7 = True -- (3,7]
    | x > 7 && y > 7 = True-- (7, +inf)
    | otherwise = False

--Ej 2g)
sumaDistintos :: Int -> Int -> Int -> Int
sumaDistintos x y z
    | x /= y && x /= z && y /= z = x + y + z
    | x /= y && x /= z && y == z = x
    | x /= y && x == z && y /= z = y
    | x == y && x /= z && y /= z = z
    | otherwise = 0

--Ej 2h)
esMultiploDe :: Int -> Int -> Bool
esMultiploDe x y = mod x y == 0 || mod y x == 0

--Ej 2i)
digitoUnidades :: Int -> Int
digitoUnidades x = mod (absoluto x) 10

--Ej 2j)
digitoDecenas :: Int -> Int
digitoDecenas x = mod (div (absoluto x) 10) 10

---------------------------------------------------------

--Ej 3)
estanRelacionados :: Int -> Int -> Bool
estanRelacionados a b = a*a + a*b * div (-a) b == 0

---------------------------------------------------------

--Ej 4a)
prodInt :: (Float, Float) -> (Float, Float) -> Float
prodInt t1 t2 = fst t1 * fst t2 + snd t1 * snd t2

--Ej 4b)
todoMenor :: (Float, Float) -> (Float, Float) -> Bool
todoMenor t1 t2 = fst t1 < fst t2 && snd t1 < snd t2

--Ej 4c)
distanciaPuntos :: (Float, Float) -> (Float, Float) -> Float
distanciaPuntos t1 t2 = sqrt ((fst t2 - fst t1)^2 + (snd t2 - snd t1)^2)

--Ej 4d)
sumaTerna :: (Int, Int, Int) -> Int
sumaTerna (x,y,z) = x + y + z

--Ej 4e)
sumarSoloMultiplos :: (Int, Int, Int) -> Int -> Int
sumarSoloMultiplos (x, y, z) w
    | mod x w == 0 && mod y w == 0 && mod z w == 0 = sumaTerna (x,y,z)
    | mod x w == 0 && mod y w == 0 && mod z w /= 0 = sumaTerna(x,y,0)
    | mod x w /= 0 && mod y w == 0 && mod z w == 0 = sumaTerna(0,y,z)
    | mod x w == 0 && mod y w /= 0 && mod z w == 0 = sumaTerna(x,0,z)
    | mod x w == 0 && mod y w /= 0 && mod z w /= 0 = sumaTerna(x,0,0)
    | mod x w /= 0 && mod y w == 0 && mod z w /= 0 = sumaTerna(0,y,0)
    | mod x w /= 0 && mod y w /= 0 && mod z w == 0 = sumaTerna(0,0,z)
    | otherwise = 0

--Ej 4f)
posPrimerPar :: (Int, Int, Int) -> Int
posPrimerPar (x,y,z)
    | even x = 1
    | even y = 2
    | even z = 3
    | otherwise = 4

--Ej 4g)
crearPar :: a -> b -> (a, b)
crearPar a b = (a, b)

--Ej 4h)
invertir :: (a, b) -> (b, a)
invertir (a, b) = (b, a)

---------------------------------------------------------

--Ej 5a)
--todosMenores :: (Int, Int, Int) -> Bool