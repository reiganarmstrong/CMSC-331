-- This Haskell code is buggy. Fix it.

main = print n
  where
    n = a `div` length xs
      where
        a = 10
        xs = [1, 2, 3, 4, 5]
