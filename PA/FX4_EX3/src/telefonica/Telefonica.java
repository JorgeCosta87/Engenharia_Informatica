/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package telefonica;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 *
 * @author Administrator
 */
public class Telefonica implements Serializable {

    private String nome;
    private Map<Integer, Cartao> cartoes = new HashMap<Integer, Cartao>();

    public Telefonica(String nome) {
        this.nome = nome;
    }

    public int acrescentaCartoes(List<Cartao> conjunto) {
        if (conjunto == null) {
            return 0;
        }
        int n = 0;
        // public V put(K key, V value)
        // Associates the specified value with the specified key in this map.
        //If the map previously contained a mapping for the key, the old value is replaced. 
        for (Cartao cartao : conjunto) {
            Integer numero = cartao.getNumero();
            if (!cartoes.containsKey(numero)) {
                cartoes.put(numero, cartao);
                n++;
            }
        }
        return n;
    }

    public Cartao pesquisa(int numero) {
        return cartoes.get(numero);
    }

    public boolean fazCarregamento(int numero, double quantia) {
        Cartao ob = pesquisa(numero);
        if (ob == null) {
            return false;
        }
        ob.efectuaCarregamento(quantia);
        return true;
    }

    public boolean fazChamada(int origem, int destino, int s) {
        Cartao ob = pesquisa(origem);
        if (ob == null) {
            return false;
        }
        return ob.registaChamada(destino, s);
    }

    public double getSaldo(int numero) {
        Cartao ob = pesquisa(numero);
        if (ob == null) {
            return 0;
        }
        return ob.getSaldo();
    }

    public String facturaDetalhada(int numero) {
        Cartao ob = pesquisa(numero);
        if (ob == null) {
            return "numero nao existente";
        }
        return ob.facturaDetalhada();
    }

    public String toString() {
        return "Operadora de telemoveis ***" + nome + "***\n"
                + "Ordem natural:\n" + cartoes;
    }

    class OrdenaPorNumero implements Comparator<Cartao> {

        public int compare(Cartao o1, Cartao o2) {
            if (o1.getNumero() < o2.getNumero()) {
                return -1;
            } else if (o1.getNumero() > o2.getNumero()) {
                return 1;
            } else {
                return 0;
            }
        }
    }

    public String toStringPorNumero() {
        List<Cartao> listaOrdenada = new ArrayList<Cartao>(cartoes.values()); //Faz a cópia   
//        Collections.sort(listaOrdenada, new OrdenaPorNumero());
        Collections.sort(listaOrdenada, new OrdenaPorNumero());
//        Collections.sort(listaOrdenada);
        return "Operadora de telemoveis ***" + nome + "***\n"
                + "Lista ordenada por numero:\n" + listaOrdenada;
    }

    class OrdenaPorSaldo implements Comparator<Cartao> {

        public int compare(Cartao o1, Cartao o2) {
            if (o1.getSaldo() < o2.getSaldo()) {
                return -1;
            } else if (o1.getSaldo() > o2.getSaldo()) {
                return 1;
            } else {
                return 0;
            }
        }
    }

    public String toStringPorSaldo() {
        List<Cartao> listaOrdenada = new ArrayList<Cartao>(cartoes.values()); //Faz a cópia   
        Collections.sort(listaOrdenada, new OrdenaPorSaldo());
        return "Operadora de telemoveis ***" + nome + "***\n"
                + "Lista ordenada por saldo:\n" + listaOrdenada;
    }

    private void writeObject(ObjectOutputStream out)
            throws IOException {
        out.defaultWriteObject();
        out.writeObject(Cartao.getTipos());
    }

    private void readObject(ObjectInputStream in)
            throws IOException, ClassNotFoundException {
        in.defaultReadObject();
        Cartao.setTipos((List<String>) in.readObject());

    }
}
