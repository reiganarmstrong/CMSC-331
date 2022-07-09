module HW11_1 where

-- Reagan Armstrong <reagana1>

import Text.Read

-- Bug user incessantly for a number in the right range
--
readNum :: Int -> Int -> IO Int
readNum low high = do
  putStrLn $ "Enter a number between " ++ show low ++ " and " ++ show high ++ " (inclusive)"
  str <- getLine
  case readMaybe str :: Maybe Int of
    Nothing -> do
      putStrLn "That's not a number!"
      readNum low high
    Just x -> do
      if x > high
        then do
          putStrLn $ "Number cannot be more than " ++ show high
          readNum low high
        else
          if x < low
            then do
              putStrLn $ "Number must be at least " ++ show low
              readNum low high
            else do
              return x
