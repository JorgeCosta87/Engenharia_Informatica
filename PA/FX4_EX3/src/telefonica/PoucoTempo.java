/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package telefonica;

/**
 *
 * @author Administrator
 */
public class PoucoTempo extends Cartao {

    private final static double custoMinuto = 0.2;
//    private final static double custoMinuto;

//    static{
//        custoMinuto = 2.8;
//    }

    public PoucoTempo(int n, double s) {
        super(n, s);
//        custoMinuto = c;
    }

    public boolean registaChamada(int numero, int s) {
        if ( s <= 0) return false;
        if (getSaldo() < 0) {
            return false;
        }
        double preco = s * custoMinuto / 60.0;
        setSaldo(getSaldo() - preco);
        chamadas.add(new Chamada(numero, s, preco));
        return true;
    }

    @Override
    public String toString() {
        return " PoucoTempo: " + super.toString();
    }

    @Override
    public String facturaDetalhada() {
        return " PoucoTempo: " + super.facturaDetalhada();
    }
    
}
