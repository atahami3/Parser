
%{
  #include<stdio.h>
  #include "y.tab.h"
  extern int yylval;//included to indicate that the variable yylval is defined in the parser
%}
/*start of section rule where regular expressions are defined*/
/*[0-9]+ rule mathces any number to the string yylval then returns NUMBER to the parser*/
/*[\t] rule matches tab and ignores it */
/*[\n] matches new line character and returns 0 indicating end of input*/
/*. return yytext[0]; rule matches any character and assigns the first character of the matched string to the yytext variable. Then, it returns the first character as a token*/
%%
[0-9]+ {
          yylval=atoi(yytext);
          return NUMBER;
  
       }
[\t] ;
  
[\n] return 0;
  
. return yytext[0];
%%
  
int yywrap()
{
   //this function is called at the end of the input and returns 1 at the end of the input to the actual lexer
 return 1;
}

//yacc parser_source.y -d
//flex lexical_analyzer.l
//gcc lex.yy.c y.tab.c -w
//./a.out