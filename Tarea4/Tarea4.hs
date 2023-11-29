module Tarea4 where

sumaMatrices [] [] = []
sumaMatrices (x:xs) (y:ys) = sumarRow x y : sumaMatrices xs ys
  where
    sumarRow [] [] = []
    sumarRow (x:xs) (y:ys) = (x + y) : sumarRow xs ys


invertirR x = foldr (\ x xs -> xs ++ [x] ) [] x
invertirL x = foldl (\ xs x -> [x] ++ xs) [] x

insertionSort [] = []
insertionSort (x:xs) = insertar x (insertionSort xs)
  where
    insertar x [] = [x]
    insertar x (y:ys)
      | x <= y    = x : y : ys
      | otherwise = y : insertar x ys
