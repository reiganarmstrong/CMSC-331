head :: String -> String -> Bool
head [] [] = True
head [] x = False
head x [] = False
head (x : xs) (y : ys) = x == y