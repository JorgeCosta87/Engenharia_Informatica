package simpsons.vista.gui;

import java.awt.Image;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import javax.imageio.ImageIO;

public class Imagens1 implements Constantes{

    private static Map<String, Image> imagens = new HashMap<String, Image>();
    private static Map<String, String> nomesFicheirosImagens = new HashMap<String, String>();
    static {
            nomesFicheirosImagens.put(HOMER, PATH_IMG_HOMER);
            nomesFicheirosImagens.put(MARGE, PATH_IMG_MARGE);
            nomesFicheirosImagens.put(BART, PATH_IMG_BART);
            nomesFicheirosImagens.put(LISA, PATH_IMG_LISA);
            nomesFicheirosImagens.put(MAGGIE, PATH_IMG_MAGGIE);
    }
//    static {
//        try {
//            imagens.put(HOMER, ImageIO.read(Resources.getResourceFile(PATH_IMG_HOMER)));
//            imagens.put(MARGE, ImageIO.read(Resources.getResourceFile(PATH_IMG_MARGE)));
//            imagens.put(BART, ImageIO.read(Resources.getResourceFile(PATH_IMG_BART)));
//            imagens.put(LISA, ImageIO.read(Resources.getResourceFile(PATH_IMG_LISA)));
//            imagens.put(MAGGIE, ImageIO.read(Resources.getResourceFile(PATH_IMG_MAGGIE)));
//        } catch (IOException e) {
//        }
//    }
    
//     public static Image getImagem(String nomePersonagem) {
//        return imagens.get(nomePersonagem);
//     }
    public static Map<String, Image> getImagens() {
        return imagens;
    }

    public static Image getImagem(String nomePersonagem) {
        Image imagem = imagens.get(nomePersonagem);
        if(imagem == null){
            imagem = carregaImagem(nomePersonagem);
        }
        return imagem;
    }

     static Image carregaImagem(String nomePersonagem) {
        Image imagem = null;
        try {
            String nomeFicheiro = nomesFicheirosImagens.get(nomePersonagem);
            imagem = ImageIO.read(Resources.getResourceFile(nomeFicheiro));
            imagens.put(nomePersonagem, imagem);
        } catch (IOException e) {
            System.err.println("Erro ao carregar a imagem: " + nomePersonagem);
        }
        return imagem;
    }

}
