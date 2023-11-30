module Ejercicio1 where
-- Caso base: Si ambas matrices están vacías, devuelve una matriz vacía.
sumaMatrices [] [] = []
-- Caso Recursivo para sumaMatrices
-- Define una función auxiliar sumarRow para sumar dos filas.
sumaMatrices (x:xs) (y:ys) = sumarRow x y : sumaMatrices xs ys
  where
-- Caso base para sumarRow
    sumarRow [] [] = []
-- Caso recursivo para sumarRow
-- Suma los primeros elementos y luego aplica sumarRow recursivamente
    sumarRow (x:xs) (y:ys) = (x + y) : sumarRow xs ys
