module HW6_4 where

--Reagan Armstrong (reagana1)

integrate :: (Int -> Int) -> Int -> Int
integrate f n
  | n <= 0 = 0
  | otherwise = f n + integrate f (n -1)