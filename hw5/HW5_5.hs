module HW5_5 where

-- Reagan Armstrong (reagana1)

rmax2 [] = []
rmax2 list = reverseList (deleteFirst (maxVal list) (reverseList list))
  where
    maxVal [x] = x
    maxVal (x : y : xs) = maxVal ((if x >= y then x else y) : xs)
    deleteFirst _ [] = []
    deleteFirst x (y : ys)
      | x == y = ys
      | otherwise = y : deleteFirst x ys

reverseList :: [a] -> [a]
reverseList [] = []
reverseList xs = rev xs []
  where
    rev [] ys = ys
    rev (x : xs) ys = rev xs (x : ys)