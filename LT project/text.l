%{ 
#include<stdlib.h>
void yyerror(char *);
#include "y.tab.h"
	
%}
%% 
[1-9][0-9]*	{
	  
	   yylval.ival= atoi(yytext);
	   return INTEGER;
	        }
[a-z0-9]+	{
	   yylval.cval=strdup(yytext);
	   return VAR;
          }		
"Use Number" 	{return(U);}
"IN"		{return(I);}
"kp.out"	{return(PO);}
"kp.in"		{return(PI);}
[(]		{return *yytext;}
[)]		{return *yytext;}
[;]		{return *yytext;}
[ \t\n\b]	 ;

.		yyerror("unrecognized symbol\n");

%% 


int yywrap(void){return 1;} 

