
package jogo.modelo.dados;

import jogo.modelo.estados.IEstado;


/**
 *
 * @author Jose Marinho
 */
public abstract class Bola 
{
    private JogoDados jogoDados;
            
    public Bola(JogoDados jogoDados)
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
    // consequencia de retirar bola do saco - conforme o tipo de bola
    public abstract IEstado serRetiradaDoSacoAposAposta();

    // uma das opcoes caso tenha sido retirada bola preta
    public abstract void serReveladaDoSacoAposOpcao();
    
    // saiu bola branca do saco, a aposta foi ganha e revelam-se bolas do saco ...
    public abstract void serReveladaDoSacoAposRetiradaBolaBranca();
    
}
