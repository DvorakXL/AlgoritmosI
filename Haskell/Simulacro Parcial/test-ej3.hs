import Test.HUnit
import Simulacro

main = runTestTT tests


tests = test [
    "vacio" ~: amigosDe "A" [] ~?= [],
    "sin amigos" ~: amigosDe "A" validas1 ~?= [],
    "amigosDe 1 elemento" ~: sonIguales_hunit (amigosDe "A" validas2) ["B"] ~?= True,
    "amigosDe n elementos" ~: sonIguales_hunit (amigosDe "A" validas3) ["B", "X", "Z"] ~?= True
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

validas1 = [("X", "Z")]
validas2 = [("X", "Z"), ("P", "Q"), ("A", "B")]
validas3 = [("X", "Z"), ("P", "Q"), ("A", "B"), ("X", "A"), ("Z", "A")]
