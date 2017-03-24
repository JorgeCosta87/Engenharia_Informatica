package ficha3ex02map;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class Biblioteca {

    private String nome;
    private Map<Integer, Livro> livros = new HashMap<Integer, Livro>();

    public Biblioteca(String nome) {
        this.nome = new String(nome);
    }

    public boolean acrescentaLivro(Livro livro) {
        int codigo = livro.getCodigo();
        Livro anterior = livros.put(codigo, livro);
        return anterior == null;
    }

    public Livro pesquisaLivro(int codigo) {
        return livros.get(codigo);
    }

    public boolean eliminaLivro(int codigo) {
        Livro anterior = livros.remove(codigo);
        return anterior != null;
    }

    @Override
    public String toString() {
        String s = nome + "\n\n";

        Set<Integer> chaves = livros.keySet();
        Iterator<Integer> iter = chaves.iterator();
        while (iter.hasNext()) {
            Integer key = iter.next();
            s += " \n" + livros.get(key);
        }
//        for (Integer codigo : chaves) {
//            s += livros.get(codigo) + "\n";
//        }
//        s+=livros;
        return s;
    }
    
    class OrdenaPorTitulo implements Comparator<Livro> {
        public int compare(Livro o1, Livro o2) {
            return o1.getTitulo().compareTo(o2.getTitulo());
        }
    }
    class OrdenaPorCodigo implements Comparator<Livro> {
        public int compare(Livro o1, Livro o2) {
            return o1.getCodigo() - o2.getCodigo();
        }
    }
    public String toStringPorTitulo() {
        List<Livro> listaOrdenada = new ArrayList<Livro>(livros.values()); //Faz a cópia   
        Collections.sort(listaOrdenada, new OrdenaPorTitulo());
//        Collections.sort(listaOrdenada);
        return "Biblioteca ***" + nome + "***\n"
                + "Lista ordenada por titulo:\n" + listaOrdenada;    
    }
    public String toStringPorCodigo() {
        List<Livro> listaOrdenada = new ArrayList<Livro>(livros.values()); //Faz a cópia   
        Collections.sort(listaOrdenada, new OrdenaPorCodigo());
//        Collections.sort(listaOrdenada);
        return "Biblioteca ***" + nome + "***\n"
                + "Lista ordenada por titulo:\n" + listaOrdenada;    
    }
}
