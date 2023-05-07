all: 	lexical_analyzer.l parser_source.y
		yacc parser_source.y -d
		flex lexical_analyzer.l
		gcc lex.yy.c y.tab.c -w
		./a.out