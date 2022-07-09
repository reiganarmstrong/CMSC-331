#include <stdio.h>
#include <stdlib.h>
#include "parser.h"

YYSTYPE yylval ;
extern int yylex() ;

int main(int argc, char **argv) {
   int r ;

   yylval = (char *) malloc(10000) ;
  
   while ( r = yylex() ) {

      if (r < 256) {
         printf("%c", r) ;
         continue ;
      }

      switch (r) {

      case HEARD :
         printf("%s", yylval) ;
         printf("== pat, pat, nice doggy == \n") ;
         break ;

      case NEWLINE :
         printf("\n") ;
         break ;

      case IGNORED :
         printf(".") ;
         break ;

      case NAME :
         break ;
      default :
         fprintf(stderr, "Oops! that wasn't supposed to happen!\n") ;

      }  // end of switch

   }  // end of while
  
   printf("%s", yylval) ;
   free(yylval) ;
   return 0 ;
}