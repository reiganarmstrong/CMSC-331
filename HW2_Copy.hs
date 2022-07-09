module HW2_Copy where

halve :: [a] -> ([a], [a])
halve [] = ([], [])
halve list = splitAt (length list `div` 2) list

safetail1 :: [a] -> [a]
safetail1 list =
  if null list
    then []
    else tail list

safetail2 :: [a] -> [a]
safetail2 list
  | null list = []
  | otherwise = tail list

safetail3 :: [a] -> [a]

safeTail3 [] = []
safeTail3 x = tail x