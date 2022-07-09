import HW8_2

main = do
  print $ eval (Value 8)

  print $ eval (Plus (Value 8) (Value 5))

  print $
    eval
      ( Times
          (Plus (Value 8) (Value 5))
          (Plus (Value 2) (Value 3))
      )

  print $
    eval
      ( Divide
          ( Times
              (Plus (Value 8) (Value 5))
              (Plus (Value 2) (Value 3))
          )
          (Value 4)
      )
