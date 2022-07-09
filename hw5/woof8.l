/*
File: woof7.l
This version splits up the program into 3 pieces: woof7.y, parser.h and
parser.c. Compile using:

% flex woof8.l
% gcc -c lex.yy.c
% gcc -c parser.c
% gcc parser.o lex.yy.o

*/

% option noyywrap

    % {
#include <stdio.h>

#include "parser.h"

    extern YYSTYPE yylval;

    %
}

% %

        << EOF >>
{
    sprintf(yylval, "\nWoof! are we done talking?\n");
    return END;
}

treat {
    sprintf(yylval, "\n!!!%s!!! Woof! yummy!\n", yytext);
    return HEARD;
}

walk {
    sprintf(yylval, "\n!!!%s!!! Woof! where's the leash?\n", yytext);
    return HEARD;
}

dinner {
    sprintf(yylval, "\n!!!%s!!! Woof! I'm hungry!\n", yytext);
    return HEARD;
}

good\ dog {
    sprintf(yylval, "\n!!!%s!!! Woof! talking about me!\n", yytext);
    return HEARD;
}

Rover {
    sprintf(yylval, "\n!!!%s!!! Woof! my name is Ginger!\n", yytext);
    return NAME;
}

Fido {
    sprintf(yylval, "\n!!!%s!!! Woof! my name is Ginger!\n", yytext);
    return NAME;
}

[@ # % $ ^ &] { return yytext[0]; }

\n {
    yylval[0] = '\0';
    return NEWLINE;
}

.{
    yylval[0] = '\0';
    return IGNORED;
}

% %
