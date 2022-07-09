import HW6_5

main = do
  let g = rep (+ 1) in print $ g [1 .. 5]
  let g = rep (+ 1) in print $ g [9, 2, 1, 4]
  let h = rep (* 2) in print $ h [1 .. 5]
  let h = rep (* 2) in print $ h [0, -2, 17, 43, 11]
  let square x = x * x; p = rep square in print $ p [1 .. 4]