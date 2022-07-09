module HW6_5 where

--Reagan Armstrong (reagana1)

rep :: (Int -> Int) -> [Int] -> [Int]
rep f [] = []
rep f (x : xs) = f x : rep f (map f xs)

nub [] = []
nub x:xs = [a | a<-x:xs not (elem a x:xs)]

elem n []= False 
elem n x:xs = x==n || elem n xs