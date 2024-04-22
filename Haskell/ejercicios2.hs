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
    
-- Ejercicio 10 --
-- a)
f1 :: Int -> Int
f1 n
    | n == 0 = 1
    | otherwise = 2^n + f1 (n-1)

-- b)
f2 :: Int -> Float -> Float
f2 n q
    | n == 1 = q
    | otherwise = q ^ n + f2 (n-1) q

-- c)
f3 :: Int -> Float -> Float
f3 n q
    | n == 0 = q
    | otherwise = q^(2*n) + f3 (n-1) q

-- d)
sumatoriaDesde :: Int -> Int -> Float -> Float
sumatoriaDesde i n q
    | i == n = q^i
    | otherwise = q^n + sumatoriaDesde i (n-1) q

f4 :: Int -> Float -> Float
f4 n q = sumatoriaDesde n (2*n) q

-- Ejercicio 11 --
factorial :: Int -> Int
factorial n
    | n == 0 = 1
    | otherwise = n * factorial (n-1)

eAprox :: Int -> Float
eAprox n
    | n == 0 = 1
    | otherwise = (1/fromIntegral (factorial n)) + eAprox (n-1)

e :: Float
e = eAprox 10

-- Ejercicio 13 --
sumatoria1 :: Int -> Int -> Int
sumatoria1 i m
    | m == 0 = 1
    | otherwise = i^m + sumatoria1 i (m-1)

f :: Int -> Int -> Int
f n m
    | n == 0 = 1
    | otherwise = sumatoria1 n m + f (n-1) m

-- Ejercicio 16 --
-- a)
primerDivisor :: Int -> Int -> Int
primerDivisor n i
    | mod n i == 0 = i
    | otherwise = primerDivisor n (i+1)

menorDivisor :: Int -> Int
menorDivisor n = primerDivisor n 2

-- b)
esPrimo :: Int -> Bool
esPrimo n = n /= 1 && primerDivisor n 2 == n

-- d)
nEsimoPrimoCuenta :: Int -> Int -> Int -> Int
nEsimoPrimoCuenta n i j -- n es el primo por hallar, i es la posicion y j un contador
    | i == j = n-1 -- llegamos al primo con posicion i?
    | esPrimo n = nEsimoPrimoCuenta (n+1) i (j+1) -- es primo, agregamos uno a la posicion y volvemos a comparar
    | otherwise = nEsimoPrimoCuenta (n+1) i j -- no es primo, seguimos buscando el primo

nEsimoPrimo :: Int -> Int
nEsimoPrimo n = nEsimoPrimoCuenta 1 n 0

-- Ejercicio 19 --
sumaPrimos :: Int -> Int
sumaPrimos n -- suma de primos hasta n
    | n == 1 = 0
    | esPrimo n = n + sumaPrimos (n-1)
    | otherwise = sumaPrimos (n-1)

esSumaInicialDePrimosHasta :: Int -> Int -> Bool
esSumaInicialDePrimosHasta n i
    | sumaPrimos i > n = False
    | n == sumaPrimos i = True
    | otherwise = esSumaInicialDePrimosHasta n (i+1) 

esSumaInicialDePrimos :: Int -> Bool
esSumaInicialDePrimos n = esSumaInicialDePrimosHasta n 1