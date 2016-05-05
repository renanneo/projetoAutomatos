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
void printErro();

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
%token MY_LS MY_QUIT MY_PS MY_IFCONFIG MY_ERROR MY_TOUCH MY_MKDIR

%start inicio

%type <sval> comando

%%

inicio: NEWLINE {printProjectPath();}
    | comando NEWLINE {printProjectPath();}
    | MY_ERROR {printErro();}
	| inicio inicio
;

comando: MY_LS { system("ls"); }
	| MY_QUIT {printf("RenanShell finalizado!\n"); exit(0);}
	| MY_PS {system("ps");}
	| MY_IFCONFIG {system("ifconfig");}
	| MY_TOUCH STRING { 	char stringfinal[1000] = "touch ";
							strcat(stringfinal, $2);
							system(stringfinal);
							printf("Arquivo %s criado! \n", $2);
						}
	| MY_MKDIR STRING {		char stringfinal[1000] = "mkdir ";
							strcat(stringfinal, $2);
							system(stringfinal);
							printf("Pasta %s criada! \n", $2);
						}      
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
	//fprintf(stderr, "Erro: %s\n", s);
	printErro();
}

void printErro() {
	printf("Comando desconhecido \n");

}

void executeCommandWithParameter()

void printProjectPath(){
	char projectName[4096] = "RenanShell:";
	char path[2048];
	getcwd(path, sizeof(path));
	strcat(projectName,path);
	printf("%s>> ",projectName); 
}