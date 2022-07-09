import HW11_1

main = do
  putStrLn "\nTesting readNum 5 35"
  x <- readNum 5 35
  putStrLn $ "Received: " ++ (show x)

  putStrLn "\nTesting readNum 0 99"
  y <- readNum 0 99
  putStrLn $ "Received: " ++ (show y)