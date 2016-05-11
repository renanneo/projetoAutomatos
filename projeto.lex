%{
	#include <stdio.h>
	#define YY_DECL extern int yylex()
	#include "projeto.tab.h"  // to get the token types that we return
%}

%option noyywrap

%%
[ \t]+       	{;}
[0-9]+          {yylval.ival = atoi(yytext); return INT;}
[0-9]+\.[0-9]+	{yylval.fval = atof(yytext); return FLOAT;}
"+" 			{return MY_PLUS;}
"-" 			{return MY_MINUS;}
"*" 			{return MY_STAR;}
"/" 			{return MY_SLASH;}
"(" 			{return MY_PARENTHESIS_LEFT;}
")"				{return MY_PARENTHESIS_RIGHT;}
"ls" 			{return MY_LS;}
"quit" 			{return MY_QUIT;}
"ps" 			{return MY_PS;}
"rm"			{return MY_RM;}
"cd"			{return MY_CD;}
"touch" 		{return MY_TOUCH;}
"ifconfig" 		{return MY_IFCONFIG;}
"mkdir" 		{return MY_MKDIR;}
"rmdir"			{return MY_RMDIR;}
"start"			{return MY_START;}
"kill"			{return MY_KILL;}
"clear"			{return MY_CLEAR;}
[a-zA-Z0-9]+    {yylval.sval = strdup(yytext); return STRING;}
\n 				{return NEWLINE;}
.				{return MY_ERROR;}
%%