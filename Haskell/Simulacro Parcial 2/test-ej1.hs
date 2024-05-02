import Test.HUnit
import Simulacro

main = runTestTT tests

tests = test [
    "Sin votos" ~: porcentajeDeVotosAfirmativos [] [] 0 ~?= 100.0,
    "Todos votos afirmativos" ~: porcentajeDeVotosAfirmativos valida2 [10,10,5] 25 ~?= 100.0,
    "Algunos votos afirmativos" ~: porcentajeDeVotosAfirmativos valida2 [10,10,0] 40 ~?= 50.0,
    "Ningun voto afirmativo" ~: porcentajeDeVotosAfirmativos valida2 [0,0,0] 10 ~?= 0.0
    ]

-- Listas

valida2 = [("X","Y"),("W","Z"),("A","B")]