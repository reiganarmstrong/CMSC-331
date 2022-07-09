module HW3 where

-- Reagan Armstrong (reagana1)

div35 :: Int -> [Int]
div35 n
  | n <= 0 = []
  | otherwise = [x | x <- [1 .. n], mod x 3 == 0 || mod x 5 == 0]

perfects :: Int -> [Int]
perfects n = [x | x <- [1 .. n], x == sum [a | a <- [1 .. x - 1], x `mod` a == 0]]
