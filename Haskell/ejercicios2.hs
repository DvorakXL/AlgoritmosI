-- Ejercicio 1 --
fibonacci :: Int -> Int
fibonacci n
    | n == 0 || n == 1 = n
    | otherwise = fibonacci (n-1) + fibonacci (n-2)

-- Ejercicio 2 --
parteEntera :: Float -> Int
parteEntera x
    | x >= (-1) && x < 0 = -1
    | x >= 0 && x < 1 = 0
    | x > 0 = 1 + parteEntera (x-1)
    | x < 0 = (-1) + parteEntera (x+1)

-- Ejercicio 3 --
esDivisible :: Int -> Int -> Bool
esDivisible x y
    | x == y = True
    | x < y = False
    | otherwise = esDivisible(x-y) y -- Le va restando y hasta llegar a que x == y o x < y en cuyo caso no es divisible.

-- Ejercicio 4 --
sumaImpares :: Int -> Int
sumaImpares n
    | n == 1 = 1
    | otherwise = sumaImpares (n-1) + 2*n - 1

-- Ejercicio 5 --
medioFact :: Int -> Int
medioFact n
    | n == 0 || n == 1 = 1
    | otherwise = medioFact(n-2) * n

-- Ejercicio 6 --
sumaDigitos :: Int -> Int
sumaDigitos n
    | n < 10 = n
    | otherwise = sumaDigitos (div n 10) + mod n 10

-- Ejercicio 7 --
todosDigitosIguales :: Int -> Bool
todosDigitosIguales n
    | n < 10 = True
    | n >= 10 = mod n 10 == mod (div n 10) 10 && todosDigitosIguales(div n 10)

-- Ejercicio 8 --
cantDigitos :: Int -> Int
cantDigitos n
    | n < 10 = 1
    | otherwise = 1 + cantDigitos(sacarUnidades n)
    where sacarUnidades n = div n 10

iesimoDigito :: Int -> Int -> Int
iesimoDigito n i = mod (sacarIesimaPos n i) 10
    where sacarIesimaPos n i = div n (10^(cantDigitos n -i))

-- Ejercicio 9 --
esCapicua :: Int -> Bool
esCapicua n
    | n < 10 = True
    | otherwise = iesimoDigito n 1 == digitoUnidad n && esCapicua (div (sacarPrimerDigito n) 10)
    where
        digitoUnidad n = mod n 10
        sacarPrimerDigito n = n - iesimoDigito n 1 * 10^cantDigitos n