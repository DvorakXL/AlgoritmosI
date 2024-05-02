import Test.HUnit
import Simulacro

main = runTestTT tests

tests = test [
    "1 sola formula" ~: menosVotado valida1 [15] ~?= "X",
    "Formulas con empate" ~: pertenece (menosVotado valida2 [20,8,8]) ["W","A"] ~?= True,
    "Formulas con solo 1 menos votado" ~: menosVotado valida3 [6,3,15,6] ~?= "W"
    ]

-- Formulas

pertenece :: (Eq t) => t -> [t] -> Bool
pertenece _ [] = False
pertenece e (x:xs) = e == x || pertenece e xs

-- Listas

valida1 = [("X","Y")]
valida2 = [("X","Y"),("W","Z"),("A","B")]
valida3 = [("X","Y"),("W","Z"),("A","B"),("H","I")]