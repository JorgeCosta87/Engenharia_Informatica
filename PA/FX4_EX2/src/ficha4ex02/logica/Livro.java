package ficha4ex02.logica;
import java.io.Serializable;
import java.util.List;
import java.util.ArrayList;
import java.util.Arrays;

/**
 *
 * @author Jose'
 */

public class Livro implements Comparable<Livro>, Serializable
{
    static final long serialVersionUID = 2L;
    private static int ordemCriacao = 0;

    private int codigo;
    private String titulo;
    private List<String> autores;

    public Livro (String titulo, String autores[])
    {
        codigo = ++ordemCriacao;
        this.titulo = titulo;

        this.autores = new ArrayList<>(Arrays.asList(autores));        
         
         //this.autores = new ArrayList<>();
         //java.util.Collections.addAll(this.autores, autores);
         
    }

    public static void setOrdemCriacao(int ordemCriacao) {
        
        if(ordemCriacao < 0)
            return;
        
        Livro.ordemCriacao = ordemCriacao;
    }
 
    public int getCodigo()
    {
        return codigo;
    } 

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public List<String> getAutores() {
        return autores;
    }

    public void setAutores(List<String> autores)
    {
        this.autores = autores;
    }
    
    @Override
    public boolean equals(Object obj)
    {        
        if (obj == null)
            return false;
        
        if(getClass() != obj.getClass())
            return false;
                
        
        return ((Livro)obj).codigo == codigo;
    }

    @Override
    public int hashCode()
    {
        int hash = 7;
        hash = 13 * hash + this.codigo;
        return hash;
    }
    
    @Override
    public int compareTo(Livro o)
    {
        return titulo.compareTo(o.getTitulo());
    }

    @Override
    public String toString()
    {
        String s;

        s = "["+codigo+"] \""+titulo+"\"";
        for(String autor:autores)
            s+=", "+autor;

        s+=".";

        return s;
    }
}
