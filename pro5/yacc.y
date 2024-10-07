%{
    #include <stdio.h>
    #include <stdlib.h>

    int cnt = 0;
    int yylex();
    int yyerror(const char* s);
%}

%token IDEN TYPE NUM

%%

S: TYPE VL ';'
   ;

VL: V
   | V ',' VL
   ;

V: IDEN
   {
       cnt++;
   }
   | IDEN '[' NUM ']'
   {
       cnt++;
   }
   | IDEN '=' NUM
   {
       cnt++;
   }
   ;
   
EX: IDEN
  | NUM
;

%%

int main() {
    printf("Enter the declaration:\n");
    yyparse();
    printf("Total number of variables are %d\n", cnt);
    return 0;
}

int yyerror(const char* s) {
    printf("Invalid input: %s\n", s);
    exit(1);
}

