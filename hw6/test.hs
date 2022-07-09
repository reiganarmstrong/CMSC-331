-- nub [] = []
-- nub (x : xs)
--   | elem x xs = nub xs
--   | otherwise = x : nub xs

-- elem n [] = False
-- elem n (x : xs) = x == n || elem n xs

-- isAsc [] = True
-- isAsc [x] = True
-- isAsc (x : y : xs)
--   | x <= y = x : (isAsc y : xs)
--   | otherwise = False

hasPath :: [(Int, Int)] -> Int -> Int -> Bool
hasPath [] _ _ = False
hasPath tup x y =
  if x == y && Bool g then True else hasPath g x y
  where
    g = [a | (a, b) <- tup, a == x]