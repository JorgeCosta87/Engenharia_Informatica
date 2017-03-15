
package fx3_ex2;

import java.util.List;
import java.util.ArrayList;

public class Biblioteca {

    private String nome;
    private List<Livro> livros = new ArrayList<Livro>();

    public Biblioteca(String nome) {
        this.nome = new String(nome);
    }

    public boolean acrescentaLivro(Livro livro) {
        return (livros.add(livro));
    }
    
    public Livro pesquisaLivro(int codigo) {
        int k = livros.indexOf(codigo);
//        int k = livros.indexOf(new Livro(codigo));
        if (k != -1) {
            return livros.get(k);
        }
        return null;
    }

    public boolean eliminaLivro(int codigo) {
        return livros.remove(new Livro(codigo));
    }

    @Override
    public String toString() {
        String s = nome + "\n\n";

        for (Livro livro : livros) {
            s += livro + "\n";
        }

        return s;
    }
}
