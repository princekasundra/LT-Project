%{
	#include<stdio.h>
	#include<stdlib.h>
	int yylex(void);
	void yyerror(char *);	
%}
%union{
    int ival;
    char *cval;
}
%token U I PO PI 
%token <ival>INTEGER
%token <cval>VAR
%start program
%type expr
%type line1
%type line2
%type line3
%type line4
%%
program:
	expr '\n'	{exit(1);}
	;
expr:	line1		{printf("your syntax is correct\n");exit(0);}
	|line2		{printf("your syntax is correct\n");exit(0);}
	|line3		{printf("your syntax is correct\n");exit(0);}
	|line4		{printf("your syntax is correct\n");exit(0);}
	;
line1: U VAR ';'	{}
	;
line2: I VAR '(' INTEGER ')' ';'	{}
	;
line3: PO '(' VAR ')' ';'	{}
	;
line4:PI '(' VAR ')' ';'	{}
	;
%%
void yyerror(char *s)
{	
	fprintf(stderr,"%s\n",s); 
	exit(0);
}


int main()
{
	printf("Enter the string\n");
	yyparse();
	return 0;
}
