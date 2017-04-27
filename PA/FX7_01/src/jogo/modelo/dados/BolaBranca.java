
package jogo.modelo.dados;

import jogo.modelo.estados.AguardaAposta;
import jogo.modelo.estados.Fim;
import jogo.modelo.estados.IEstado;


/**
 *
 * @author Jose Marinho
 */
public class BolaBranca extends Bola
{
    
    public BolaBranca(JogoDados jogoDados)
    {
        super(jogoDados);
    }
    
    @Override
    public IEstado serRetiradaDoSacoAposAposta()
    {
        getJogoDados().getBolasBrancasPontuacao().add(this); 
        getJogoDados().ganhaAposta();
        if(getJogoDados().isSacoVazio()){
            return new Fim(getJogoDados());    
        }
        
        return new AguardaAposta(getJogoDados());
    }

    @Override
    public void serReveladaDoSacoAposOpcao()
    {
        //According to the rules, the bola is thrown out...
        getJogoDados().getBolasBrancasRemovidas().add(this);
    }
    
    @Override
    public String toString()
    {
        return "Branca";
    }
    public void serReveladaDoSacoAposRetiradaBolaBranca() {
        getJogoDados().getSaco().add(this);
    }
}
