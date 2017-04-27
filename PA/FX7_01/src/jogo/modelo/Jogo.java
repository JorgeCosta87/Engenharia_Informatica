package jogo.modelo;

import jogo.modelo.dados.JogoDados;
import jogo.modelo.estados.AguardaInicio;
import jogo.modelo.estados.IEstado;


/**
 *
 * @author Jose Marinho
 */
public class Jogo 
{
    private JogoDados jogoDados;
    private IEstado estado;
    
    public Jogo()
    {
        jogoDados = new JogoDados();
        estado = new AguardaInicio(jogoDados);
    }

    public JogoDados getJogoDados() {
        return jogoDados;
    }
    
    public IEstado getEstado() {
        return estado;
    }

    public void setEstado(IEstado estado) {
        this.estado = estado;
    }    
    
    //--- Metodos de consulta de informacao ---
    

    public int getPontuacao()
    {
        return jogoDados.getPontuacao();
    }

    
    @Override
    public String toString()
    {
          return jogoDados.toString();
    }
    
    //--- Metodos delegados no estado corrente ---
    
    public void iniciar()
    {
        setEstado(getEstado().iniciar());
    }
    
    public void terminar()
    {
        setEstado(getEstado().terminar());
    }
    
    public void apostar(int valorApostado)
    {
        setEstado(getEstado().apostar(valorApostado));
    }
    
    public void removerBolaBrancaDePontuacao()
    {
        setEstado(getEstado().removerBolaBrancaDePontuacao());
    }
    
    public void retirarDuasBolasDoSaco()
    {
        setEstado(getEstado().retirarDuasBolasDoSaco());
    }
    
}
