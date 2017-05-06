package simpsons.vista.gui;

import simpsons.modelo.ModeloColeccaoPersonagens;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import javax.imageio.ImageIO;
import javax.swing.Box;
import javax.swing.JPanel;
import javax.swing.border.LineBorder;

public class PainelCentral extends JPanel implements Constantes {

    private ModeloColeccaoPersonagens modelo;

//    private static Map<String, Image> imagens;
    private LequeImagens imagensVista;
    private ImagemDestacada destaqueVista;

//    static {
//
//        imagens = new HashMap<String, Image>();
//
//        try {
//            imagens.put(HOMER, ImageIO.read(Resources.getResourceFile(PATH_IMG_HOMER)));
//            imagens.put(MARGE, ImageIO.read(Resources.getResourceFile(PATH_IMG_MARGE)));
//            imagens.put(BART, ImageIO.read(Resources.getResourceFile(PATH_IMG_BART)));
//            imagens.put(LISA, ImageIO.read(Resources.getResourceFile(PATH_IMG_LISA)));
//            imagens.put(MAGGIE, ImageIO.read(Resources.getResourceFile(PATH_IMG_MAGGIE)));
//        } catch (IOException e) {
//        }
//        
//
//    }

    public PainelCentral(ModeloColeccaoPersonagens m) {
        
        modelo = m;

        setBorder(new LineBorder(Color.gray, 2));

        int nPersonagens = m.getPersonagens().size();

        imagensVista = new LequeImagens(modelo);
        imagensVista.setMaximumSize(new Dimension(DIMX_IMGS_COLECCAO * nPersonagens, DIMY_IMGS_COLECCAO));
        imagensVista.setPreferredSize(new Dimension(DIMX_IMGS_COLECCAO * nPersonagens, DIMY_IMGS_COLECCAO));
        imagensVista.setMinimumSize(new Dimension(DIMX_IMGS_COLECCAO * nPersonagens, DIMY_IMGS_COLECCAO));
        imagensVista.setBorder(new LineBorder(Color.BLACK));

        destaqueVista = new ImagemDestacada(modelo);
        destaqueVista.setMaximumSize(new Dimension(DIMX_DESTAQUE, DIMY_DESTAQUE));
        destaqueVista.setPreferredSize(new Dimension(DIMX_DESTAQUE, DIMY_DESTAQUE));
        destaqueVista.setMinimumSize(new Dimension(DIMX_DESTAQUE, DIMY_DESTAQUE));
        destaqueVista.setBorder(new LineBorder(Color.BLACK));

        /*
         * Box layout: a layout manager that allows multiple components to be laid out either vertically or horizontally.
         * The components will not wrap so, for example, a vertical arrangement of components will stay vertically 
         * arranged when the frame is resized. 
         */
        Box box = Box.createVerticalBox();
        box.setBorder(new LineBorder(Color.RED, 2));
        //box.add(Box.createVerticalGlue());
        box.add(Box.createVerticalStrut(20));
        box.add(destaqueVista);
        box.add(Box.createVerticalStrut(20));
//        box.add(Box.createVerticalGlue());
        box.add(imagensVista);
        //box.add(Box.createVerticalGlue());

        add(box);
    }

//    public static Map<String, Image> getImagens() {
//        return imagens;
//    }
//
//    public static Image getImagem(String nomePersonagem) {
//        return imagens.get(nomePersonagem);
//    }

}
