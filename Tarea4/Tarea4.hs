module Matrices where

sumaMatrices [] [] = []
sumaMatrices (x:xs) (y:ys) = sumarRow x y : sumaMatrices xs ys
  where
    sumarRow [] [] = []
    sumarRow (x:xs) (y:ys) = (x + y) : sumarRow


invertirR = foldr (\ x xs -> xs ++ [x] ) []
invertirL = foldl (\ xs x -> [x] ++ xs) []

mergeSort x:xs
