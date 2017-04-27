
package jogo.modelo.estados;

import jogo.modelo.dados.JogoDados;


/**
 *
 * @author Jose Marinho
 */
public class AguardaInicio extends EstadoAdapter
{
    
    public AguardaInicio(JogoDados jogoDados)
    {
        super(jogoDados);
    }
    
    @Override
    public IEstado iniciar()
    { 
        getJogoDados().iniciar();
        return new AguardaAposta(getJogoDados()); 
    }
}