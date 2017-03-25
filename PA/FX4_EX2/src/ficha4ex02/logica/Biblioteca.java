package ficha4ex02.logica;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 *
 * @author Jose'
 */
public class Biblioteca implements Serializable
{
    static final long serialVersionUID = 1L;
    private String nome;
    private Set<Livro> livros;

    public Biblioteca(String nome) 
    {
        this.nome = nome;
        livros = new HashSet<Livro>();
    }
    
    public Biblioteca(String nome, Livro [] livros)
    {
        this.nome = nome;
        this.livros = new HashSet<>(Arrays.asList(livros));
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }
    
    public boolean acrescentaLivro(String titulo, String autores[])
    {
        if (titulo == null || autores.length < 1)
            return false;

        return (livros.add(new Livro(titulo, autores)));
    }

    public boolean acrescentaLivro(Livro livro)
    {
        return livros.add(livro);
    }
    
    public int getMaxCodigoLivro()
    {
        int max = 0;
        
        for(Livro l:livros){
            if(max < l.getCodigo()){
                max = l.getCodigo();
            }
        }
        
        return max;
    }

    public Livro pesquisaLivro(int codigo)
    {
        for(Livro l:livros){
            if(l.getCodigo()==codigo)
                return l;
        }

        return null;
    }
    
    public Livro pesquisaLivro(String nome)
    {
        for(Livro l:livros){
            if(l.getTitulo().equals(nome)){
                return l;
            }
        }
        
        return null;
    }

    public boolean eliminaLivro(int codigo)
    {
        for(Livro l:livros){
            if(l.getCodigo()==codigo)
                return livros.remove(l);
        }

        return false;
    }

   @Override
    public String toString() //Ordem sequencial
    {
        String s = "<" + nome.toUpperCase() + ">\n\n";

        for(Livro livro:livros)
            s+=livro+"\n";

        return s;
    }
   
   public String toStringOrdenacaoNatural() //Ordem dada pelo compareTo de Livro
   {
        String s = "<" + nome.toUpperCase() + ">\n\n";
        
        List <Livro> listaLivros = new ArrayList<>(livros);         
        Collections.sort(listaLivros);
        
        for(Livro livro:listaLivros)
            s+=livro+"\n";

        return s;
    }
   
    public String toStringOrdenacaoCodigo()
    {
        String s = "<" + nome.toUpperCase() + ">\n\n";
        
        List <Livro> listaLivros = new ArrayList<>(livros);         
        Collections.sort(listaLivros, new OrdenaPorCodigo());
        
        for(Livro livro:listaLivros)
            s+=livro+"\n";

        return s;
    }
    
    class OrdenaPorCodigo implements Comparator<Livro> {
        public int compare(Livro o1, Livro o2) {
            return o1.getCodigo() - o2.getCodigo();                
        }        
    }
    
    public String toStringOrdenacaoTitulo()
    {
        String s = "<" + nome.toUpperCase() + ">\n\n";
        
        List <Livro> listaLivros = new ArrayList<>(livros);         
        Collections.sort(listaLivros, new OrdenaPorTitulo());
        
        for(Livro livro:listaLivros)
            s+=livro+"\n";

        return s;
    }
    
    class OrdenaPorTitulo implements Comparator<Livro> {
        public int compare(Livro o1, Livro o2) {
            return o1.getTitulo().compareTo(o2.getTitulo());                
        }        
    }
}
