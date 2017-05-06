package simpsons.temporizador;

import simpsons.vista.gui.Constantes;
import java.awt.event.ActionListener;
import java.util.Observable;
import java.util.Observer;
import javax.swing.Timer;
import simpsons.modelo.ModeloColeccaoPersonagens;

public class Temporizador extends Timer implements Constantes, Observer 
{
    private ModeloColeccaoPersonagens modelo; // ligacao ao modelo
    public Temporizador(ModeloColeccaoPersonagens m, ActionListener al) 
    {
        super(VALOR_TEMPORIZADOR_INICIAL, al);
        setCoalesce(true);
        
        modelo = m; // estabelece a ligacao ao modelo
        modelo.addObserver(this); // regista a vista como observer do modelo

    }

    // reinicia o timer
    public void continuarTimer() 
    {
        if (!isRunning())
        {
            start();
        }
    }

    // Para o timer
    public void pararTimer()
    {
        if (isRunning())
        {
            stop();
        }
    }

    public void maisRapido()
    {
        int novoValor = getDelay() - UNIDADE_AJUSTE_TEMPORIZADOR;
        
        setDelay(novoValor<UNIDADE_AJUSTE_TEMPORIZADOR ? UNIDADE_AJUSTE_TEMPORIZADOR:novoValor);
    }

    public void maisLento() 
    {
        int novoValor = getDelay() + UNIDADE_AJUSTE_TEMPORIZADOR;
        
        setDelay(novoValor>VALOR_TEMPORIZADOR_MAX ? VALOR_TEMPORIZADOR_MAX:novoValor);
    }
    
     @Override
    public void update(Observable t, Object o) 
    {
        if(modelo.isAndar()){
            continuarTimer();
        }else {
            pararTimer();
        }
    }
}
