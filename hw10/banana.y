%{
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include "symtab.h"
#include "strlist2.h"
#include "ast.h"

strlist constrl ;   // global list of constant strings

int yylex() ;

void yyerror(const char *s) {
   fprintf(stderr, "yyerror: %s\n", s) ;
   exit(1) ;
}


FILE *of ;
int global_var_no = 0 ;
int global_str_no = 0 ;
int global_label_no = 0 ;

%}




%union {
   char *strval ;
   int  ival ;
   st_type tval ;
   codeplus cval ;
}

%token <strval> NAME STRING 
%token <strval> NUMBER 
%token <ival> BOOLEAN

%token <cval> PROGRAM
%token <cval> PRINT PRINTLN 
%token <cval> VAR BOOL INT FLOAT
%token <cval> ASSIGN
%token <cval> IF THEN ELSE
%token <cval> WHILE
%token <cval> FOR TO DOWNTO

%left <cval>  AND OR
%nonassoc <cval>  LT LE GT GE EQ NE
%left  <cval> '+' '-'
%left  <cval> '*' '/'
%nonassoc  <cval> UMINUS
%nonassoc  <cval> '!'

%type <cval> program statement_block statement_list statement
%type <ival> declaration_list declaration
%type <cval> assignment print_statement 
%type <cval> if_statement 
%type <cval> while_loop for_loop
%type <cval> expression
%type <tval> type

%%

program : PROGRAM '{' declaration_list statement_list '}' {
      // fprintf(stderr, "reduced program...\n") ;
      strlist_output(stdout, &($4.code)) ;
      strlist_destroy(&($4.code)) ;
   }
   ;


statement_block: '{' statement_list '}' {
      // fprintf(stderr, "reduced statement_block...\n") ;
      $$ = $2 ;
      $2.code.head = NULL ;
      $2.code.last = NULL ;
   }
   ;

declaration_list 
   : /* epsilon */ { 
      // fprintf(stderr, "reduced declaration_list rule 1...\n") ;
   }
   |  declaration_list declaration { 
      // fprintf(stderr, "reduced declaration_list rule 2...\n") ;
   }
   ;

statement_list : statement_list statement {
      // fprintf(stderr, "reduced statement_list rule 1...\n") ;
      strlist_init( &($$.code) ) ;
      strlist_append( &($$.code), 0, "( STMTLIST\n") ;
      strlist_concat( &($$.code), &($1.code) ) ;
      strlist_concat( &($$.code), &($2.code) ) ;
      strlist_append( &($$.code), 0, "\n)\n") ;
   }
   | statement {
      // fprintf(stderr, "reduced statement_list rule 3...\n") ;
      $$ = $1 ;
      $1.code.head = NULL ;
      $1.code.last = NULL ;
      strlist_append( &($$.code), 0, "\n") ;
   }
   ;


statement
   : assignment ';' {
      $$ = $1 ;
      $1.code.head = NULL ;
      $1.code.last = NULL ;
   }
   | print_statement ';' {
      $$ = $1 ;
      $1.code.head = NULL ;
      $1.code.last = NULL ;
   }
   | if_statement {
      $$ = $1 ;
      $1.code.head = NULL ;
      $1.code.last = NULL ;
   }
   | while_loop {
      $$ = $1 ;
      $1.code.head = NULL ;
      $1.code.last = NULL ;
   }
   | for_loop {
      $$ = $1 ;
      $1.code.head = NULL ;
      $1.code.last = NULL ;
   }
   ;


declaration: VAR '{' type '}' NAME ';' {
      // fprintf(stderr, "reduced declaration ...\n") ;

      st_entry s ;
      s.type = $3 ;
      s.var_no = global_var_no++ ;
      st_insert($5, s) ;

      // fprintf(stderr, "Variable %s delcared with type %d.\n", $5, $3) ;
        
      free($5) ;
   }
   ;


type : BOOL {
       $$ = bool_type ;
    }
    | INT {
       $$ = int_type ;
    }
    ;


