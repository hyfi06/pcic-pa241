module Ejercicio3 where

invertirR x = foldr (\ x xs -> xs ++ [x] ) [] x
invertirL x = foldl (\ xs x -> [x] ++ xs) [] x
