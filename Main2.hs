import HW2

{-
Your HW2.hs file should compile with the following command

   ghc -o Main2 Main2.hs HW2.hs

After which, your should be able to run the compiled  program with

   ./Main2

-}

main :: IO ()
main = do
  print $ halve [1 .. 10]
  print $ halve [7 .. 15]

  print $ safetail1 ([] :: [Int])
  print $ safetail1 ([9 .. 19])

  print $ safetail2 ([] :: [Int])
  print $ safetail2 ([99, 9, 68, 16, 16, 8])

  print $ safetail3 ([] :: [String])
  -- never eat pears
  print $ safetail3 (["pears", "apples", "bananas", "peaches"])