/* Assignment rules */
assignment: NAME ASSIGN expression {
        st_entry *p ;
        char number[100] ;

        /*
        fprintf(stderr, "Assignment for variable %s.\n", $1) ;
        st_dump() ;
        */

        p = st_find($1) ;
        if (p == NULL) {
           fprintf(stderr, "Error! Undeclared variable: %s\n", $1) ;
           exit(-1) ;
        } else if ($3.tval != p->type) {
           fprintf(stderr, "Error! Incompatible types\n") ;
           exit(-1) ;
        } else {
           sprintf(number, "%3d ", p->var_no) ;
           strlist_init( &($$.code) ) ;
           strlist_append( &($$.code), 0, "( ASSIGN ( LVALUE ") ;
           strlist_append( &($$.code), 0, number) ;
           strlist_append( &($$.code), 0, "\"") ;
           strlist_append( &($$.code), 0, $1) ;
           strlist_append( &($$.code), 0, "\" ) ") ;
           strlist_concat( &($$.code), &($3.code)) ;
           strlist_append( &($$.code), 0, ") ") ;
        }
        free($1) ;
    }   
    ;

/* End Assignment expression rules */


print_statement
    : PRINT expression {
        strlist_init( &($$.code) ) ;
        if ($2.tval == bool_type) {
           strlist_append( &($$.code), 0, "( PRINTBOOL ") ;
           strlist_concat( &($$.code), &($2.code) ) ;
           strlist_append( &($$.code), 0, ") ") ;
        } else {
           strlist_append( &($$.code), 0, "( PRINTINT ") ;
           strlist_concat( &($$.code), &($2.code) ) ;
           strlist_append( &($$.code), 0, ") ") ;
        }
    }   
    | PRINTLN expression {
        strlist_init( &($$.code) ) ;
        if ($2.tval == bool_type) {
           strlist_append( &($$.code), 0, "( PRINTLNBOOL ") ;
           strlist_concat( &($$.code), &($2.code) ) ;
           strlist_append( &($$.code), 0, ") ") ;
        } else {
           strlist_append( &($$.code), 0, "( PRINTLNINT ") ;
           strlist_concat( &($$.code), &($2.code) ) ;
           strlist_append( &($$.code), 0, ") ") ;
        }
    }   
    | PRINT STRING {
        // fprintf(stderr, "Printing literal string %s.\n", $2) ;
		char number[100] ;

        strlist_append(&constrl, global_str_no, $2) ;

        sprintf(number, "%3d ", global_str_no) ;
        global_str_no++ ;

        strlist_init( &($$.code) ) ;
        strlist_append( &($$.code), 0, "( PRINTSTR ") ;
        strlist_append( &($$.code), 0, number) ;
        strlist_append( &($$.code), 0, "\"") ;
        strlist_append( &($$.code), 0, $2) ;
        strlist_append( &($$.code), 0, "\" ) ") ;
        free($2) ;
    }
    | PRINTLN STRING {
        // fprintf(stderr, "Printing literal string %s.\n", $2) ;
		char number[100] ;

        strlist_append(&constrl, global_str_no, $2) ;

        sprintf(number, "%3d ", global_str_no) ;
        global_str_no++ ;

        strlist_init( &($$.code) ) ;
        strlist_append( &($$.code), 0, "( PRINTLNSTR ") ;
        strlist_append( &($$.code), 0, number) ;
        strlist_append( &($$.code), 0, "\"") ;
        strlist_append( &($$.code), 0, $2) ;
        strlist_append( &($$.code), 0, "\" ) ") ;
        free($2) ;
    }
    ;



/* If statement rules */

if_statement 
   : IF '(' expression ')' THEN statement_block  ELSE statement_block {
      char number[100] ;

      if ( $3.tval != bool_type) {
         fprintf(stderr, "Error: Boolean expression expected in 'if' statement\n") ;
         exit(-1) ;
      }

      sprintf(number, "%3d ", global_label_no++) ;

      strlist_init( &($$.code) ) ;
      strlist_append( &($$.code), 0, "( IFTHENELSE ") ;
      strlist_append( &($$.code), 0, number) ;
      strlist_concat( &($$.code), &($3.code) ) ;
      strlist_append( &($$.code), 0, "\n") ;
      strlist_concat( &($$.code), &($6.code) ) ;
      strlist_append( &($$.code), 0, "\n") ;
      strlist_concat( &($$.code), &($8.code) ) ;
      strlist_append( &($$.code), 0, ") ") ;
   }
   | IF '(' expression ')' THEN statement_block {
      char number[100] ;

      if ( $3.tval != bool_type) {
         fprintf(stderr, "Error: Boolean expression expected in 'if' statement\n") ;
         exit(-1) ;
      }

      sprintf(number, "%3d ", global_label_no++) ;
      strlist_init( &($$.code) ) ;
      strlist_append( &($$.code), 0, "( IFTHEN ") ;
      strlist_append( &($$.code), 0, number) ;
      strlist_concat( &($$.code), &($3.code) ) ;
      strlist_append( &($$.code), 0, "\n") ;
      strlist_concat( &($$.code), &($6.code) ) ;
      strlist_append( &($$.code), 0, ") ") ;
   }
   ;

