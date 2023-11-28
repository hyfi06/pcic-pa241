{- # LANGUAGE NPlusKPattern #-}
module Ejemplo where

cuad x = x * x
identidad x = x

fac n
 | n == 0 = 1
 | n > 0 = n * fac(n-1)

suc::Int -> Int
suc x = x + 1

fib 0 = 1
fib 1 = 1
fib n | n > 1 = fib (n-2) + fib (n-1)

raices a b c
 | disc >= 0 = ((-b + raizDisc)/denom, (-b - raizDisc)/denom)
 | otherwise = (0, 0)
 where
  disc = b*b - 4*a*c
  raizDisc = sqrt disc
  denom = 2*a

until_n :: (a->Bool) -> (a->a) -> a -> a
until_n p f x = if p x then x else until_n p f (f x)

