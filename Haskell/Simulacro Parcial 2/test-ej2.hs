import Test.HUnit
import Simulacro

main = runTestTT tests

tests = test [
    "Vacio" ~: formulasInvalidas [] ~?= False,
    "Valida 1 elemento" ~: formulasInvalidas valida1 ~?= False,
    "Valida n elementos" ~: formulasInvalidas valida2 ~?= False,
    "Invalida misma componente" ~: formulasInvalidas invalida1 ~?= True,
    "Invalida formula repetida" ~: formulasInvalidas invalida2 ~?= True
    ]

-- Listas

invalida1 = [("Z","W"),("Y","H"),("X","X")]
invalida2 = [("X","Y"),("Z","W"),("Y","H")]
valida1 = [("X","Y")]
valida2 = [("X","Y"),("W","Z"),("A","B")]