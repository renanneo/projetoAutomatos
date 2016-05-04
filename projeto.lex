%{
#include <stdio.h>
#define YY_DECL extern int yylex()

#include "projeto.tab.h"  // to get the token types that we return

%}
%%
[ \t]       	 ;
"ls" 			{ return MY_LS; }
\n 				{ return NEWLINE; }
[0-9]+          { yylval.ival = atoi(yytext); return INT; }
[0-9]+\.[0-9]+	{ yylval.fval = atof(yytext); return FLOAT; }
. ;
%%