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
void executeCommandWithStringParameter(char* c, char* p);
void executeCommandWithIntParameter(char*c, int p);

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
%token MY_LS MY_QUIT MY_PS MY_IFCONFIG MY_ERROR MY_TOUCH MY_MKDIR MY_RMDIR MY_START MY_KILL

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
	| MY_TOUCH STRING 	{ 	
							executeCommandWithStringParameter("touch ", $2);
							printf("Arquivo %s criado! \n", $2);
						}
						
	| MY_MKDIR STRING 	{	
							executeCommandWithStringParameter("mkdir ", $2);
							printf("Pasta %s criada! \n", $2);
						}

	| MY_RMDIR STRING 	{		
							executeCommandWithStringParameter("rmdir ", $2);
							printf("Pasta %s deletada! \n", $2);
						}

	| MY_START STRING 	{		
							executeCommandWithStringParameter("open -a ", $2);
							printf("Programa %s iniciado! \n", $2);
						}

	| MY_KILL INT 		{		
							executeCommandWithIntParameter("kill %d", $2);
							printf("Programa %d finalizado! \n", $2);
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

void executeCommandWithStringParameter(char* c, char* p) {
	char command[100];
	strcpy(command,c);
	strcat(command,p);
	system(command);
}

void executeCommandWithIntParameter(char* c, int p) {
	char tempCommand[100];
	strcpy(tempCommand,c);
	char command[100];
   	sprintf(command, c, p);
   	puts(command);
   	system(command);
}

void printProjectPath(){
	char projectName[4096] = "RenanShell:";
	char path[2048];
	getcwd(path, sizeof(path));
	strcat(projectName,path);
	printf("%s>> ",projectName); 
}