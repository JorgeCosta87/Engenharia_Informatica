
package jogo.modelo.estados;

/**
 *
 * @author Jose Marinho
 */
public interface IEstado 
{    
    IEstado iniciar();
    IEstado terminar();
    IEstado apostar(int nBolas);
    
    // opcoes como resultado de ter saido bola preta do saco
    IEstado removerBolaBrancaDePontuacao();
    IEstado retirarDuasBolasDoSaco();
    
}
