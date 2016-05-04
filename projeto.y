%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>

extern int yylex();
extern int yyparse();
extern FILE *yyin;
 
void yyerror(const char *s);
void printProjectPath();

%}

%union {
	int ival;
	float fval;
	char cval;
	char *sval;
}

%token <ival> INT
%token <fval> FLOAT
%token <sval> STRING
%token NEWLINE
%token MY_LS MY_QUIT MY_PS MY_IFCONFIG

%start inicio

%type <sval> comando

%%

inicio:
	| inicio linhaNova
;

linhaNova: NEWLINE {printProjectPath();}
    | comando NEWLINE {printProjectPath();}
;

comando: MY_LS { system("/bin/ls"); }
	| MY_QUIT {exit(0);}
	| MY_PS {system("/bin/ps");}
	| MY_IFCONFIG {system("ifconfig");}
;

%%

int main() {
	yyin = stdin;

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