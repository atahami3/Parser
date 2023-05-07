%{
   /* Definitions */
  #include<stdio.h>
%}
  
/*was used in the grammar rule. this takes inout from lex file that contains all RE*/
%token NUMBER
  
/*define left associativity and precedence*/  
%left '+' '-'
  
%left '*' '/' '%'
  
%left '(' ')'
  
%%
  
S : E{// S is the start symbol when evaluated print to Terminal 
         printf("Result = %d\n", $$);
         return 0;
      };
 

 E : E '+' T {$$=$1+$3;}
   | E '-' T {$$=$1-$3;}
   | T       {$$=$1;}
   ;

 T : T '*' R {$$=$1*$3;}
   | T '/' R { if ($3 == 0) {// cant divide by zero so it has to throw an error
                  printf("Cannot divide by zero\n");
                  exit(0);
                  }
               else {
                  $$=$1/$3;
                  }
            }
   | R       {$$=$1;}
   ;

 R : '(' E ')' {$$=$2;}
   | '-' R     {$$=-$2;} //this takes casre of negatives
   | NUMBER    {$$=$1;}
   ; 
%%
  
void main()
{
   printf("Enter The Expression:\n");

   yyparse();
}
  
void yyerror() // when the expression was not accepted and is invalid 
{
   printf("\nEntered Expression Is Invalid!!\n\n\n\n");
}