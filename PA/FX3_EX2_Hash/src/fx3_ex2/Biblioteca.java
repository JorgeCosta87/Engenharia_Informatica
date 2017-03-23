
package fx3_ex2;

import java.util.List;
import java.util.HashSet;
import java.util.Iterator;

public class Biblioteca {

    private String nome;
    private HashSet<Livro> livros = new HashSet<Livro>();

    public Biblioteca(String nome) {
        this.nome = new String(nome);
    }

    public boolean acrescentaLivro(Livro livro) {
        return (livros.add(livro));
    }
    
    public Livro pesquisaLivro(int codigo) {
        
        Iterator<Livro> it = livros.iterator();
        
        while(it.hasNext())
        {
            Livro livro = it.next();
            if(codigo == livro.getCodigo())
            {
                return livro;
            }
        }
     /*   
        for ( Livro livro : livros)
        {
            if (codigo == livro.getCodigo())
                return livro;
            
        }
     */
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
