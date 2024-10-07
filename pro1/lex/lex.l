%{
  #include<stdio.h>
  int lines=0,chars=0,words=0,spaces=0;
%}
%%
\n {lines++;}
\t {spaces+=4;}
[ ] {spaces++;}
[^ \t\n#]+ {words++;chars+=yyleng;}
# {return 0;}
%%

int yywrap()
{
   return 1;
}

int main()
{
  yylex();
  printf("lines:%d\nwords:%d\nchars:%d\nspaces:%d",lines,words,chars,spaces);
  return 0;
 }
