%{
#include "y.tab.h"

%}

%%

"if" {return IF;}
[a-zA-z_][a-zA-z_0-9]* {return IDEN;}
[0-9]+ {return NUM;}
[ \t\n] ;
. {return yytext[0];}

%%
