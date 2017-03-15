
package fx3_ex2;

public class LivroAntigo extends Livro {

    private int copias;

    public LivroAntigo(String titulo, String autores[], int copias)
    {
          super(titulo, autores);
          this.copias=copias;
    }

    public int getCopias() {
        return copias;
    }

    public void setCopias(int copias) {
        this.copias = copias;
    }

    @Override
    public String toString() {
        return super.toString() + "[Livro antigo com "+copias+" copias]";
    }



}