/* End If statement rules */



/* While loop rules */

/* Store current global_label_no in value for terminal WHILE */
while_loop: WHILE '(' expression ')' statement_block {

      char number[100] ;

      if ( $3.tval != bool_type) {
         fprintf(stderr, "Error: Boolean expression expected in 'if' statement\n") ;
         exit(-1) ;
      }

      sprintf(number, "%3d ", global_label_no++) ;
      strlist_init( &($$.code) ) ;
      strlist_append( &($$.code), 0, "( WHILE ") ;
      strlist_append( &($$.code), 0, number) ;
      strlist_concat( &($$.code), &($3.code) ) ;
      strlist_append( &($$.code), 0, "\n") ;
      strlist_concat( &($$.code), &($5.code) ) ;
      strlist_append( &($$.code), 0, ") ") ;
    }
    ;
/* End While loop rules */


/* For loop rules */


/* Store current global_label_no in value for terminal 'FOR' */
for_loop: FOR '(' assignment ';' expression ';' assignment ')' statement_block {
      char number[100] ;

      if ( $5.tval != bool_type) {
         fprintf(stderr, "Error: Boolean expression expected in 'for' statement\n") ;
         exit(-1) ;
      }

      sprintf(number, "%3d ", global_label_no++) ;
      strlist_init( &($$.code) ) ;
      strlist_append( &($$.code), 0, "( FOR ") ;
      strlist_append( &($$.code), 0, number) ;
      strlist_concat( &($$.code), &($3.code) ) ;
      strlist_concat( &($$.code), &($5.code) ) ;
      strlist_concat( &($$.code), &($7.code) ) ;
      strlist_append( &($$.code), 0, "\n") ;
      strlist_concat( &($$.code), &($9.code) ) ;
      strlist_append( &($$.code), 0, ") ") ;
   }
   ;
/* End For loop rules */



