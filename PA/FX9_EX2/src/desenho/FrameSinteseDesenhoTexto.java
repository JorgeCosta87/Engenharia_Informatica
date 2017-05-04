/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package desenho;

import java.awt.Container;
import java.awt.FlowLayout;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Observable;
import java.util.Observer;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;

public class FrameSinteseDesenhoTexto extends JFrame implements Observer
{
    
    private Container cp;
 
    private JLabel infoCanto1, infoCanto2, infoRGB;
    private JTextField changeCantoX, changeCantoY;
    private ModeloDesenho modelo;
    
    public FrameSinteseDesenhoTexto(ModeloDesenho modelo)
    {        
        this(modelo, 300,450, 250, 100);
    }
    
    public FrameSinteseDesenhoTexto(ModeloDesenho modelo, int x, int y, int largura, int altura)
    {
        super("Dados de oval"); 

        //estabele ligação bidirecional
        this.modelo = modelo;
        this.modelo.addObserver(this);

        infoCanto1 = new JLabel();
        infoCanto2 = new JLabel();
        infoRGB = new JLabel();
        changeCantoX = new JTextField(4);
        changeCantoY = new JTextField(4);
        JPanel p1 = new JPanel();
        JLabel l1 = new JLabel("xi: ");
        JPanel p2 = new JPanel();
        JLabel l2 = new JLabel("yi: ");
        
        actualizaInfoOval();
        registaListeners();

        cp = getContentPane(); 
              
        cp.setLayout(new GridLayout(5,1));
        cp.add(infoCanto1);
        
        p1.setLayout(new FlowLayout(FlowLayout.LEFT));
        cp.add(p1);
        p1.add(l1);
        p1.add(changeCantoX);
        p2.setLayout(new FlowLayout(FlowLayout.LEFT));
        cp.add(p2);
        p2.add(l2);
        p2.add(changeCantoY); 
        
        cp.add(infoCanto2);
        cp.add(infoRGB);

        setLocation(x, y); 
        setSize(largura,altura); 
        setResizable(false);
        setVisible(true); 
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        validate();
    }

    @Override
    public void update(Observable o, Object o1) 
    {                
        //repaint();    
        
        actualizaInfoOval();
    }
    
    private void actualizaInfoOval()
    {
        if(modelo.getXi()<0){
            infoCanto1.setText("Canto inicial:  n.d.");
            infoCanto2.setText("Canto final:  n.d.");
            infoRGB.setText("\tCor:  n.d.");            
            return;
        }
        
        infoCanto1.setText("Canto inicial:  (" + modelo.getXi() + " ; " + modelo.getYi() + ")");
        infoCanto2.setText("Canto final:  (" + modelo.getXf() + " ; " + modelo.getYf() + ")");
        infoRGB.setText("\tCor:  R=" + modelo.getComponenteCor_R() + " ; G=" + modelo.getComponenteCor_R() + 
                        " ; B=" + modelo.getComponenteCor_B());
        
        changeCantoX.setText("" + modelo.getXi());
        changeCantoY.setText("" + modelo.getYi());
    }
    
    
    int getN(String text)
    {
        int n = 0;
        
        try{
            n = Integer.parseInt(text);
        } catch (NumberFormatException ex){
            return 0;
        }
        return n;
    }
    
    
    void registaListeners(){
        
        changeCantoX.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String texto = changeCantoX.getText();
                modelo.setXi(getN(texto));
            }
        });
        
        changeCantoY.addActionListener(new ActionListener() {
           @Override
           public void actionPerformed(ActionEvent e) {
               String texto = changeCantoY.getText();
               modelo.setYi(getN(texto));
           }
       });
    }
    
    
    
 }

 