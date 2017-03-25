/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package telefonica;


/**
 *
 * @author Administrator
 */
public class AppTelefonica {

    public static void main(String args[]) {
        Telefonica m = new Telefonica("Teste");
        UsaTelefonica v = new UsaTelefonica(m);
        v.corre();
    }
}
