import HW6_4

main = do
  let slope1 x = x; g = integrate slope1 in print $ g 5
  let slope1 x = x; g = integrate slope1 in print $ g 10
  let slope2 x = 2 * x; h = integrate slope2 in print $ h 5
  let slope2 x = 2 * x; h = integrate slope2 in print $ h 10
  let oddity n = 2 * n + 1; p = integrate oddity in print $ p 3 + 1
  let oddity n = 2 * n + 1; p = integrate oddity in print $ p 4 + 1
  let oddity n = 2 * n + 1; p = integrate oddity in print $ p 5 + 1
  let oddity n = 2 * n + 1; p = integrate oddity in print $ p 6 + 1