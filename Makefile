all:
	rm -rf projeto projeto.tab.h projeto.tab.c lex.yy.c
	bison -d projeto.y
	flex -l projeto.lex
	gcc projeto.tab.c lex.yy.c -ll -o projeto
