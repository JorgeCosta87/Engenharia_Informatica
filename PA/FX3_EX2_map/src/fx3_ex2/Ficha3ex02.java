/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fx3_ex2;

/**
 *
 * @author Admin2
 */
public class Ficha3ex02 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Biblioteca bib=new Biblioteca("Joanina");
        String [] autores1={"Aut1","Aut2"};
        String [] autores2={"Aut3"};
        String [] autores3={"Aut4","Aut5","Aut6"};

        bib.acrescentaLivro( new Livro("Tit1", autores1));
        bib.acrescentaLivro( new Livro("Tit2", autores2));
        bib.acrescentaLivro( new Livro("Tit3", autores3));

        bib.acrescentaLivro( new LivroAntigo("Tit4", autores2,10));
        bib.acrescentaLivro(new LivroActual("Tit5", autores3,"978-972", 25.56));

        System.out.println(bib);

        System.out.println("Livro com codigo 1: "+bib.pesquisaLivro(1)+"\n");
        System.out.println("Livro com codigo 3: "+bib.pesquisaLivro(3)+"\n");
        System.out.println("Livro com codigo 10: "+bib.pesquisaLivro(10)+"\n");

        System.out.println("Remove livro com codigo 1: "+bib.eliminaLivro(1)+"\n");
        System.out.println("Remove livro com codigo 3: "+bib.eliminaLivro(3)+"\n");
        System.out.println("Remove livro com codigo 10: "+bib.eliminaLivro(10)+"\n");
        System.out.println("Livro com codigo 1: "+bib.pesquisaLivro(1)+"\n");
        System.out.println("Livro com codigo 3: "+bib.pesquisaLivro(3)+"\n");


        Livro l=bib.pesquisaLivro(3);
        if(l instanceof LivroAntigo)
            System.out.println("\nCopias: "+((LivroAntigo)l).getCopias());
    }
    
}
