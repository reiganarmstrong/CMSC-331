import Data.Char

-- Reagan Armstrong (reagana1)

class ParseTree a where
  compile :: a -> String

data ETree
  = VALUE Int
  | PLUS ETree ETree
  | TIMES ETree ETree
  | MINUS ETree ETree
  | DIVIDE ETree ETree
  | UMINUS ETree
  | FalseV
  | TrueV
  | LEQ ETree ETree
  | LTH ETree ETree
  | GEQ ETree ETree
  | GTH ETree ETree
  | EQU ETree ETree
  | NEQ ETree ETree
  | AND ETree ETree
  | OR ETree ETree
  | NOT ETree
  | RVALUE Int String
  deriving (Show, Read)

instance ParseTree ETree where
  compile (VALUE n) = (show n) ++ " "
  compile (PLUS t1 t2) = (compile t1) ++ (compile t2) ++ "+ "
  compile (TIMES t1 t2) = (compile t1) ++ (compile t2) ++ "* "
  compile (MINUS t1 t2) = (compile t1) ++ (compile t2) ++ "- "
  compile (DIVIDE t1 t2) = (compile t1) ++ (compile t2) ++ "/ "
  compile (UMINUS t1) = (compile t1) ++ "NEGATE "
  compile (FalseV) = "0 "
  compile (TrueV) = "-1 "
  compile (LEQ t1 t2) = (compile t1) ++ (compile t2) ++ "<= "
  compile (LTH t1 t2) = (compile t1) ++ (compile t2) ++ "< "
  compile (GEQ t1 t2) = (compile t1) ++ (compile t2) ++ ">= "
  compile (GTH t1 t2) = (compile t1) ++ (compile t2) ++ "> "
  compile (EQU t1 t2) = (compile t1) ++ (compile t2) ++ "= "
  compile (NEQ t1 t2) = (compile t1) ++ (compile t2) ++ "<> "
  compile (AND t1 t2) = (compile t1) ++ (compile t2) ++ "AND "
  compile (OR t1 t2) = (compile t1) ++ (compile t2) ++ "OR "
  compile (NOT t1) = (compile t1) ++ "INVERT "
  compile (RVALUE offset name) =
    "_LV " ++ (show offset) ++ " CELLS + @ ( " ++ name ++ " ) "

data LVALUE = LVALUE Int String
  deriving (Show, Read)

instance ParseTree LVALUE where
  compile (LVALUE offset name) =
    "_LV " ++ (show offset) ++ " CELLS + ( " ++ name ++ " ) "

data Statements
  = STMTLIST Statements Statements
  | ASSIGN LVALUE ETree
  | PRINTBOOL ETree
  | PRINTLNBOOL ETree
  | PRINTINT ETree
  | PRINTLNINT ETree
  | PRINTSTR Int String
  | PRINTLNSTR Int String
  | IFTHEN Int ETree Statements
  | IFTHENELSE Int ETree Statements Statements
  | WHILE Int ETree Statements
  | FOR Int Statements ETree Statements Statements
  deriving (Show, Read)

instance ParseTree Statements where
  compile (STMTLIST s1 s2) = (compile s1) ++ "\n" ++ (compile s2) ++ "\n"
  compile (ASSIGN var expr) = (compile expr) ++ (compile var) ++ "! "
  compile (PRINTBOOL expr) = (compile expr) ++ "0= IF .\" false\" ELSE .\" true\" ENDIF\n"
  compile (PRINTLNBOOL expr) = (compile expr) ++ "0= IF .\" false\" ELSE .\" true\" ENDIF CR\n"
  compile (PRINTINT expr) = (compile expr) ++ ". \n"
  compile (PRINTLNINT expr) = (compile expr) ++ ". CR \n"
  compile (PRINTSTR label str) = ".\" " ++ str ++ "\" ( " ++ (show label) ++ " )\n"
  compile (PRINTLNSTR label str) = ".\" " ++ str ++ "\" ( " ++ (show label) ++ " ) CR \n"
  compile (IFTHEN label test ifpart) =
    (compile test) ++ "IF ( " ++ (show label) ++ " ) \n"
      ++ (compile ifpart)
      ++ "\nENDIF ( "
      ++ (show label)
      ++ " )\n"
  compile (IFTHENELSE label test ifpart elsepart) =
    (compile test) ++ "IF ( " ++ (show label) ++ " ) \n"
      ++ (compile ifpart)
      ++ "ELSE ( "
      ++ (show label)
      ++ " ) "
      ++ (compile elsepart)
      ++ "\nENDIF ( "
      ++ (show label)
      ++ " )\n"
  compile (WHILE label test body) =
    --
    -- label is an Int. It is not used here, but useful for
    --       generating assembly code. It is a unique id of
    --       the while loop.
    --
    -- test  is an ETree. This is the Boolean expression that checks
    --       if the while loop should continue to the next iteration
    --
    -- body  is a Statements. This is a parse tree that contains
    --       the body of the while loop.
    "BEGIN\n" ++ (compile test) ++ "WHILE ( " ++ (show label) ++ " ) \n"
      ++ (compile body)
      ++ "REPEAT ( "
      ++ (show label)
      ++ " ) \n"
  compile (FOR label init test inc body) =
    --
    -- label is an Int. It is not used here, but useful for
    --       generating assembly code. It is a unique id of
    --       the for loop.
    --
    -- init  is an assignment executed before the first
    --       iteration of the for loop.
    --
    -- test  is an ETree. This is the Boolean expression
    --       that checks if the for loop should continue
    --       to the next iteration
    --
    -- inc   is an assignment. This must be executed
    --       at the end of each iteration of the for loop.
    --       (It can be any assignment, not just increments.)
    --
    -- body  is a Statements. This is a parse tree that contains
    --       the body of the for loop.
    --
    (compile init) ++ "\nBEGIN\n" ++ (compile test) ++ "WHILE ( " ++ (show label) ++ " ) \n"
      ++ (compile body)
      ++ (compile inc)
      ++ "REPEAT ( "
      ++ (show label)
      ++ " ) \n"

main = do
  putStrLn "VARIABLE _LV 1000 CELLS ALLOT\n\n"
  putStrLn ": _Main"
  contents <- getContents
  let tree = read contents :: Statements
   in putStr $ compile tree
  putStrLn ";\n"
  putStrLn "_Main bye"
