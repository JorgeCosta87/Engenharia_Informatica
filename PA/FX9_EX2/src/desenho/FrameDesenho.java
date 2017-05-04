
package desenho;

import javax.swing.*;
import java.awt.*;

public class FrameDesenho extends JFrame {
    
    private Container cp; // Referencia para o contentor desta frame
 
    private PainelDesenho painelDesenho;
    private ModeloDesenho modelo;
    
    public FrameDesenho(ModeloDesenho modelo)
    {
        this( modelo, 200,300, 300, 200);
    }
    
    public FrameDesenho( ModeloDesenho modelo, int x, int y, int largura, int altura)
    {

        super("Desenho de oval"); // Define o titulo da frame

        // Cria o modelo deste exemplo
        this.modelo = modelo;

        // Cria o objecto grafico/componente unico deste exemplo
        painelDesenho = new PainelDesenho(modelo);

        cp = getContentPane(); // Obtem o contentor desta frame
        
        // Faz a montagem visual do objecto grafico deste exemplo
        cp.setLayout(new BorderLayout());
        cp.add(painelDesenho, BorderLayout.CENTER);

      /*  cp.setLayout(new GridLayout(2,2));
        cp.add(new PainelDesenho(new DadosDesenho()));
        cp.add(new PainelDesenho(new DadosDesenho()));
        cp.add(new PainelDesenho(new DadosDesenho()));
        cp.add(new PainelDesenho(new DadosDesenho()));*/

        setLocation(x, y); // Define a localizacao deste componente (frame)
        setSize(largura,altura); // Define as suas dimens�es
        setVisible(true); // Torna-o visivel
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);//Termina a aplicacao quando a frame fechar
        validate();// Dispoe de novo os seus subcomponentes
    }
    
 }
