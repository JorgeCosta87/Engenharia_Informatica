
package jogo.modelo.estados;

import jogo.modelo.dados.Bola;
import jogo.modelo.dados.JogoDados;
import jogo.modelo.dados.EmptyException;


/**
 *
 * @author Jose Marinho
 */
public class AguardaAposta extends EstadoAdapter
{
    
    public AguardaAposta(JogoDados jogoDados)
    {
        super(jogoDados);
    }
    
    @Override
    public IEstado terminar()
    {
        return new Fim(getJogoDados());
    }
    
    @Override
    public IEstado apostar(int valorApostado)
    {           
        if(!getJogoDados().setValorApostado(valorApostado)){
            return this;
        }

        Bola bolaRetirada;
        try{
            bolaRetirada = getJogoDados().retiraBolaDoSaco();
        }catch(EmptyException e){
            return new Fim(getJogoDados());
        }
        
//        if(bolaRetirada instanceof BolaBranca){
//            ganha aposta etc
//        }else if(bolaRetirada instanceof BolaPreta){
//            perde aposta etc
//        }
                        
        return bolaRetirada.serRetiradaDoSacoAposAposta();
        
    }
}
