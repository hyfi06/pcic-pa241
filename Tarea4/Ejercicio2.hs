module Ejercicio2 where

-- Caso Base
insertionSort [] = []
-- Ordena recursivamente la cola (xs), y luego inserta
-- la cabeza (x) en su posición correcta.
insertionSort (x:xs) = insertar x (insertionSort xs)
  where
-- Función auxiliar para insertar un elemento en una lista ordenada.
    insertar x [] = [x]
-- Caso recursivo para insertar
    insertar x (y:ys)
      | x <= y    = x : y : ys
      | otherwise = y : insertar x ys

compararListas xs ys = insertionSort xs == insertionSort ys
