package ficha4ex02.logica;


/**
 *
 * @author Jose'
 */

public class LivroAntigo extends Livro
{

    private int copias;

    public LivroAntigo(String titulo, String autores[], int copias)
    {
          super(titulo, autores);
          this.copias=copias;
    }

    public int getCopias()
    {
        return copias;
    }

    public void setCopias(int copias)
    {
        this.copias = copias;
    }

    @Override
    public String toString()
    {        
//        byte [] b = super.toString().getBytes();
//        String s= new String(b, 0, b.length-1); //retira o ponto final
        String s = super.toString();
        return s + " (Livro antigo com " + copias + " copias).";        
    }



}
