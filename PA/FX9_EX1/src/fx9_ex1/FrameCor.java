import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.*;

public class FrameCor extends JFrame {

    private Container cp;

    private JButton bAzul, bVerde;
    private JPanel painel;
    private JLabel info;

    private int contaAzul, contaVerde;

    public FrameCor() {
        this(200, 300, 300, 200);
    }

    public FrameCor(int x, int y, int largura, int altura) {
        super("Botoes"); // Define o t�tulo da frame
        //setTitle("Botoes");

        contaAzul = 0;
        contaVerde = 0;

        cp = getContentPane(); // Obt�m o contentor desta frame

        criarObjGraf(); // Cria os objectos gr�ficos deste exemplo
        disporVista();  // Faz a montagem visual dos objectos gr�ficos deste exemplo
        registarListeners(); // Liga os objectos gr�ficos aos respectivos listeners

        setLocation(x, y); // Define a localiza��o deste componente (frame)
        setSize(largura, altura); // Define as suas dimens�es
        setVisible(true); // Torna-o vis�vel
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);// Termina a aplica��o quando a frame fechar
        validate();// Disp�e de novo os seus subcomponentes
        //setResizable(false);
    }

    // Cria os objectos gr�ficos deste exemplo
    protected void criarObjGraf() {
        bAzul = new JButton("Azul");
        //Define a cor do texto no bot�o como sendo azul
        bAzul.setForeground(Color.BLUE);
        //Define a cor do fundo como sendo branca
        bAzul.setBackground(Color.WHITE);

        bVerde = new JButton("Verde");
        //Define a cor do texto no como sendo verde
        bVerde.setForeground(Color.GREEN);
        //Define a cor do fundo como sendo branca
        bVerde.setBackground(Color.WHITE);

        painel = new JPanel();
        painel.setBackground(Color.GREEN);

        info = new JLabel("", JLabel.CENTER);
        setTextoInfo();
    }

    // Faz a montagem visual dos objectos gr�ficos deste exemplo
    protected void disporVista() {
        //Defina o layout desta frame como sendo tipo BorderLayout
        cp.setLayout(new BorderLayout());

        //Acresente o painel no centro da frame
        cp.add(painel, BorderLayout.CENTER);
        //Acrescente a etiqueta info no fundo da frame
        cp.add(info, BorderLayout.SOUTH);

        //Acrescente os bot�es azul e verde ao painel
        painel.add(bAzul);
        painel.add(bVerde);
    }

    // Liga os objectos gr�ficos aos respectivos listeners permitindo
    // que interajam com o utilizador
    protected void registarListeners() {
        bAzul.addActionListener(new AzulListener());
        bVerde.addActionListener(new VerdeListener());
    }

    class AzulListener implements ActionListener {
        @Override
        public void actionPerformed(ActionEvent e) {
            //Defina a cor de fundo do painel como azul
            painel.setBackground(Color.BLUE);
            contaAzul++;
            setTextoInfo();
        }
    }

    class VerdeListener implements ActionListener {
        @Override
        public void actionPerformed(ActionEvent e) {
            //Defina a cor de fundo do painel como verde
            painel.setBackground(Color.GREEN);
            contaVerde++;
            setTextoInfo();
        }
    }

    public void setTextoInfo() {
        info.setText("Azul: " + contaAzul + "       Verde: " + contaVerde);
    }

}
