

package fx3_ex2;

public class LivroActual extends Livro{
    private String ISBN;
    private double preco;

    public LivroActual(String titulo, String autores[], String ISBN, double preco){
        super(titulo, autores);

        this.ISBN = ISBN;
        this.preco=preco;
    }


    @Override
    public String toString() {

        return super.toString()+"[ISBN: "+ISBN+" ; Preco: "+preco+"]";
    }
}
