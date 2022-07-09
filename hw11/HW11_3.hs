module HW11_3 where

-- Reagan Armstrong <reagana1>

import Data.Time
import HW11_2

-- get "random" value from system clock
--
getMSec :: IO Int
getMSec = do
  now <- getCurrentTime

  -- milliseconds since UTC midnight
  let msec = round (1000 * (utctDayTime now))
  return msec

-- Outer game loop that asks user if they want to play
--
play :: IO ()
play = do
  putStrLn "Shall we play a game?"
  putStrLn "Press ’Enter’ to continue. Type ’stop’ to stop."
  input <- getLine
  if input == ""
    then do
      time <- getMSec
      let random = time `mod` 100
      putStrLn $ "Psst... for debugging, the number is " ++ show random
      play1game random
      play
    else
      if input == "stop"
        then return ()
        else play