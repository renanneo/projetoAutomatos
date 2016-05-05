%{
	#include <stdio.h>
	#define YY_DECL extern int yylex()
	#include "projeto.tab.h"  // to get the token types that we return
%}

%option noyywrap

%%
[ \t]       	 ;
"ls" 			{return MY_LS;}
"quit" 			{return MY_QUIT;}
"ps" 			{return MY_PS;}
"touch" 		{return MY_TOUCH;}
"ifconfig" 		{return MY_IFCONFIG;}
\n 				{return NEWLINE;}
[0-9]+          {yylval.ival = atoi(yytext); return INT;}
[0-9]+\.[0-9]+	{yylval.fval = atof(yytext); return FLOAT;}
[a-zA-Z0-9]+    {yylval.sval = strdup(yytext); return STRING;}
.				{return MY_ERROR;}
%%