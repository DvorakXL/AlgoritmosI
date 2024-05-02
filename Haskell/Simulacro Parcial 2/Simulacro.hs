module Simulacro where

-- Ejercicio 1
porcentajeDeVotosAfirmativos :: [(String, String)] -> [Int] -> Int -> Float
porcentajeDeVotosAfirmativos _ _ 0 = 100
porcentajeDeVotosAfirmativos _ listaVotos totalVotos = division votosNoBlancos totalVotos * 100
    where votosNoBlancos = contarVotos listaVotos

contarVotos :: [Int] -> Int
contarVotos [] = 0
contarVotos (x:xs) = x + pasoRecursivo
    where pasoRecursivo = contarVotos xs

division :: Int -> Int -> Float
division a b = (fromIntegral a) / (fromIntegral b)

-- Ejercicio 2
formulasInvalidas :: [(String, String)] -> Bool
formulasInvalidas [] = False
formulasInvalidas (x:xs) = mismasComponentes x || formulaRepetida (x:xs) || pasoRecursivo
    where pasoRecursivo = formulasInvalidas xs

mismasComponentes :: (Eq t) => (t, t) -> Bool
mismasComponentes (x,y) = x == y

formulaRepetida :: (Eq t) => [(t,t)] -> Bool
formulaRepetida [x] = False
formulaRepetida (x:y:xs)
    | fst x == snd y || fst x == fst y = True -- Primer componente esta repetida?
    | snd x == snd y || snd x == fst y = True -- Segunda componente esta repetida?
    | otherwise = pasoRecursivo
    where pasoRecursivo = formulaRepetida (x:xs)

-- Ejercicio 3
porcentajeDeVotos :: String -> [(String, String)] -> [Int] -> Float
porcentajeDeVotos vice formulas votos = division votosAVice votosTotales * 100
    where listaDeVices = candidatosAVice formulas
          votosAVice   = cantidadDeVotosAVice vice listaDeVices votos
          votosTotales = contarVotos votos

candidatosAVice :: [(String, String)] -> [String]
candidatosAVice [(x,y)] = [y]
candidatosAVice ((x,y):xs) = y:candidatosAVice xs

cantidadDeVotosAVice :: String -> [String] -> [Int] -> Int
cantidadDeVotosAVice _ [] [] = 0
cantidadDeVotosAVice x (vice:vices) (voto:votos)
    | x == vice = voto
    | otherwise = cantidadDeVotosAVice x vices votos

-- Ejercicio 4
menosVotado :: [(String, String)] -> [Int] -> String
menosVotado formulas votos = presidenteMinimosVotos listaPresidentes votos
    where listaPresidentes = candidatosAPresidente formulas

candidatosAPresidente :: [(String, String)] -> [String]
candidatosAPresidente [(x,y)] = [x]
candidatosAPresidente ((x,y):xs) = x:candidatosAPresidente xs

presidenteMinimosVotos :: [String] -> [Int] -> String
presidenteMinimosVotos [x] _ = x
presidenteMinimosVotos (p1:p2:presis) (v1:v2:votos)
    | v1 < v2 = presidenteMinimosVotos (p1:presis) (v1:votos)
    | otherwise = presidenteMinimosVotos (p2:presis) (v2:votos)