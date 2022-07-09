module HW2 where

import Data.Array.Base (listArrayST)
import Data.List

-- Reagan Armstrong (reagana1)

halve :: [a] -> ([a], [a])
halve list = splitAt (length list `div` 2) list

safetail1 :: [a] -> [a]
safetail1 list = if null list then list else tail list

safetail2 :: [a] -> [a]
safetail2 list
  | empty = list
  | otherwise = tail list
  where
    empty = null list

safetail3 :: [a] -> [a]
safetail3 [] = []
safetail3 x = tail x