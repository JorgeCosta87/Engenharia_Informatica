package desenho;

import java.awt.Color;
import java.awt.Graphics;
import javax.swing.JPanel;
import java.awt.event.*;
import java.util.*;

public class PainelDesenho extends JPanel implements Observer {

    private ModeloDesenho modelo;

    public PainelDesenho(ModeloDesenho modelo) {
        this.modelo = modelo; //Modelo
        this.modelo.addObserver(this); //Regista-se (a Vista) no Modelo para que este possa manda-la actualizar-se

        // Liga os objectos graficos aos respectivos listeners
        this.addMouseListener(new InicioListener());
        this.addMouseMotionListener(new DeslocaListener());
    }

    @Override
    public void update(Observable o, Object arg) {
        repaint();
    }

    //  Liga os objectos graficos aos respectivos listeners permitindo
    //  que interajam com o utilizador
    class InicioListener extends MouseAdapter {

        @Override
        public void mousePressed(MouseEvent e) {
            modelo.defineNovaOval(e.getX(), e.getY());
        }
    }

    class DeslocaListener extends MouseMotionAdapter {

        @Override
        public void mouseDragged(MouseEvent e) {
            modelo.setCantoInfDireito(e.getX(), e.getY());
        }
    }

    @Override
    public void paintComponent(Graphics g) {

        super.paintComponent(g);

        int xi, xf, yi, yf;
        g.setColor(Color.BLACK);
        g.drawRect(0, 0, this.getWidth() - 1, this.getHeight() - 1);

        if (modelo.getXi() < 0) //A figura ainda nao se encontra definida
        {
            return;
        }

        g.setColor(new Color(modelo.getComponenteCor_R(), modelo.getComponenteCor_G(), modelo.getComponenteCor_B()));


        xi = modelo.getXi();
        xf = modelo.getXf();
        yi = modelo.getYi();
        yf = modelo.getYf();

        g.fillOval(Math.min(xi, xf), Math.min(yi, yf), Math.abs(xf - xi), Math.abs(yf - yi));

    }

}
