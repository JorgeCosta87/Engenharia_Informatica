/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package telefonica;

/**
 *
 * @author Administrator
 */
public class Tagarela extends Cartao {
    private final static double primeiroMinuto = 0.5;
    private final static double outrosMinutos = 0.02;
    
    public Tagarela(int n, double s ) {
        super(n, s);
    }
    public boolean registaChamada(int numero, int s) {
        if ( s <= 0) return false;
        if ( getSaldo() < 0 ) return false;
        double preco = primeiroMinuto;
        if ( s > 60)
            preco += (s-60) * outrosMinutos /60.0;
        setSaldo(getSaldo() - preco);
        chamadas.add( new Chamada(numero, s, preco));
        return true;
    }
    @Override
    public String toString(){
        return " Tagarela: " + super.toString();
    }

    @Override
    public String facturaDetalhada() {
        return " Tagarela: " + super.facturaDetalhada();
    }
    
}
