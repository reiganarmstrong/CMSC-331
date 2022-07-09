import HW4

main = do
  print $ skip [0 .. 5]
  print $ skip [0 .. 8]
  print $ skip ["dogs", "lions", "aardvark", "tigers", "cat", "bears"]
  print $ merge [1, 7, 9, 13] [2, 3, 4, 10, 15, 18, 20]
  print $ merge [2.1, 3.4, 7.2, 19.7, 20.1, 31.2, 9999.7] [1.1, 2.1, 2.2, 2.3, 2.4, 8.4]