package amaro;
import java_cup.runtime.*;

%%

%{

private void imprimir(String descricao, String lexema) {
    System.out.println(lexema + " - " + descricao);

private Token createToken(String name, String value) {
	return new PascalToken( name, value, yyline, yycolumn);
}

%}


%public
%class LexicalAnalyzer
%type Token
%line
%column


BRANCO = [\n| |\t|\r]
ID = [_|a-z|A-Z][a-z|A-Z|0-9|_]*
SOMA = "+"
INTEIRO = 0|[1-9][0-9]*

%%

"if"                         { imprimir("Palavra reservada if", yytext()); }
"then"                       { imprimir("Palavra reservada then", yytext()); }
{BRANCO}                     { imprimir("Espa�o em branco", yytext()); }
{ID}                         { imprimir("Identificador", yytext()); }
{SOMA}						 { imprimir("Operador de soma", yytext()); }
{INTEIRO}					 { imprimir("N�mero Inteiro", yytext()); }

. { throw new RuntimeException("Caractere inv�lido " + yytext() + " na linha " + yyline + ", coluna " +yycolumn); }