module HW6_4 where

integrate :: (Int -> Int) -> Int -> Int
integrate f 1 = f 1
integrate f x
  | x == 1 = f 1
  | otherwise = f x + (integrate (f) (x -1))