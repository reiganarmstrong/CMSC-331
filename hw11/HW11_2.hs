module HW11_2 where

-- Reagan Armstrong <reagana1>

import HW11_1

-- Inner game loop that asks user to guess a number
--
play1game :: Int -> IO ()
play1game target = do
  x <- readNum 0 99
  if x > target
    then do
      putStrLn "You should guess lower"
      play1game target
    else
      if x < target
        then do
          putStrLn "You should guess higher"
          play1game target
        else putStrLn "You got it!"