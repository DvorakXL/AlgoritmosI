import Test.HUnit
import Simulacro

main = runTestTT tests

tests = test [
    "test sintaxis" ~: (relacionesValidas [] || not (relacionesValidas [])) ~?= True,
    "relaciones vacias" ~: relacionesValidas [] ~?= True,
    "componentes duplicadas 1" ~: relacionesValidas duplicados1 ~?= False,
    "componentes duplicadas 2" ~: relacionesValidas duplicados2 ~?= False,
    "validas de 1 elemento" ~: relacionesValidas validas1 ~?= True,
    "validas de n elementos" ~: relacionesValidas validas2 ~?= True
    ]

--Formulas


--Listas

duplicados1 = [("X", "Z"), ("P", "Q"), ("A", "A")]
duplicados2 = [("X", "Z"), ("P", "Q"), ("A", "B"), ("Z", "X")]
validas1 = [("X", "Z")]
validas2 = [("X", "Z"), ("P", "Q"), ("A", "B")]
