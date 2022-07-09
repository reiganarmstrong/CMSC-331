import HW3

main = do
  putStr "div35 42 is "
  print $ div35 42
  putStr "The third perfect number is "
  print $ perfects 10000 !! 2
