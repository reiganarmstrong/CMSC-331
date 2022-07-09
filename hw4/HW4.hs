module HW4 where

--Reagan Armstrong (reagana1)

skip :: [a] -> [a]
skip [] = []
skip [a] = []
skip (x : y : xs) =
  y : skip xs

merge :: Ord a => [a] -> [a] -> [a]
merge [] [] = []
merge [] a = a
merge a [] = a
merge (x : xs) (y : ys)
  | x > y = y : (x : xs) `merge` ys
  | otherwise = x : (y : ys) `merge` xs