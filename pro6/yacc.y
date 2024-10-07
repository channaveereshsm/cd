%{
#include<stdio.h>
#include<stdlib.h>

typedef char *string;

struct{

	string op1,op2,res;
	char op;
}code[100];

int idx=-1;

string addtotable(string,string,char);
void threeaddresscode();
void quadruples();
int yylex();
int yyerror();

%}

%union{

	char *exp;
}

%token <exp> IDEN NUM
%type <exp> EXP
%left '+''-'
%left '*''/'

%%

STMTS: STMTS STMT
	  |
	  ;
	  
STMT:EXP '\n'
	 ;
	 
EXP:EXP '+' EXP {$$=addtotable($1,$3,'+');}
   |EXP '-' EXP {$$=addtotable($1,$3,'-');}
   |EXP '*' EXP {$$=addtotable($1,$3,'*');}
   |EXP '/' EXP {$$=addtotable($1,$3,'/');}
   |IDEN '=' EXP {$$=addtotable($1,$3,'=');}
   |'('EXP')' {$$=$2;}
   |IDEN {$$=$1;}
   |NUM {$$=$1;}
   ;
   
   
%%

int yyerror()
{
	printf("error\n");
	exit(0);
}

int main()
{
	printf("enter the expression\n");
	yyparse();
	printf("Three address code\n");
	threeaddresscode();
	printf("quadruple code\n");  
	quadruples();
}

string addtotable(string op1,string op2,char op)
{
		if(op=='=')
		{
			code[idx].res=op1;
			return op1;
		}
		idx++;
		string res=malloc(3);
		sprintf(res,"@%c",idx+'A');
		
		code[idx].op1=op1;
		code[idx].op2=op2;
		code[idx].op=op;
		code[idx].res=res;
		
		return res;
}

void threeaddresscode()
{
	for(int i=0;i<=idx;i++)
	{
		printf("%s = %s %c %s\n",code[i].res,code[i].op1,code[i].op,code[i].op2);
	}
}

void quadruples()
{
	for(int i=0;i<=idx;i++)
	{
		printf("%d %s %s %s %c\n",i,code[i].res,code[i].op1,code[i].op2,code[i].op);
	}
}
 

 
   
   
   
   
   
   
   
