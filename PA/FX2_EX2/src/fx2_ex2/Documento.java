package fx2_ex2;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

public class Documento {

    private String titulo;
//    private String[] autores;
    List<String> autores = new ArrayList<>();
    private StringBuffer texto = new StringBuffer();

    
    public Documento(String titulo) {
        this.titulo = titulo; 
        
    }
    public void addAutor(String a){
        autores.add(a);
    }
    public void removeAutor(String a){
        autores.remove(a);
    }

//    public void addAutor(String a) {
//        if (autores == null) {
//            autores = new String[1];
//            autores[0] = a;
//        } else {
//            String[] aux;
//            aux = new String[autores.length + 1];
//            for (int i = 0; i < autores.length; i++) {
//                aux[i] = autores[i];
//            }
//            aux[aux.length - 1] = a;
//            autores = aux;
//        }
//    }

//    public int pesquisa(String a) {
//        for (int i = 0; i < autores.length; i++) {
//            if (a.equalsIgnoreCase(autores[i])) {
//                return i;
//            }
//        }
//        return -1;
//    }
    
    public int pesquisa(String a) {
        return autores.indexOf(a);
    }

//    public boolean removeAutor(String a) {
//        int pos = pesquisa(a);
//        if (pos == -1) {
//            return false;
//        }
//        String[] aux = new String[autores.length - 1];
//        for (int i = 0; i < pos; i++) {
//            aux[i] = autores[i];
//        }
//
//        for (int i = pos; i < autores.length - 1; i++) {
//            aux[i] = autores[i + 1];
//        }
//        autores = aux;
//        return true;
//    }

    public void addTexto(String t) {
        texto.append(t);
    }

    int contaPalavras() {
        StringTokenizer s =
                new StringTokenizer(texto.toString(), " ,.\t\n");
        int conta = 0;
        while (s.hasMoreTokens()) {
            System.out.println(" token " + s.nextToken());
            conta++;
        }
        return conta;
//        return s.countTokens();
    }

    public void pontoFinal() {
        boolean ponto = true;
        for (int i = 0; i < texto.length(); i++) {
            char ch = texto.charAt(i);
            if (ch == '.') {
                ponto = true;
            }
            if (ponto) {
                if (Character.isLetter(ch)) {
                    texto.setCharAt(i, Character.toUpperCase(ch));
                    ponto = false;
                }
            }
        }
    }

    public int contaOcorrencias(String palavra) {
        int conta = 0, ind = 0;
        while ((ind = texto.indexOf(palavra, ind)) != -1) {
            ind += palavra.length();
            conta++;
        }
        
        return conta;
    }
    
    @Override
    public String toString() {
        return "Documento{" + "\ntitulo=" + titulo + "\nautores\n" + autores + "\ntexto\n" + texto + '}';
    }
}
