%{
#include <string.h>
#include "symtab.h"
#include "ast.h"
#include "y.tab.h"

/* extern YYSTYPE yylval ; */
%}

%%
banana  { return PROGRAM ; }
bool    { return BOOL ; }
else    { return ELSE ; }
for     { return FOR ; }
if      { return IF ; }
int     { return INT ; }
print   { return PRINT ; }
println { return PRINTLN ; }
then    { return THEN ; }
var     { return VAR ; }
while   { return WHILE ; }

:=      { return ASSIGN ; }

\&\&    { return AND ; }
\|\|    { return OR ; }
\<      { return LT ; }
\<=     { return LE ; }
\>      { return GT ; }
\>=     { return GE ; }
==      { return EQ ; }
!=      { return NE ; }



true                    { yylval.ival = 1 ; return BOOLEAN ; }
false                   { yylval.ival = 0 ; return BOOLEAN ; }
[a-zA-Z][0-9a-zA-Z]*    { yylval.strval = strdup(yytext) ; return NAME ; }
[0-9]+                  { yylval.strval = strdup(yytext) ; return NUMBER ; }
\"[^"\n]*["\n]          { /* see lex & yacc book p.31 */
                        int len ;

                        /* copy string, but skip the leading quote */
                        yylval.strval = strdup(yytext+1) ; 

                        /* remove trailing quote if it's there */
                        len = strlen(yylval.strval) ;
                        if (yylval.strval[len-1] == '"') {
                           yylval.strval[len-1] = '\0' ;
                        }
                        return STRING ;
                        }
[ \t\n]                 /* ignore whitespace */
.                       { return yytext[0] ; }
%%
