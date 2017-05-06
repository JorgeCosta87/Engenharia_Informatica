package simpsons.vista.gui;

import simpsons.modelo.Personagem;
import simpsons.modelo.ModeloColeccaoPersonagens;
import java.awt.Color;
import java.awt.Graphics;
import java.awt.Image;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.util.List;
import java.util.Observable;
import java.util.Observer;
import javax.swing.JPanel;

public class LequeImagens extends JPanel implements Constantes, Observer
{

    private ModeloColeccaoPersonagens modelo;

    public LequeImagens(ModeloColeccaoPersonagens modelo) {
        this.modelo = modelo;
        this.modelo.addObserver(this);
        addMouseListener( new DestaqueListener());
        update(modelo, null);
    }
    
    @Override
    public void paintComponent( Graphics g)
    {        
        super.paintComponent( g);

        List<Personagem> personagens = modelo.getPersonagens();
        int destaque = modelo.getIndicePersonagemDestacado();

        int x = 0, y = 0;
        
        for (int i = 0 ; i < personagens.size() ; i++){
                      
            String nome = personagens.get(i).getNome();
            
            if( i == destaque){
                g.setColor(Color.RED);
            } else {
                g.setColor(Color.BLACK);
            }
            
            g.fillRect(x, y, DIMX_IMGS_COLECCAO, DIMY_IMGS_COLECCAO);
            Image imagem = Imagens.getImagem(nome);
            if (imagem != null){
                g.drawImage( imagem, x + 4, y + 4,DIMX_IMGS_COLECCAO - 9,  DIMY_IMGS_COLECCAO - 9, this );
            }else{
                System.err.println(" imagem == null");
            }
            
            x += DIMX_IMGS_COLECCAO;
        }
       
    }

    int qualFigura(int x, int y)
    {
        int qual;
        
        if ( y < 0 || y > DIMY_IMGS_COLECCAO){
            return -1;
        }
        
        qual = x/DIMX_IMGS_COLECCAO;
        
        if (qual >= 0 
                && qual < modelo.getPersonagens().size() 
                && qual < getWidth()/DIMX_IMGS_COLECCAO){
            return qual;
        }
        return -1;
    }
    
    class DestaqueListener extends MouseAdapter 
    {
        @Override
        public void mousePressed( MouseEvent e){
            
            int x = e.getX();
            int y = e.getY();
            int qual = qualFigura( x, y);
            
            if(qual != -1){
                modelo.setDestaque(qual);
            } 
           
        }
    }
        @Override
    public void update(Observable o, Object arg) {
        repaint();
    }
}
