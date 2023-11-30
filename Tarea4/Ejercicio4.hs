module Ejercicio4 where

-- Caso base: una lista vacía ya está ordenada.
insertionSort [] = []

-- Caso recursivo: Descompone la lista en cabeza (x) y cola (xs),
-- e inserta x en la posición correcta de la lista ordenada recursivamente
insertionSort (x:xs) = insertar x (insertionSort xs)
  where
    -- Función auxiliar para insertar un elemento en una lista ordenada.
    insertar x [] = [x]
    -- Inserta x en una lista vacía.

    -- Inserta x en una lista no vacía (y:ys) de manera ordenada.
    -- Si x es menor o igual a y, lo inserta antes de y.
    -- De lo contrario, mantiene y en su lugar y llama recursivamente
    -- a insertar con x y ys.
    insertar x (y:ys)
      | x <= y    = x : y : ys
      | otherwise = y : insertar x ys

mergeList xs ys = merge (insertionSort xs) (insertionSort ys)
  where
    -- Función auxiliar para fusionar dos listas ordenadas.
    merge xs [] = xs -- Caso base: una lista y la lista vacía
    merge [] xs = xs -- Caso base: la lista vacía y una lista

    -- Caso recursivo: Compara los elementos de cabeza de las listas (x:xs y y:ys).
    -- Si x es menor o igual a y, lo coloca primero en la lista fusionada.
    -- De lo contrario, coloca y primero.
    -- Continúa el proceso de fusión de manera recursiva.
    merge (x:xs) (y:ys)
      | x <= y    = x : merge xs (y:ys)
      | otherwise = y : merge (x:xs) ys
