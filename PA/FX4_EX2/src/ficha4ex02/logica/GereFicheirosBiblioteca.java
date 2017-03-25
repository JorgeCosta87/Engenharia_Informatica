package ficha4ex02.logica;
import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

/**
 *
 * @author Jose'
 */

public class GereFicheirosBiblioteca {
    
    public static final String SEPARADORES_FICH_TEXTO = ";,. ";
    
    public static void preencheBibDeFichTexto(Biblioteca bib, String nomeFicheiro) throws IOException, ClassNotFoundException
    {
        BufferedReader in = null;
        String titulo;
        List <String> autores = new ArrayList<>();
        String linha;
        StringTokenizer st;
        
        try{
            
            in = new BufferedReader(new FileReader(nomeFicheiro));

            while((linha = in.readLine())!=null){ //Lê uma linha de texto. 
                // Retorna uma String contendo a linha lida 
                // sem o caracter de terminação da linha ou null 
                // no caso de ter atingido o fim de ficheiro.

                
                st = new StringTokenizer(linha, SEPARADORES_FICH_TEXTO);
                autores.clear();

                if(!st.hasMoreTokens()){
                    continue;
                }
                
                titulo = st.nextToken().trim();
                
                while(st.hasMoreTokens()){
                    autores.add(st.nextToken().trim());
                }

                if(autores.size() > 0){
                    bib.acrescentaLivro(titulo, autores.toArray(new String [autores.size()]));
                }
            }
        }finally{
            if(in != null) in.close();
        }
        
    }
    
    public static void escreveBibEmFichTexto(Biblioteca bib, String nomeFicheiro) throws IOException, ClassNotFoundException
    {
        PrintWriter out = null;
       
        try{
            
            out = new PrintWriter(new FileOutputStream(nomeFicheiro));
            
            out.println(bib.toStringOrdenacaoCodigo());
                        
        }finally{
            if(out != null) out.close();
        }
        
    }
    
    public static Biblioteca carregaBibDeFicheiroBinario(String nomeFicheiro) throws IOException, ClassNotFoundException
    {
        Biblioteca bib;
        ObjectInputStream in = null;
        
        try{
            in = new ObjectInputStream(new FileInputStream(nomeFicheiro));
            bib = (Biblioteca)in.readObject();
        }finally{
            if(in!=null){
                in.close();
            }
        }
        
        Livro.setOrdemCriacao(bib.getMaxCodigoLivro());
        
        return bib;
    }
    
    public static boolean guardaBibEmFicheiroBinario(Biblioteca bib, String nomeFicheiro)
    {   
        ObjectOutputStream out = null;
                
        try{
            out = new ObjectOutputStream(new FileOutputStream(nomeFicheiro));
            out.writeObject(bib);
            return true;
        }catch(IOException e){
            return false;
        }finally{
            if(out != null){
                try {
                    out.close();
                } catch (IOException e) {
                    return false;
                }
            }
        }

    }
    
}