/* Arithmetic expression rules */
expression: 
    '(' expression ')' {
       $$ = $2 ;
       $2.code.head = NULL ;
       $2.code.last = NULL ;
    }   
    | expression '+' expression   { 
        if ($1.tval == int_type && $3.tval == int_type) {
           $$.tval = int_type ;
           strlist_init( &($$.code) ) ;
           strlist_append( &($$.code), 0, "( PLUS ") ;
           strlist_concat( &($$.code), &($1.code) ) ;
           strlist_concat( &($$.code), &($3.code) ) ;
           strlist_append( &($$.code), 0, ") ") ;
        } else {
           fprintf(stderr, "Error: types not compatible with '+' operation.\n") ;
           exit(-1) ;
        }
    } 
    | expression '-' expression { 
        if ($1.tval == int_type && $3.tval == int_type) {
           $$.tval = int_type ;
           strlist_init( &($$.code) ) ;
           strlist_append( &($$.code), 0, "( MINUS ") ;
           strlist_concat( &($$.code), &($1.code) ) ;
           strlist_concat( &($$.code), &($3.code) ) ;
           strlist_append( &($$.code), 0, ") ") ;
        } else {
           fprintf(stderr, "Error: types not compatible with binary '-' operation.\n") ;
           exit(-1) ;
        }
    }
    | expression '*' expression { 
        if ($1.tval == int_type && $3.tval == int_type) {
           $$.tval = int_type ;
           strlist_init( &($$.code) ) ;
           strlist_append( &($$.code), 0, "( TIMES ") ;
           strlist_concat( &($$.code), &($1.code) ) ;
           strlist_concat( &($$.code), &($3.code) ) ;
           strlist_append( &($$.code), 0, ") ") ;
        } else {
           fprintf(stderr, "Error: types not compatible with '*' operation.\n") ;
           exit(-1) ;
        }
    } 
    | expression '/' expression { 
        if ($1.tval == int_type && $3.tval == int_type) {
           $$.tval = int_type ;
           strlist_init( &($$.code) ) ;
           strlist_append( &($$.code), 0, "( DIVIDE ") ;
           strlist_concat( &($$.code), &($1.code) ) ;
           strlist_concat( &($$.code), &($3.code) ) ;
           strlist_append( &($$.code), 0, ") ") ;
        } else {
           fprintf(stderr, "Error: types not compatible with '/' operation.\n") ;
           exit(-1) ;
        }
    } 
    | '-' expression %prec UMINUS {
        if ($2.tval == int_type) {
           $$.tval = int_type ;
           strlist_init( &($$.code) ) ;
           strlist_append( &($$.code), 0, "( UMINUS ") ;
           strlist_concat( &($$.code), &($2.code) ) ;
           strlist_append( &($$.code), 0, ") ") ;
        } else {
           fprintf(stderr, "Error: types not compatible with unary '-' operation.\n") ;
           exit(-1) ;
        }
    }
    | NUMBER { 
        $$.tval = int_type ;
        strlist_init( &($$.code) ) ;
        strlist_append( &($$.code), 0, "( VALUE ") ;
        strlist_append( &($$.code), 0, $1) ;
        strlist_append( &($$.code), 0, " ) ") ;
        free($1) ;
    }
    | BOOLEAN { 
        $$.tval = bool_type ;
        strlist_init( &($$.code) ) ;
        strlist_append( &($$.code), 0, "( ") ;
        if ($1 == 0) { 
           strlist_append( &($$.code), 0, "FalseV ) ") ;
        } else {
           strlist_append( &($$.code), 0, "TrueV ) ") ;
        }
    }
    | NAME {
        st_entry *p ;
        char number[100] ; // 99 digits should be enough

        p = st_find($1) ;
        if (p == NULL) {
           fprintf(stderr, "Error: Undeclared variable: %s\n", $1) ;
           exit(-1) ;
        } else {
           $$.tval = p->type ;
           sprintf(number, "%3d ", p->var_no) ;
           strlist_init( &($$.code) ) ;
           strlist_append( &($$.code), 0, "( RVALUE ") ;
           strlist_append( &($$.code), 0, number) ;
           strlist_append( &($$.code), 0, "\"") ;
           strlist_append( &($$.code), 0, $1) ;
           strlist_append( &($$.code), 0, "\" ) ") ;
        }

        free($1) ;  
    }
    ;
/* End Arithmetic expression rules */


