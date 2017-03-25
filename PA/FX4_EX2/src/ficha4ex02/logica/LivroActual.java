package ficha4ex02.logica;


/**
 *
 * @author Jose'
 */

public class LivroActual extends Livro
{
    private String ISBN;
    private double preco;

    public LivroActual(String titulo, String autores[], String ISBN, double preco)
    {
        super(titulo, autores);

        this.ISBN = ISBN;
        this.preco=preco;
    }

    public String getISBN()
    {
        return ISBN;
    }

    public void setISBN(String ISBN)
    {
        this.ISBN = ISBN;
    }

    public double getPreco()
    {
        return preco;
    }

    public void setPreco(double preco)
    {
        this.preco = preco;
    }
    
    @Override
     public String toString()
    {
        
//        byte [] b = super.toString().getBytes();
//        String s= new String(b, 0, b.length-1); //retira o ponto final
        String s = super.toString();
        return s + " (ISBN: "+ISBN+"; Preco: " + preco + ").";
        
    }
   
}
