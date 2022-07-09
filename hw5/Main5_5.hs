import HW5_5

main = do
  print $ rmax2 [3, 9, 2, 8, 7, 1, 9, 9, 6]
  print $ rmax2 ([] :: [Int])
  print $ rmax2 [1001, 9, 4, 13, 2]
  print $ rmax2 [1001, 9, 4002, 13, 4002]
  print $ rmax2 [1001]
  print $ rmax2 ["Fido", "Ginger", "Rover", "Rover"]