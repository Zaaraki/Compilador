package amaro;
import java.io.FileReader;
import java.io.IOException;
import java.nio.file.Paths;


public class Analyzer {
	public static void main(String[] args) throws IOException{
		String rootPath = Paths.get("").toAbsolutePath().toString();
		String subPath = "/src/amaro/";

		String code = rootPath + subPath + "program.pas";
		
		LexicalAnalyzer lexical = new LexicalAnalyzer(new FileReader(code));
		
		Token token;
		
		while ((token = lexical.yylex()) != null) {
			System.out.println(token.nome + " | " + token.valor + " | " + token.linha  + " | " + token.coluna);
		}
	}
}
