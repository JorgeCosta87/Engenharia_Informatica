package ficha4ex02;
import ficha4ex02.iu.texto.UsaBiblioteca;
import ficha4ex02.logica.Biblioteca;

/**
 *
 * @author Jose'
 */

public class Main {

    public static void main(String[] args) 
    {
        Biblioteca bib = new Biblioteca("Joanina");
        UsaBiblioteca interaccao = new UsaBiblioteca(bib);
        
        interaccao.corre();
    }

}
