/*package amaro;
import java.io.FileReader;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.ArrayList;


public class Analyzer {
	public static void main(String[] args) throws IOException{
		String rootPath = Paths.get("").toAbsolutePath().toString();
		String subPath = "/src/amaro/";

		String code = rootPath + subPath + "program.pas";
		
		Lexer lexical = new Lexer(new FileReader(code));
		
		Token token;
		
		while ((token = lexical.yylex()) != null) {
			System.out.println(token.nome + " | " + token.valor + " | " + token.linha  + " | " + token.coluna);
		}
	}
}
*/