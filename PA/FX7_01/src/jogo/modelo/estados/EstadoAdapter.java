
package jogo.modelo.estados;

import jogo.modelo.dados.JogoDados;

/**
 *
 *
 * @author Jose Marinho
 */


public class EstadoAdapter implements IEstado
{
    
    private JogoDados jogoDados;
    
    public EstadoAdapter(JogoDados jogoDados)
    {
        this.jogoDados = jogoDados;
    }

    public JogoDados getJogoDados()
    {
        return jogoDados;
    }

    public void setJogoDados(JogoDados jogoDados)
    {
        this.jogoDados = jogoDados;
    }
            
    @Override
    public IEstado iniciar(){ return this; }
    
    @Override
    public IEstado terminar(){ return this; }
    
    @Override
    public IEstado apostar(int nBalls){ return this; }
    
    @Override
    public IEstado removerBolaBrancaDePontuacao(){ return this; }
    
    @Override
    public IEstado retirarDuasBolasDoSaco(){ return this; }
        
}
