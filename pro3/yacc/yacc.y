%{
#include<stdio.h>
#include<stdlib.h>
int yylex();
int yyerror();
int cnt=0;
%}

%token IF NUM IDEN
%left '='
%left '+''-'
%left '*''/'


%%

S:IF A B {cnt++;}
 ;
 
A:'('E')'
 ;
 
E:IDEN OP IDEN
 |IDEN OP NUM
 |IDEN
 ;
 
OP:'<'|'>'|'<''='|'>''='|'=''='|'!''='|'+'|'-'|'*'|'/'|

B:'{'STM B'}'
 |STM
 |';'
 ;

STM:S
   |E';'
   |
   ;
    
E:IDEN '=' E
  |E'+'E
  |E'-'E
  |E'*'E
  |E'/'E
  |IDEN
  |NUM
  ;
 	 
%%

int main()
{
	printf("input\n");
	yyparse();
	printf("successful\n");
	printf("no. of for if is %d\n",cnt);
	return 0;
}

int yyerror(char *s)
{
	printf("error:%s\n",s);
	exit(0);
}
 
