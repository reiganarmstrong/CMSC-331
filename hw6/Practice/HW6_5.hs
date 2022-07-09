module HW6_5 where
rep::(Int -> Int) -> [Int] -> [Int]
rep f [] = []
rep f (x:xs) = f x:rep f (map f xs)