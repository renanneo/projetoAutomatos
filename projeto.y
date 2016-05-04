%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

// stuff from flex that bison needs to know about:
extern int yylex();
extern int yyparse();
extern FILE *yyin;
 
void yyerror(const char *s);
void printProjectPath();
%}

%union {
	int ival;
	float fval;
	char *sval;
}

%token <ival> INT
%token <fval> FLOAT
%token <sval> STRING
%token NEWLINE MY_LS

%start inicio

%type <sval> comando

%%

inicio:
		| inicio linhaNova
		;

comando:
	MY_LS comando { system("/bin/ls"); }

linhaNova: NEWLINE {printProjectPath();}
    | comando NEWLINE {printProjectPath();}
;

%%

int main() {
	yyin = stdin;
	
	// parse through the input until there is no more:
	do {
		yyparse();
	} while (!feof(yyin));
	return 0;
}

void yyerror(const char* s) {
	fprintf(stderr, "Erro: %s\n", s);
}

void printProjectPath(){
	char projectName[4096] = "RenanShell:";
	char path[2048];
	getcwd(path, sizeof(path));
	strcat(projectName,path);
	printf("%s>> ",projectName); 
}