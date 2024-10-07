%{

	#include<stdio.h>
	int single=0,multi=0,mlines=0;
	int yywrap();
	int yylex();
	FILE *comfile;
	
%}

%%

"//"[^\n]* {single++;fprintf(comfile,"%s\n",yytext);}
"/*"[^*]*"*/" {
						multi++;
						mlines++;
						for(int i=0;i<yyleng;i++)
						{
							if(yytext[i]=='\n')
							mlines++;
						}
					  fprintf(comfile,"%s\n",yytext);
}

. fprintf(yyout,"%s",yytext);
%%


int yywrap()
{
	return 1;
}

int main()
{
	yyin=fopen("int.txt","r");
	yyout=fopen("output.txt","w");
	comfile=fopen("comments.txt","w");
	printf("enter the text:\n");
	yylex();
	printf("\nsingle:%d multi:%d mlines:%d",single,multi,mlines);
	return 0;
}
