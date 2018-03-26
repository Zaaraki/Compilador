package amaro;

public class Token {
	public String nome;
	public String valor;
	public int linha;
	public int coluna;
	
	public Token(String nome, String valor, int linha, int coluna) {
		this.nome=nome;
		this.valor=valor;
		this.linha=linha;
		this.coluna=coluna;
	}
	
}
