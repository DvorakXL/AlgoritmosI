import Test.HUnit
import Simulacro

main = runTestTT tests

tests = test [
    "Votos afirmativos 100%" ~: porcentajeDeVotos "Y" valida1 [3] ~?= 100.0,
    "Votos afirmativos 50%" ~: porcentajeDeVotos "Z" valida2 [10,10,0] ~?= 50.0,
    "Votos afirmativos 0%" ~: porcentajeDeVotos "B" valida2 [15,5,0] ~?= 0.0
    ]

-- Listas

valida1 = [("X","Y")]
valida2 = [("X","Y"),("W","Z"),("A","B")]