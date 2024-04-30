import Test.HUnit
import Simulacro

main = runTestTT tests

tests = test [
    "vacio" ~: personas [] ~?= [],
    "personas 1 elemento" ~:  sonIguales_hunit (personas validas1) ["X", "Z"] ~?= True, -- en algun orden
    "personas n elementos" ~: sonIguales_hunit (personas validas2) ["X", "Z", "P", "Q", "A", "B"] ~?= True,
    "personas n elementos repetidos" ~: sonIguales_hunit (personas validas3) ["X", "Z", "Q", "B"] ~?= True
    ]

--Formulas

quitar_hunit :: (Eq t) => t -> [t] -> [t]
quitar_hunit x (y:ys) | x == y = ys
                | otherwise = y : quitar_hunit x ys

incluido_hunit :: (Eq t) => [t] -> [t] -> Bool
incluido_hunit [] l = True
incluido_hunit (x:c) l = elem x l && incluido_hunit c (quitar_hunit x l)

sonIguales_hunit :: (Eq t) => [t] -> [t] -> Bool
sonIguales_hunit xs ys = incluido_hunit xs ys && incluido_hunit ys xs


--Listas

duplicados1 = [("X", "Z"), ("P", "Q"), ("A", "A")]
duplicados2 = [("X", "Z"), ("P", "Q"), ("A", "B"), ("Z", "X")]
validas1 = [("X", "Z")]
validas2 = [("X", "Z"), ("P", "Q"), ("A", "B")]
validas3 = [("X", "Z"), ("Z", "Q"), ("Q", "B")]
