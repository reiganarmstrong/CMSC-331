a.out: lex.yy.o y.tab.o symtab.o strlist2.o
	g++ -o banana lex.yy.o y.tab.o symtab.o strlist2.o

y.tab.o: y.tab.c
	gcc -c y.tab.c

lex.yy.o: lex.yy.c y.tab.h
	gcc -c lex.yy.c

strlist2.o: strlist2.c strlist2.h
	gcc -c strlist2.c

symtab.o: symtab.cpp symtab.h
	g++ -c symtab.cpp

lex.yy.c: banana.l y.tab.h ast.h symtab.h
	flex --noyywrap banana.l

y.tab.h: banana.y ast.h
	bison -y -d banana.y

y.tab.c: banana.y ast.h
	bison -y -d banana.y

clean:
	rm -f banana y.tab.h y.tab.o y.tab.c symtab.o lex.yy.c lex.yy.o strlist2.o
