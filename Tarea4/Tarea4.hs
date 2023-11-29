module Tarea4 where




-- Ejercicio 1

sumaMatrices [] [] = []
sumaMatrices (x:xs) (y:ys) = sumarRow x y : sumaMatrices xs ys
  where
    sumarRow [] [] = []
    sumarRow (x:xs) (y:ys) = (x + y) : sumarRow xs ys

-- Ejercicio 2

insertionSort [] = []
insertionSort (x:xs) = insertar x (insertionSort xs)
  where
    insertar x [] = [x]
    insertar x (y:ys)
      | x <= y    = x : y : ys
      | otherwise = y : insertar x ys

compararListas xs ys = insertionSort xs == insertionSort ys

-- Ejercicio 3
invertirR x = foldr (\ x xs -> xs ++ [x] ) [] x
invertirL x = foldl (\ xs x -> [x] ++ xs) [] x


-- Ejercicio 4

mergeList xs ys = merge (insertionSort xs) (insertionSort ys)
  where
    merge x [] = x
    merge [] x = x
    merge (x:xs) (y:ys)
      | x <= y    = x : merge xs (y:ys)
      | otherwise = y : merge (x:xs) ys
