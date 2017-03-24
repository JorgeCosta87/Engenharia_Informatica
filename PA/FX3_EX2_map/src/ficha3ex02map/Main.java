
package ficha3ex02map;

public class Main {

    public static void main(String[] args) {
        Biblioteca bib=new Biblioteca("Joanina");
        String [] autores1={"Aut1","Aut2"};
        String [] autores2={"Aut3"};
        String [] autores3={"Aut4","Aut5","Aut6"};

        Livro livro0 = new Livro("Tit99", autores1);
//        bib.acrescentaLivro(livro0 );
        bib.acrescentaLivro( new Livro("Tit88", autores2));
        bib.acrescentaLivro( new Livro("Tit77", autores3));
        bib.acrescentaLivro(livro0 );

//        bib.acrescentaLivro( new LivroAntigo("Tit66", autores2,10));
//        bib.acrescentaLivro(new LivroActual("Tit55", autores3,"978-972", 25.56));

        System.out.println("VERSAO MAP");
        System.out.println(" acrescenta repetido " + bib.acrescentaLivro( livro0));
        System.out.println("\n=======Ordem natural=====");
        System.out.println(bib);
        System.out.println("\n=======Ordena por titulo=====");
        System.out.println(bib.toStringPorTitulo());
        System.out.println("\n=======Ordena por codigo=====");
        System.out.println(bib.toStringPorCodigo());

//        System.out.println("Livro com codigo 1: "+bib.pesquisaLivro(1)+"\n");
//        System.out.println("Livro com codigo 3: "+bib.pesquisaLivro(3)+"\n");
//        System.out.println("Livro com codigo 10: "+bib.pesquisaLivro(10)+"\n");
//
//        System.out.println("Remove livro com codigo 1: "+bib.eliminaLivro(1)+"\n");
//        System.out.println("Remove livro com codigo 3: "+bib.eliminaLivro(3)+"\n");
//        System.out.println("Remove livro com codigo 10: "+bib.eliminaLivro(10)+"\n");
//        System.out.println("Livro com codigo 1: "+bib.pesquisaLivro(1)+"\n");
//        System.out.println("Livro com codigo 3: "+bib.pesquisaLivro(3)+"\n");
//
//        System.out.println("\n=======Ordem natural=====");
//        System.out.println(bib);

//        Livro l=bib.pesquisaLivro(3);
//        if(l instanceof LivroAntigo)
//            System.out.println("\nCopias: "+((LivroAntigo)l).getCopias());

    }

}
