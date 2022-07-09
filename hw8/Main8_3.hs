import HW8_2
import HW8_3

third (_, _, x) = x

main = do
  print $ factor ["42"]
  print $ term ["71", "*", "5"]
  print $ expr ["39", "+", "4"]
  print $ expr ["3", "+", "5", "*", "7"]
  print $ expr ["(", "4", "+", "5", ")", "*", "9"]
  print $ expr ["(", "4", "+", "5", ")", "*", "9", "/", "3"]

  print $ eval (third (factor ["42"]))
  print $ eval (third (term ["71", "*", "5"]))
  print $ eval (third (expr ["39", "+", "4"]))
  print $ eval (third (expr ["3", "+", "5", "*", "7"]))
  print $ eval (third (expr ["(", "4", "+", "5", ")", "*", "9"]))
  print $ eval (third (expr ["(", "4", "+", "5", ")", "*", "9", "/", "3"]))
