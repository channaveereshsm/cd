%{ 
	#include<stdio.h>
	#include<stdlib.h>
	typedef char *string;
	
	
	
	struct{
		string op1,op2,res;
		char op;
	} code[100];
	
	int idx=-1;
	string addToTable(string,string,char);
	void generatecode();
	int yyerror();
	int yylex();
%}

%union{

	char *exp;

}

%token <exp> IDEN NUM
%type <exp> EXP
%left '+' '-'
%left '*' '/'

%%

STMTS : STMTS STMT
		|
		;
		
STMT  : EXP '\n'
      ;
		
EXP   : EXP '+' EXP { $$=addToTable($1,$3,'+');} 
      | EXP '-' EXP { $$=addToTable($1,$3,'-');}
      | EXP '*' EXP { $$=addToTable($1,$3,'*');}
      | EXP '/' EXP { $$=addToTable($1,$3,'/');}
      | '('EXP')' {$$ = $2;}
      | IDEN '=' EXP { $$=addToTable($1,$3,'=');}
      | IDEN {$$=$1;}
      | NUM {$$=$1;}
      ;
    
%%

int yyerror(const char *s)
{
	printf("error %s",s);
	exit(0);
}

int main()
{
	yyparse();
	printf("Target code\n");
	generatecode();
}

string addToTable(string op1,string op2,char op)
{
	if(op =='=')
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

void generatecode()
{
	printf("%d",idx);
	for(int i=0;i<=idx;i++)
	{
		string inst;
		switch(code[idx].op)
		{
			case '+' : inst="ADD";
							break;
			case '-' : inst="SUB";
							break;
			case '*' : inst="MUL";
							break;
			case '/' : inst="DIV";
							break;
		}
		
		printf("LOAD\t R1,%s\n",code[i].op1);
		printf("LOAD\t R2,%s\n",code[i].op2);
		printf("%s\t R3,R1,R2\n",inst);
		printf("STR %s,R3\n",code[i].res);
	}
}
 
 
 
 