/* Comparison expression rules */
expression:
    expression LE expression {
        if ($1.tval == int_type && $3.tval == int_type) {
           $$.tval = bool_type ;
           strlist_init( &($$.code) ) ;
           strlist_append( &($$.code), 0, "( LEQ ") ;
           strlist_concat( &($$.code), &($1.code) ) ;
           strlist_concat( &($$.code), &($3.code) ) ;
           strlist_append( &($$.code), 0, ") ") ;
        } else {
           fprintf(stderr, "Error: types not compatible with '+' operation.\n") ;
           exit(-1) ;
        }
    } 
    | expression LT expression {
        if ($1.tval == int_type && $3.tval == int_type) {
           $$.tval = bool_type ;
           strlist_init( &($$.code) ) ;
           strlist_append( &($$.code), 0, "( LTH ") ;
           strlist_concat( &($$.code), &($1.code) ) ;
           strlist_concat( &($$.code), &($3.code) ) ;
           strlist_append( &($$.code), 0, ") ") ;
        } else {
           fprintf(stderr, "Error: types not compatible with '+' operation.\n") ;
           exit(-1) ;
        }
    } 
    | expression GE expression {
        if ($1.tval == int_type && $3.tval == int_type) {
           $$.tval = bool_type ;
           strlist_init( &($$.code) ) ;
           strlist_append( &($$.code), 0, "( GEQ ") ;
           strlist_concat( &($$.code), &($1.code) ) ;
           strlist_concat( &($$.code), &($3.code) ) ;
           strlist_append( &($$.code), 0, ") ") ;
        } else {
           fprintf(stderr, "Error: types not compatible with '+' operation.\n") ;
           exit(-1) ;
        }
    }
    | expression GT expression {
        if ($1.tval == int_type && $3.tval == int_type) {
           $$.tval = bool_type ;
           strlist_init( &($$.code) ) ;
           strlist_append( &($$.code), 0, "( GTH ") ;
           strlist_concat( &($$.code), &($1.code) ) ;
           strlist_concat( &($$.code), &($3.code) ) ;
           strlist_append( &($$.code), 0, ") ") ;
        } else {
           fprintf(stderr, "Error: types not compatible with '+' operation.\n") ;
           exit(-1) ;
        }
    }
    | expression EQ expression {
        if ($1.tval == int_type && $3.tval == int_type) {
           $$.tval = bool_type ;
           strlist_init( &($$.code) ) ;
           strlist_append( &($$.code), 0, "( EQU ") ;
           strlist_concat( &($$.code), &($1.code) ) ;
           strlist_concat( &($$.code), &($3.code) ) ;
           strlist_append( &($$.code), 0, ") ") ;
        } else {
           fprintf(stderr, "Error: types not compatible with '+' operation.\n") ;
           exit(-1) ;
        }
    }
    | expression NE expression {
        if ($1.tval == int_type && $3.tval == int_type) {
           $$.tval = bool_type ;
           strlist_init( &($$.code) ) ;
           strlist_append( &($$.code), 0, "( NEQ ") ;
           strlist_concat( &($$.code), &($1.code) ) ;
           strlist_concat( &($$.code), &($3.code) ) ;
           strlist_append( &($$.code), 0, ") ") ;
        } else {
           fprintf(stderr, "Error: types not compatible with '+' operation.\n") ;
           exit(-1) ;
        }
    }
    ;
/* End Comparison expression rules */


/* Logical expression rules */
expression:
    expression AND expression { 
        if ($1.tval == bool_type && $3.tval == bool_type) {
           $$.tval = bool_type ;
           strlist_init( &($$.code) ) ;
           strlist_append( &($$.code), 0, "( AND ") ;
           strlist_concat( &($$.code), &($1.code) ) ;
           strlist_concat( &($$.code), &($3.code) ) ;
           strlist_append( &($$.code), 0, ") ") ;
        } else {
           fprintf(stderr, "Error: types not compatible with '&&' operation.\n") ;
           exit(-1) ;
        }
    }
    | expression OR expression { 
        if ($1.tval == bool_type && $3.tval == bool_type) {
           $$.tval = bool_type ;
           strlist_init( &($$.code) ) ;
           strlist_append( &($$.code), 0, "( OR ") ;
           strlist_concat( &($$.code), &($1.code) ) ;
           strlist_concat( &($$.code), &($3.code) ) ;
           strlist_append( &($$.code), 0, ") ") ;
        } else {
           fprintf(stderr, "Error: types not compatible with '||' operation.\n") ;
           exit(-1) ;
        }
    }
    | '!' expression { 
        if ($2.tval == bool_type) {
           $$.tval = bool_type ;
           strlist_init( &($$.code) ) ;
           strlist_append( &($$.code), 0, "( NOT ") ;
           strlist_concat( &($$.code), &($2.code) ) ;
           strlist_append( &($$.code), 0, ") ") ;
        } else {
           fprintf(stderr, "Error: types not compatible with '!' operation.\n") ;
           exit(-1) ;
        }
    }
    ;
/* End Logical expression rules */



%%

int main () {

   /* Set up symbol table and string list */
   st_init() ;   /* Currently does nothing */
   strlist_init(&constrl) ;

   // fprintf (stderr, "Type in a program\n") ;
   //

   yyparse() ;

/* 
   // Print out constant strings for assembly language
   // code generation

   FILE *asmf = fopen("const_strings.asm","w") ;
   assert(asmf != NULL) ;

   strlist_dump_asm_str(asmf, &constrl, "_constr") ;
   fclose(asmf) ;
*/

   strlist_destroy(&constrl) ;

   return 0 ;
}  /* End of main() */
