%{
#include "y.tab.h"
#include<string.h>
%}

%%

[a-zA-Z_][a-zA-z0-9_]* { yylval.exp=strdup(yytext);
								 return IDEN;}
								 
[0-9]+ { yylval.exp=strdup(yytext);
				return NUM;}
				
[-+*/] return yytext[0];

[()=] return yytext[0];

[\n]+ return '\n';

[\t]+ ;

. ; 

%%
