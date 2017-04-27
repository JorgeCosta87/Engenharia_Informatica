
package jogo.modelo.estados;

import jogo.modelo.dados.Bola;
import jogo.modelo.dados.JogoDados;
import jogo.modelo.dados.EmptyException;


/**
 *
 * @author Jose Marinho
 */
public class AguardaOpcao extends EstadoAdapter
{
    
    public AguardaOpcao(JogoDados dataGame)
    {
        super(dataGame);
    }
    
    @Override
    public IEstado removerBolaBrancaDePontuacao()
    {                      
        try {
            getJogoDados().retiraBolaBrancaPontuacao();
        } catch (EmptyException e) {
            return this;
        }
        
         if(getJogoDados().isSacoVazio()){ //Should not happen if this method was appropriately called...
            return new Fim(getJogoDados());    
        }
         
        return new AguardaAposta(getJogoDados()); 
    }
    
    @Override
    public IEstado retirarDuasBolasDoSaco()
    { 
        Bola bola1 = null;
        Bola bola2 = null;
        
        try{
            bola1 = getJogoDados().retiraBolaDoSaco();
            bola2 = getJogoDados().retiraBolaDoSaco();
        }catch(EmptyException e){
            return new Fim(getJogoDados());    
        }
        
        if(bola1 != null){
            // if bola1 instaceof BolaBranca ... else ...
            bola1.serReveladaDoSacoAposOpcao();
        }
        
        if(bola2 != null){
            bola2.serReveladaDoSacoAposOpcao();
        }
        
        if(getJogoDados().isSacoVazio()){
            return new Fim(getJogoDados());    
        }
        
        return new AguardaAposta(getJogoDados()); 
    }
    
}
