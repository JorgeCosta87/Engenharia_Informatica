/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package telefonica;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Administrator
 */
public abstract class Cartao implements Comparable<Cartao>,  Serializable{

    protected List<Chamada> chamadas = new ArrayList<Chamada>();
    private int numero;
    private double saldo;

    static private List<String> tipos = new ArrayList<String>();

    static{
        tipos.add("PoucoTempo");
        tipos.add("Tagarela");
    }

    static public List<String> getTipos(){
        return tipos;
    }

    static public void setTipos(List<String> t){
        tipos = t;
    }

    static public void addTipo(String tipo){
        tipos.add(tipo);
    }
    
    public Cartao(int n, double s) {
        numero = n;
        saldo = s;
    }

    public int compareTo(Cartao o) {
        return numero - o.getNumero();
    }

    public void setSaldo(double saldo) {
        this.saldo = saldo;
    }

    public int getNumero() {
        return numero;
    }

    public double getSaldo() {
        return saldo;
    }
   
    public abstract boolean registaChamada(int numero, int s);

    public void efectuaCarregamento(double quantia) {
        if( quantia > 0 )
            saldo += quantia;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (obj instanceof Cartao) {
            return false;
        }
        final Cartao other = (Cartao) obj;
        if (this.numero != other.numero) {
            return false;
        }
        return true;
    }

    @Override
    public int hashCode() {
        int hash = 3;
        hash = 19 * hash + this.numero;
        return hash;
    }

    @Override
    public String toString() {
        return " numero: " + numero + " saldo: " + saldo + "\n";
    }

    public String facturaDetalhada() {
        return " numero: " + numero + " saldo: " + saldo +
                "\n chamadas:\n" + chamadas + "\n";
    }
}
