package simpsons.vista.gui;

import java.awt.Image;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import javax.imageio.ImageIO;

public class Imagens implements Constantes{

    private static Map<String, Image> imagens = new HashMap<String, Image>();
  
    static {
        try {
            imagens.put(HOMER, ImageIO.read(Resources.getResourceFile(PATH_IMG_HOMER)));
            imagens.put(MARGE, ImageIO.read(Resources.getResourceFile(PATH_IMG_MARGE)));
            imagens.put(BART, ImageIO.read(Resources.getResourceFile(PATH_IMG_BART)));
            imagens.put(LISA, ImageIO.read(Resources.getResourceFile(PATH_IMG_LISA)));
            imagens.put(MAGGIE, ImageIO.read(Resources.getResourceFile(PATH_IMG_MAGGIE)));
        } catch (IOException e) {
        }
    }
    
     public static Image getImagem(String nomePersonagem) {
        return imagens.get(nomePersonagem);
     }
    public static Map<String, Image> getImagens() {
        return imagens;
    }

}
