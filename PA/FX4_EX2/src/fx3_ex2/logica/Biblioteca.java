package fx3_ex2.logica;

import fx3_ex2.logica.Livro;
import java.util.HashMap;
import java.util.List;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

public class Biblioteca {

    private String nome;
    private Map<Integer,Livro> livros = new HashMap<Integer, Livro>();

    public Biblioteca(String nome) {
        this.nome = new String(nome);
    }

    public boolean acrescentaLivro(Livro livro) {
        int codigo = livro.getCodigo();
        Livro anterior = livros.put(codigo, livro);
        
                return anterior == null; //se for repetido devolve falso
    }
    
    public Livro pesquisaLivro(int codigo) {
        
            return livros.get(codigo);
    }

    public boolean eliminaLivro(int codigo) {
        Livro anterior = livros.remove(codigo);
        return anterior != null; // 
    }

    @Override
    public String toString() {
        String s = nome + "\n\n";

        Set<Integer> chaves = livros.keySet();
        Iterator<Integer> iter = chaves.iterator();
        while(iter.hasNext())
        {
            Integer key = iter.next();
            s += " \n" + livros.get(key);
        } 
        
        /*//outra forma
        for(Integer codigo : chaves)
        {
            s += livros.get(codigo) + "\n";
        }
        
        //outra forma
        s+=livros;
        */
        return s;
    }
}
