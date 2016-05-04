%{
#include <stdio.h>
#define YY_DECL extern int yylex()

#include "projeto.tab.h"  // to get the token types that we return

%}
%%
"ls" {return MY_LS;}
[ \t]        ;
\n {return NEWLINE;}
[0-9]+            { yylval.ival = atoi(yytext); return INT; }
[0-9]+\.[0-9]+ { yylval.fval = atof(yytext); return FLOAT; }
[a-zA-Z0-9]+      {
	// we have to copy because we can't rely on yytext not changing underneath us:
	yylval.sval = strdup(yytext);
	return STRING;
}
.                ;
%%