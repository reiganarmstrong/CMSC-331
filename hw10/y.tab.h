/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     NAME = 258,
     STRING = 259,
     NUMBER = 260,
     BOOLEAN = 261,
     PROGRAM = 262,
     PRINT = 263,
     PRINTLN = 264,
     VAR = 265,
     BOOL = 266,
     INT = 267,
     FLOAT = 268,
     ASSIGN = 269,
     IF = 270,
     THEN = 271,
     ELSE = 272,
     WHILE = 273,
     FOR = 274,
     TO = 275,
     DOWNTO = 276,
     OR = 277,
     AND = 278,
     NE = 279,
     EQ = 280,
     GE = 281,
     GT = 282,
     LE = 283,
     LT = 284,
     UMINUS = 285
   };
#endif
/* Tokens.  */
#define NAME 258
#define STRING 259
#define NUMBER 260
#define BOOLEAN 261
#define PROGRAM 262
#define PRINT 263
#define PRINTLN 264
#define VAR 265
#define BOOL 266
#define INT 267
#define FLOAT 268
#define ASSIGN 269
#define IF 270
#define THEN 271
#define ELSE 272
#define WHILE 273
#define FOR 274
#define TO 275
#define DOWNTO 276
#define OR 277
#define AND 278
#define NE 279
#define EQ 280
#define GE 281
#define GT 282
#define LE 283
#define LT 284
#define UMINUS 285




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 29 "banana.y"
{
   char *strval ;
   int  ival ;
   st_type tval ;
   codeplus cval ;
}
/* Line 1529 of yacc.c.  */
#line 116 "y.tab.h"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

