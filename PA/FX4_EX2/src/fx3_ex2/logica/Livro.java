
package fx3_ex2.logica;

import java.io.Serializable;
import java.util.List;
import java.util.ArrayList;

public class Livro implements Comparable<Livro>, Serializable{

    static
    private static int ordemCriacao = 0;
    
    
    private int codigo;
    private String titulo;
    private List<String> autores = new ArrayList<String>();

    Livro(int cod) {
        codigo = cod;
        titulo = null;
        autores = null;
    }


    public Livro(String titulo, String [] autores) {
        this.titulo = titulo;
        codigo = ordemCriacao++;
        if(autores == null) return;
        for (int i = 0; i < autores.length; i++) {
            this.autores.add(autores[i]);
        }
    }

 

    @Override
    public int hashCode() {
        int hash = 3;
        hash = 41 * hash + this.codigo%10;
        return hash;
//        int hash = Character.toUpperCase(titulo.charAt(0))-'A';
//        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
//         if (!(obj instanceof Livro)) {
//            return false;
//        }
        final Livro other = (Livro) obj;
        if (this.codigo != other.codigo) {
            return false;
        }
//        if (this.titulo.equalsIgnoreCase(other.titulo)) {
//            return false;
//        }
        
        return true;
    }





    @Override
    public int compareTo(Livro o) {
            return titulo.compareTo(o.getTitulo());
    }
    

    

    @Override
    public String toString() {
        String s;

        s = "(" + codigo + ") \"" + titulo + "\"";
        for (String autor : autores) {
            s += ", " + autor;
        }

        s += ".";

        return s;
    }

    public int getCodigo() {
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

    public void setAutores(List<String> autores) {
        this.autores = autores;
    }

   

   
}
