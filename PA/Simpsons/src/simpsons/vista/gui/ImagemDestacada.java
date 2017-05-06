
package simpsons.vista.gui;

import simpsons.modelo.Personagem;
import simpsons.modelo.ModeloColeccaoPersonagens;
import java.awt.Graphics;

import java.awt.Image;
import java.util.Observable;
import java.util.Observer;
import javax.swing.JPanel;

public class ImagemDestacada extends JPanel implements Constantes, Observer
{

    private ModeloColeccaoPersonagens modelo;

    public ImagemDestacada(ModeloColeccaoPersonagens modelo)
    {
        this.modelo = modelo;
        this.modelo.addObserver(this);
        update(modelo, null);
    }

    @Override
    public void paintComponent(Graphics g)
    {                
        super.paintComponent(g);

        Personagem personagem = modelo.getPersonagemDestacado();
        Image imagem = Imagens.getImagem(personagem.getNome());     
        
        if(imagem!=null){
            g.drawImage(imagem, 
                    1+(getWidth()-DIMX_IMGS_DESTAQUE)/2, 1+(getHeight()-DIMY_IMGS_DESTAQUE)/2,
                    DIMX_IMGS_DESTAQUE, DIMY_IMGS_DESTAQUE, this);
        }else{
            System.err.println(" imagem == null");
        }
        
    }

    @Override
    public void update(Observable o, Object arg) {
        repaint();
    }
    
}
