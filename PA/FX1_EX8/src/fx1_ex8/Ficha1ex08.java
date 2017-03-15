/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fx1_ex8;

import java.util.Scanner;

/**
 *
 * @author Admin2
 */
public class Ficha1ex08 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
       System.out.println("*** Triangulo de Pascal ***");

        TriangPascal ob = new TriangPascal(1);
        System.out.println(ob);
        Scanner s = new Scanner(System.in);
        while (true) {
            System.out.println("Profundidade (de 2 a 10, 0 para terminar)");
            while(!s.hasNextInt()){
                s.next();
            }
            int prof = s.nextInt();
            if (prof == 0) {
                break;
            }
            if (prof < 0 || prof > 10) {
                System.out.println("Tem que ser um número de 1 a 10");
                continue;
            }
            ob.criaTriang(prof);
            System.out.println(ob);
        }
        System.out.println("Fim");

    }
    
}
