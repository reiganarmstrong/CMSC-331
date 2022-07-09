{-
File: expr08.hs

This is a recursive-descent parser for the grammar:

        expr -> term | term + expr | term - expr
	term -> factor | factor * term | factor / term
	factor -> const | ( expr )

Here const is a String that can be interpreted as an integer
value (e.g., "8", "72").

There is one function for each non-terminal ( expr, term and factor ).

Each function takes a list of strings to simulate the token stream. The
return value is a pair (b, t). The Boolean b indicates whether parsing
was successful. The list t is a list of unprocessed tokens.

For exmple:

> term ["8", "*", "72", "+", "14"]
(True,["+","14"])

-}

module HW8_3 where

-- Reagan Armstrong (reagana1)

import HW8_2
import Text.Read

-- tail that doesn't crash on empty list

safetail [] = []
safetail (x : xs) = xs

-- head that doesn't crash on empty list

safehead [] = ""
safehead (x : xs) = x

-- ------------------------------------------------------

expr [] = (False, [], Value 0)
expr tokens =
  let (b1, tokens1, tree1) = term tokens
      next = safehead tokens1
   in if b1 && (next == "+")
        then
          let (b2, tokens2, tree2) = term (safetail tokens1)
           in (b2, tokens2, Plus tree1 tree2)
        else
          if b1 && (next == "-")
            then
              let (b2, tokens2, tree2) = term (safetail tokens1)
               in (b2, tokens2, Minus tree1 tree2)
            else (b1, tokens1, tree1)

-- ------------------------------------------------------

term [] = (False, [], Value 0)
term tokens =
  let (b1, tokens1, tree1) = factor tokens
      next = safehead tokens1
   in if b1 && (next == "*")
        then
          let (b2, tokens2, tree2) = term (safetail tokens1)
           in (b2, tokens2, Times tree1 tree2)
        else
          if b1 && (next == "/")
            then
              let (b2, tokens2, tree2) = term (safetail tokens1)
               in (b2, tokens2, Divide tree1 tree2)
            else (b1, tokens1, tree1)

-- ------------------------------------------------------

factor [] = (False, [], Value 0)
factor (t : tokens)
  | t == "(" =
    let (b1, tokens1, tree) = expr tokens
     in if b1 && safehead tokens1 == ")"
          then (True, safetail tokens1, tree)
          else (False, tokens1, Value 0)
  | otherwise = case (readMaybe t :: Maybe Int) of
    Nothing -> (False, t : tokens, Value 0)
    Just n -> (True, tokens, Value n)

-- ------------------------------------------------------
