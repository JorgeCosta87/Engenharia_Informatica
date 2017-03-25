/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package telefonica;

import java.io.Serializable;

/**
 *
 * @author Administrator
 */
public class Chamada implements Serializable{
    private int destinatario;
    private int duracao;
    private double custo;
    
    public Chamada( int dest, int dur, double c ){
        destinatario = dest;
        duracao = dur;
        custo = c;
    }
 
    public int getDestinatario() {
        return destinatario;
    }

    public int getDuracao() {
        return duracao;
    }
    public String toString(){
        return " dest: " + destinatario + " duracao: " + duracao 
        		+ " custo: " + custo;
    }
}
