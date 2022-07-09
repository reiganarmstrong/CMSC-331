import HW7

program1 =
  [ "id",
    ":=",
    "blahblahblah",
    ";",
    "id",
    ":=",
    "whatever"
  ]

program2 =
  [ "id",
    ":=",
    "blahblahblah",
    ";",
    "id",
    ":=",
    "blahblahblah",
    ";",
    "id",
    ":=",
    "blahblahblah",
    ";",
    "id",
    ":=",
    "whatever"
  ]

program3 =
  [ "while",
    "whatever",
    "do",
    "id",
    ":=",
    "blahblahblah",
    ";",
    "id",
    ":=",
    "whatever",
    ";",
    "if",
    "whatever",
    "then",
    "id",
    ":=",
    "blahblahblah",
    "else",
    "id",
    ":=",
    "whatever",
    "endif",
    "endwhile"
  ]

program4 =
  [ "if",
    "whatever",
    "then",
    "id",
    ":=",
    "blahblahblah",
    ";",
    "while",
    "blahblahblah",
    "do",
    "id",
    ":=",
    "whatever",
    ";",
    "id",
    ":=",
    "whatever",
    ";",
    "id",
    ":=",
    "whatever",
    "endwhile",
    ";",
    "id",
    ":=",
    "whatever",
    "else",
    "id",
    ":=",
    "whatever",
    ";",
    "if",
    "whatever",
    "then",
    "id",
    ":=",
    "blahblahblah",
    "else",
    "id",
    ":=",
    "whatever",
    ";",
    "id",
    ":=",
    "blahblahblah",
    "endif",
    ";",
    "id",
    ":=",
    "blahblahblah",
    "endif"
  ]

-- bad expr

error1 =
  [ "id",
    ":=",
    "however",
    ";",
    "id",
    ":=",
    "whatever"
  ]

-- missing semicolon
error2 =
  [ "id",
    ":=",
    "blahblahblah",
    "id",
    ":=",
    "whatever"
  ]

-- trailing tokens
error3 =
  [ "id",
    ":=",
    "blahblahblah",
    ";",
    "id",
    ":=",
    "blahblahblah",
    ";",
    "id",
    ":=",
    "whatever",
    "endwile"
  ]

-- missing do
error4 =
  [ "while",
    "whatever",
    "id",
    ":=",
    "blahblahblah",
    ";",
    "id",
    ":=",
    "whatever",
    ";",
    "endwhile"
  ]

-- missing semicolon after endwhile
error5 =
  [ "while",
    "whatever",
    "do",
    "id",
    ":=",
    "blahblahblah",
    ";",
    "id",
    ":=",
    "whatever",
    ";",
    "endwhile",
    "id",
    ":=",
    "whatever",
    "endwile"
  ]

-- missing then
error6 =
  [ "if",
    "whatever",
    "id",
    ":=",
    "blahblahblah",
    "else",
    "id",
    ":=",
    "whatever",
    "endif"
  ]

-- missing else
error7 =
  [ "if",
    "whatever",
    "then",
    "id",
    ":=",
    "blahblahblah",
    "endif"
  ]

-- mismatched endif
error8 =
  [ "if",
    "whatever",
    "id",
    ":=",
    "blahblahblah",
    ";",
    "if",
    "whatever",
    "id",
    ":=",
    "blahblahblah",
    "else",
    "id",
    ":=",
    "whatever",
    "else",
    "id",
    ":=",
    "whatever",
    "endif",
    "endif"
  ]

main = do
  putStrLn "\nThese programs should compile:"
  print "Running program1"
  print $ statementList program1

  print "Running program2"
  print $ statementList program2

  print "Running program3"
  print $ statementList program3

  print "Running program4"
  print $ statementList program4

  putStrLn "\nThese programs should NOT compile:"
  print "Running error1"
  print $ statementList error1

  print "Running error2"
  print $ statementList error2

  print "Running error3"
  print $ statementList error3

  print "Running error4"
  print $ statementList error4

  print "Running error5"
  print $ statementList error5

  print "Running error6"
  print $ statementList error6

  print "Running error7"
  print $ statementList error7

  print "Running error8"
  print $ statementList error8