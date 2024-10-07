%{
#include "y.tab.h"
%}

%%

"int"|"float"|"char"|"double" {return TYPE;}

[a-zA-Z_][a-zA-Z0-9_]* { return IDEN; }
[0-9]+     { return NUM; }
[ \t\n]    ;
.          { return yytext[0]; }

%%


