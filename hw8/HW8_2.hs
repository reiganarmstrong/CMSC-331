module HW8_2 where

import Distribution.Simple.Utils (xargs)

-- Reagan Armstrong (reagana1)

data ETree
  = Value Int
  | Plus ETree ETree
  | Times ETree ETree
  | Minus ETree ETree
  | Divide ETree ETree
  deriving (Show)

eval :: ETree -> Int
eval (Value x) = x
eval (Plus x y) = eval x + eval y
eval (Times x y) = eval x * eval y
eval (Minus x y) = eval x - eval y
eval (Divide x y) = eval x `div` eval y
