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
     INT = 258,
     FLOAT = 259,
     STRING = 260,
     NEWLINE = 261,
     MY_LS = 262,
     MY_QUIT = 263,
     MY_PS = 264,
     MY_IFCONFIG = 265,
     MY_ERROR = 266,
     MY_TOUCH = 267,
     MY_MKDIR = 268,
     MY_RMDIR = 269,
     MY_START = 270,
     MY_KILL = 271,
     MY_CLEAR = 272,
     MY_SLASH = 273,
     MY_PLUS = 274,
     MY_MINUS = 275,
     MY_STAR = 276,
     MY_PARENTHESIS_LEFT = 277,
     MY_PARENTHESIS_RIGHT = 278,
     MY_RM = 279
   };
#endif
/* Tokens.  */
#define INT 258
#define FLOAT 259
#define STRING 260
#define NEWLINE 261
#define MY_LS 262
#define MY_QUIT 263
#define MY_PS 264
#define MY_IFCONFIG 265
#define MY_ERROR 266
#define MY_TOUCH 267
#define MY_MKDIR 268
#define MY_RMDIR 269
#define MY_START 270
#define MY_KILL 271
#define MY_CLEAR 272
#define MY_SLASH 273
#define MY_PLUS 274
#define MY_MINUS 275
#define MY_STAR 276
#define MY_PARENTHESIS_LEFT 277
#define MY_PARENTHESIS_RIGHT 278
#define MY_RM 279




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 20 "projeto.y"
{
	int ival;
	float fval;
	char cval;
	char *sval;
}
/* Line 1529 of yacc.c.  */
#line 104 "projeto.tab.h"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;
