-- Ejerecicio 1 --
hayQueCodificar :: Char -> [(Char,Char)] -> Bool
hayQueCodificar _ [] = False
hayQueCodificar c ((x,y):xs)
    | c == x = True
    | otherwise = pasoRecursivo
    where pasoRecursivo = hayQueCodificar c xs

-- Ejercicio 2 --
cuantasVecesHayQueCodificar :: Char -> String -> [(Char,Char)] -> Int
cuantasVecesHayQueCodificar _ _ [] = 0
cuantasVecesHayQueCodificar c frase mapeo
    | hayQueCodificar c mapeo = cuantasApariciones c frase
    | otherwise = 0

cuantasApariciones :: Char -> String -> Int
cuantasApariciones _ [] = 0
cuantasApariciones c (x:xs)
    | c == x = 1 + pasoRecursivo
    | otherwise = pasoRecursivo
    where pasoRecursivo = cuantasApariciones c xs

-- Ejercicio 3 --
laQueMasHayQueCodificar :: String -> [(Char,Char)] -> Char
laQueMasHayQueCodificar frase mapeo = caracterConMasCodificaciones frase listaCodificaciones
    where listaCodificaciones = listaDeCodifPorLetra frase mapeo

listaDeCodifPorLetra :: String -> [(Char,Char)] -> [Int]
listaDeCodifPorLetra [] _ = []
listaDeCodifPorLetra (x:xs) mapeo = codifX : pasoRecursivo
    where codifX = cuantasVecesHayQueCodificar x (x:xs) mapeo
          pasoRecursivo = listaDeCodifPorLetra xs mapeo

caracterConMasCodificaciones :: String -> [Int] -> Char
caracterConMasCodificaciones [x] [c] = x
caracterConMasCodificaciones (x:y:xs) (c1:c2:cs)
    | c1 >= c2 = pasoRecursivoX
    | otherwise = pasoRecursivoY
    where pasoRecursivoX = caracterConMasCodificaciones (x:xs) (c1:cs)
          pasoRecursivoY = caracterConMasCodificaciones (y:xs) (c2:cs)

-- Ejercicio 4 --
codificarFrase :: String -> [(Char,Char)] -> String
codificarFrase frase [] = frase
codificarFrase [] _ = []
codificarFrase (x:xs) mapeos = codificarCaracter x mapeos : pasoRecursivo
    where pasoRecursivo = codificarFrase xs mapeos

codificarCaracter :: Char -> [(Char,Char)] -> Char
codificarCaracter c [] = c
codificarCaracter c ((x,y):xs)
    | c == x = y
    | otherwise = pasoRecursivo
    where pasoRecursivo = codificarCaracter c xs
