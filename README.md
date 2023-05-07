
Implemented a calculator to compute the result of the input arithmetic expression if the input
arithmetic expression is in the language of the given grammar (which is called a valid
arithmetic expression). The user must type the expressions for the program to calculate and print
the results into terminal. 

### How to Run the program:

you can run entering the following commands 

```
yacc parser_source.y -d
flex lexical_analyzer.l
gcc lex.yy.c y.tab.c -w
./a.out
```

or simply run the Make file command

```
make all

```
