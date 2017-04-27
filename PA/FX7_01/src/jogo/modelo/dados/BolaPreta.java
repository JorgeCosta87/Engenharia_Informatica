
package jogo.modelo.dados;

import jogo.modelo.estados.AguardaOpcao;
import jogo.modelo.estados.Fim;
import jogo.modelo.estados.IEstado;


/**
 *
 * @author Jose Marinho
 */
public class BolaPreta extends Bola
{
    
    public BolaPreta(JogoDados jogoDados)
    {
        super(jogoDados);
    }
    
    @Override
    public IEstado serRetiradaDoSacoAposAposta()
    {        
        getJogoDados().getBolasPretasRemovidas().add(this);

        getJogoDados().perdeAposta();
                        
        if(getJogoDados().isSacoVazio()){
            return new Fim(getJogoDados());    //Should not be necessary...
        }
        
        return new AguardaOpcao(getJogoDados());
    }

    @Override
    public void serReveladaDoSacoAposOpcao()
    {
        //According to the rules, the bola returns to the bag...
        getJogoDados().getSaco().add(this);
    }
    
    @Override
    public String toString()
    {
        return "Preta";
    }

    @Override
    public void serReveladaDoSacoAposRetiradaBolaBranca() {
        getJogoDados().getBolasPretasRemovidas().add(this);
    }
    
}
