package simpsons.vista.gui;

import simpsons.temporizador.Temporizador;
import simpsons.modelo.ModeloColeccaoPersonagens;
import java.awt.BorderLayout;
import java.awt.Container;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Observable;
import java.util.Observer;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;

public class VistaColeccao extends JFrame implements Constantes, Observer 
{
    private ModeloColeccaoPersonagens modelo; // ligacao ao modelo
    
    private Temporizador tempo;  // temporizacao 
    
    private static Font letra = new Font("Verdana", Font.PLAIN, 12);
    private Container cp;
    private PainelCentral centro;
    private JPanel sul;
    private JButton andarBotao;
    private JButton maisDepressaBotao;
    private JButton maisDevagarBotao;

    public VistaColeccao(ModeloColeccaoPersonagens m, int x, int y, int largura, int altura) 
    {
        super("The Simpsons"); // define o titulo da frame

        modelo = m; // estabelece a ligacao ao modelo
        modelo.addObserver(this); // regista a vista como observer do modelo

        tempo = new Temporizador(modelo, new IncDestaqueListener());

        cp = getContentPane(); // obtem o contentor desta frame

        criarObjGraf(); // cria os objectos graficos 
        disporVista();  // faz a montagem visual dos objectos graficos
        registarListeners(); // liga os objectos graficos aos respectivos listeners

        setLocation(x, y);
        setSize(largura, altura);
        setVisible(true);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        validate();
        update(modelo, null);
    }

    public VistaColeccao(ModeloColeccaoPersonagens m) 
    {
        this(m, 100, 100);
    }

    public VistaColeccao(ModeloColeccaoPersonagens m, int x, int y) 
    {
        this(m, x, y, 500, 600);
    }

    protected void criarObjGraf() 
    {
        centro = new PainelCentral(modelo);
        sul = new JPanel();

        andarBotao = new JButton("Andar");
        andarBotao.setFont(letra);

        maisDepressaBotao = new JButton("++");
        maisDepressaBotao.setFont(letra);

        maisDevagarBotao = new JButton("--");
        maisDevagarBotao.setFont(letra);
    }

    protected void disporVista() 
    {
        cp.setLayout(new BorderLayout());
        
        cp.add(centro, BorderLayout.CENTER);

        sul.add(maisDevagarBotao);
        sul.add(andarBotao);
        sul.add(maisDepressaBotao);
        maisDevagarBotao.setEnabled(false);
        maisDepressaBotao.setEnabled(false);

        cp.add(sul, BorderLayout.SOUTH);
    }

    protected void registarListeners() 
    {
        andarBotao.addActionListener(new AndarListener());
        maisDevagarBotao.addActionListener(new MaisDevagarListener());
        maisDepressaBotao.addActionListener(new MaisDepressaListener());
    }

    @Override
    public void update(Observable t, Object o) 
    {  
        if(modelo.isAndar()){
            andarBotao.setText(PARAR);
            maisDevagarBotao.setEnabled(true);
            maisDepressaBotao.setEnabled(true);
        } else {
            andarBotao.setText(ANDAR);
            maisDevagarBotao.setEnabled(false);
            maisDepressaBotao.setEnabled(false);
        }
    }

    class AndarListener implements ActionListener 
    {

        @Override
        public void actionPerformed(ActionEvent e) 
        {
           modelo.setAndarOuParar();
        }
    }

    class IncDestaqueListener implements ActionListener
    {
        @Override
        public void actionPerformed(ActionEvent e) 
        {
            modelo.incIndicePersonagemDestacado();
        }
    }

    class MaisDevagarListener implements ActionListener
    {
        @Override
        public void actionPerformed(ActionEvent e) 
        {
                tempo.maisLento();
        }
    }

    class MaisDepressaListener implements ActionListener 
    {
        @Override
        public void actionPerformed(ActionEvent e) 
        {
                tempo.maisRapido();
        }
    }
    
}
