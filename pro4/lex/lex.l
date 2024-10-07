%{
	#include<stdio.h>
	int id=0,op=0,key=0;
	int yywrap();
%}

%%

"int"|"float"|"for"|"if"|"while"|"char"|"return"|"else"|"double"|"exit"|"break" {key++;}
 
[a-zA-z_][a-zA-Z_0-9]* {id++;}

[+-/*!^%=] {op++;}

[^\n] ;

%%

int main()
{
	yyin=fopen("input.txt","r");
	printf("input\n");
	yylex();
	printf("key:%d id:%d op:%d",key,id,op);
}

int yywrap()
{
	return 1;
}
