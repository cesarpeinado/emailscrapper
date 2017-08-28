%{
#include<stdio.h>
#include<string.h>
%}

VALIDOS [a-zA-Z0-9]
VALIDOS_E_SIMBOLOS [a-zA-Z0-9\.\-_]
FINAL_DE_EMAIL [\.][a-zA-z]+

%%

{VALIDOS}+{VALIDOS_E_SIMBOLOS}*{VALIDOS}+@{VALIDOS}+{FINAL_DE_EMAIL}* {
  printf("%s\n", yytext); 
}

{VALIDOS}+{VALIDOS_E_SIMBOLOS}*{VALIDOS}+@{VALIDOS}+[\-_] ; /* Caso especial */
.  ;
\n ;

%%

/* FINAL_DE_EMAIL [\.][a-zA-z]+ -> A parte final de emails é composta apenas por letras na configuração .xx.xx */

int main()
{
  yylex();
  return 0;
}
