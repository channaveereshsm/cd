%{
	#include "y.tab.h"
%}

%%

[\t\n ] ;

"int"|"float"|"void"|"char" {return TYPE;}
 
"return" {return RET;}

[a-zA-Z_][a-zA-Z_0-9]* {return IDEN;}

[0-9]+ {return NUM;}
 
. {return yytext[0];}
 
%%
