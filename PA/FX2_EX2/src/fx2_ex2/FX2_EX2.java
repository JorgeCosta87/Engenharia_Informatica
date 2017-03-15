package fx2_ex2;


public class FX2_EX2 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Documento doc = new Documento("Teste");
        doc.addAutor("Autor 1");
        doc.addAutor("Autor 2");
        doc.addAutor("Autor 3");
        doc.removeAutor("Autor 2");
        doc.addTexto("um   dois cinco .  tres..quatro.,   cinco");
        System.out.println(" cinco = " + doc.contaOcorrencias("cinco"));
        System.out.println(" nove = " + doc.contaOcorrencias("nove"));
        doc.pontoFinal();
        System.out.println(" texto " + doc); 
        System.out.println(" conta palavras " + doc.contaPalavras());
    }
    
}