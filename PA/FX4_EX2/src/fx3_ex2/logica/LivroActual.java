

package fx3_ex2.logica;

public class LivroActual extends Livro{
    
    private String ISBN;
    private double preco;

    public LivroActual(String titulo, String autores[], String ISBN, double preco){
        super(titulo, autores);

        this.ISBN = ISBN;
        this.preco=preco;
    }

    public void setISBN(String ISBN) {
        this.ISBN = ISBN;
    }

    public void setPreco(double preco) {
        this.preco = preco;
    }

    public double getPreco() {
        return preco;
    }
    
    public String getISBN()
    {
        return ISBN;
    }

    @Override
    public String toString() {

        //byte [] b = super.toString().getBytes();
        //String s = new String(b, 0, b.length-1); // retira o ponto final;
        
        //String s = super.toString(); //chamar a tostring da class base
        
        return super.toString()+"[ISBN: "+ISBN+" ; Preco: "+preco+"]";
    }
}
