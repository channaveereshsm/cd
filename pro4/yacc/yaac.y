%{
	#include<stdio.h>
	#include<stdlib.h>
	int cnt=0;
%}
%token FOR IDEN NUM
%%


S:I
;
I:FOR A B	{cnt++;}
;
A:'('E';'E';'E')'
;
E:IDEN Z IDEN
|IDEN Z NUM
|IDEN U
|IDEN
;
Z:'='|'>'|'<'|'<''='|'>''='|'=''+'|'=''-'
;
U:'+''+'|'-''-' 
;
B:'{'STMT B'}'
|STMT
|';'
;

STMT:I
	 |E1';'
	 |
	 ;
	 
E1:IDEN '=' E1
  |E1'+'E1
  |E1'-'E1
  |E1'*'E1
  |E1'/'E1
  |IDEN
  |NUM
  ;

%%
int main()
{
	printf("Enter the snippet:\n");
	yyparse();
	printf("Count of for : %d\n",cnt);
	return 0;
}
int yyerror()
{
	printf("Invalid\n");
	exit(0);
}
