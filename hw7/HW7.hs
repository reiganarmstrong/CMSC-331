module HW7 where

-- Reagan Armstrong (reagana1)
expr :: [[Char]] -> (Bool, [[Char]])
statement :: [[Char]] -> (Bool, [[Char]])
statementList :: [[Char]] -> (Bool, [[Char]])

safetail [] = []
safetail (x : xs) = xs

safehead [] = ""
safehead (x : xs) = x

expr [] = (False, [])
expr (t : tokens)
  | t == "whatever" || t == "blahblahblah" = (True, tokens)
  | otherwise = (False, [])

statement [] = (False, [])
statement [x] = (False, [])
statement (t1 : t2 : tokens)
  | t1 == "if" =
    let (b1, tokens1) = expr (t2 : tokens)
     in if b1 && safehead tokens1 == "then"
          then
            let (b2, tokens2) = statementList (safetail tokens1)
             in if b2 && safehead tokens2 == "else"
                  then
                    let (b3, tokens3) = statementList (safetail tokens2)
                     in if b3 && safehead tokens3 == "endif"
                          then (True, safetail tokens3)
                          else (False, [])
                  else (False, [])
          else (False, [])
  | t1 == "while" =
    let (b1, tokens1) = expr (t2 : tokens)
     in if b1 && safehead tokens1 == "do"
          then
            let (b2, tokens2) = statementList (safetail tokens1)
             in if b2 && safehead tokens2 == "endwhile"
                  then (True, safetail tokens2)
                  else (False, [])
          else (False, [])
  | t1 == "id" =
    if t2 == ":="
      then expr tokens
      else (False, [])
  | otherwise = (False, [])

statementList [] = (False, [])
statementList tokens =
  let (b1, tokens1) = statement tokens
      next = safehead tokens1
   in if b1 && (next == ";")
        then statementList (safetail tokens1)
        else (b1, tokens1)