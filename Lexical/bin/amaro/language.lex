package amaro;
import java_cup.runtime.*;

%%

%{

private void imprimir(String descricao, String lexema, int linha) {
    System.out.println(lexema + " - " + descricao + " - " + linha);
}


/* Cria um new java_cup.runtime.Symbol com informacoes sobre
       o token corrente, o token possui um valor*/

private Token createToken(String name, String value) {
	return new Token( name, value, yyline, yycolumn);
}


%}


%public
%class LexicalAnalyzer
%type Token
%line
%column


BRANCO = [\n| |\t|\r]
ID = [a-z|A-Z][a-z|A-Z|0-9|_]*
INTEIRO = 0|[1-9][0-9]*
REAL = [0-9]+"."[0-9]+
COMM = "(*" [^*] ~"*)" | "{" [^*] ~"}"

%%
/* SEPARADORES */

	";"                { imprimir("Delimitador", yytext(), yyline); }
    	"."                { imprimir("Delimitador", yytext(), yyline); }
	":"                { imprimir("Delimitador", yytext(), yyline); }
	","                { imprimir("Delimitador", yytext(), yyline); }
	"("                { imprimir("Delimitador", yytext(), yyline); }
	")"                { imprimir("Delimitador", yytext(), yyline); }

    	":="               { imprimir("Atribuição", yytext(), yyline); }

	"="                { imprimir("Relacional", yytext(), yyline); }
	">="               { imprimir("Relacional", yytext(), yyline); }
	">"                { imprimir("Relacional", yytext(), yyline); }
	"<="               { imprimir("Relacional", yytext(), yyline); }
	"<"                { imprimir("Relacional", yytext(), yyline); }
	"<>"               { imprimir("Relacional", yytext(), yyline); }


	"-"                { imprimir("Aditivo", yytext(), yyline); }
	"+"                { imprimir("Aditivo", yytext(), yyline); }
	"or"		   { imprimir("Aditivo", yytext(), yyline); }

	"/"                { imprimir("Multiplicativo", yytext(), yyline); }
	"*"                { imprimir("Multiplicativo", yytext(), yyline); }
	"and"              { imprimir("Multiplicativo", yytext(), yyline); }

	"{"			{}
	"}"                	{}

	
"program"               { imprimir("Palavra Reservada", yytext(), yyline); }
"var"               { imprimir("Palavra Reservada", yytext(), yyline); }
"integer"               { imprimir("Palavra Reservada", yytext(), yyline); }
"real"               { imprimir("Palavra Reservada", yytext(), yyline); }
"boolean"               { imprimir("Palavra Reservada", yytext(), yyline); }
"procedure"               { imprimir("Palavra Reservada", yytext(), yyline); }
"begin"               { imprimir("Palavra Reservada", yytext(), yyline); }
"end"               { imprimir("Palavra Reservada", yytext(), yyline); }
"if"               { imprimir("Palavra Reservada", yytext(), yyline); }
"then"               { imprimir("Palavra Reservada", yytext(), yyline); }
"else"               { imprimir("Palavra Reservada", yytext(), yyline); }
"while"               { imprimir("Palavra Reservada", yytext(), yyline); }
"do"               { imprimir("Palavra Reservada", yytext(), yyline); }
"not"               { imprimir("Palavra Reservada", yytext(), yyline); }


{BRANCO}                     {}
{COMM}				{}
{ID}                         { imprimir("Identificador", yytext(), yyline); }
{INTEIRO}			{ imprimir("Número Inteiro", yytext(), yyline); }
{REAL}		{ imprimir("Número Real", yytext(), yyline); }

. { throw new RuntimeException("Caractere inválido " + yytext() + " na linha " + yyline + ", coluna " +yycolumn); }