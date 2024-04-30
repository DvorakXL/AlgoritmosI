module Simulacro where

-- Ejercicio 1 --
relacionesValidas :: [([Char],[Char])] -> Bool
relacionesValidas [] = True
relacionesValidas [(x,y)] = x /= y
relacionesValidas [t1,t2] = 
    not (fst t1 == fst t2 && snd t1 == snd t2 
        || fst t1 == snd t2 && snd t1 == fst t2)
relacionesValidas (t1:t2:relaciones) = 
    relacionesValidas [t1,t2] 
    && relacionesValidas (t1:relaciones) 
    && relacionesValidas (t2:relaciones) 
    && relacionesValidas [t1] 
    && relacionesValidas [t2] 
    && relacionesValidas relaciones

-- Ejercicio 2 --
personas :: [([Char],[Char])] -> [[Char]]
personas [] = []
personas [(x,y)] = [x,y]
personas (x:xs) = quitarRepetidos (personas [x] ++ personas xs)

quitarRepetidos :: [[Char]] -> [[Char]]
quitarRepetidos [] = []
quitarRepetidos [x] = [x]
quitarRepetidos (x:xs) = x:quitarRepetidos (quitarTodos x xs)

quitarTodos :: [Char] -> [[Char]] -> [[Char]]
quitarTodos _ [] = []
quitarTodos y (x:xs)
    | y == x = quitarTodos y xs
    | otherwise = x:quitarTodos y xs

-- Ejercicio 3 --
amigosDe :: [Char] -> [([Char],[Char])] -> [[Char]]
amigosDe _ [] = []
amigosDe y (x:xs)
    | y == fst x || y == snd x = quitarTodos y (personas [x] ++ amigosDe y xs)
    | otherwise = amigosDe y xs

-- Ejercicio 4 --
personaConMasAmigos :: [([Char],[Char])] -> [Char]
personaConMasAmigos [(x,y)] = x
personaConMasAmigos xs = repetidoMasVeces (personasRepetidas xs)

personasRepetidas :: [([Char],[Char])] -> [[Char]]
personasRepetidas [] = []
personasRepetidas [(x,y)] = [x,y]
personasRepetidas (x:xs) = personas [x] ++ personasRepetidas xs

repetidoMasVeces :: [[Char]] -> [Char]
repetidoMasVeces [] = []
repetidoMasVeces [x] = x
repetidoMasVeces [x,y] = x
repetidoMasVeces (x:xs)
    | contarApariciones x (x:xs) > contarApariciones (repetidoMasVeces xs) (x:xs) = x
    | otherwise = repetidoMasVeces xs

contarApariciones :: [Char] -> [[Char]] -> Int
contarApariciones _ [] = 0
contarApariciones [] _ = 0
contarApariciones y (x:xs)
    | y == x = 1 + contarApariciones y xs
    | otherwise = contarApariciones y xs
