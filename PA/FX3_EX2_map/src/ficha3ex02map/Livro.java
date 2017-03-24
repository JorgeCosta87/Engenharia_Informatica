
package ficha3ex02map;

import java.util.List;
import java.util.ArrayList;

public class Livro /*implements  Comparable<Livro>*/{

    private static int ordemCriacao = 0;
    private int codigo;
    private String titulo;
    private List<String> autores = new ArrayList<String>();

    Livro(int cod) {
        codigo = cod;
        titulo = null;
        autores = null;
    }

    public Livro(String titulo, String autores[]) {
        this.titulo = titulo;
        for (int i = 0; i < autores.length; i++) {
            this.autores.add(autores[i]);
        }
        codigo = ordemCriacao++;
    }

    public int getCodigo() {
        return codigo;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (!(obj instanceof Livro)) {
            return false;
        }
        final Livro other = (Livro) obj;
        if (this.codigo != other.codigo) {
            return false;
        }
        return true;
    }

    @Override
    public int hashCode() {
        int hash = 3;
        hash = 47 * hash + this.codigo;
        return hash;
    }

    @Override
    public String toString() {
        String s;

        s = "(" + codigo + ") \"" + titulo + "\"";
//        for (String autor : autores) {
//            s += ", " + autor;
//        }

        s += ".";

        return s;
    }

    public List<String> getAutores() {
        return autores;
    }

    public void setAutores(List<String> autores) {
        this.autores = autores;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }
    
//    @Override
//    public int compareTo(Livro o) {
//        return titulo.compareTo(o.titulo);
////          return codigo - o.codigo;
//    }
}
