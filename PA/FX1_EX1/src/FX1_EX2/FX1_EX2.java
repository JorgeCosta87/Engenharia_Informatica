/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FX1_EX2;

import java.util.Scanner;

/**
 *
 * @author costa
 */
public class FX1_EX2 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {

        if (advinha()) {
            System.out.println("Consegui advinhar! ");
        }

    }

    static boolean advinha() {

        int min = 1;
        int max = 100;
        Scanner sc = new Scanner(System.in);

        while (min <= max) {
            int palpite = (min + max) / 2;
            System.out.println("1 - num = " + palpite + "\n2 - menor\n3 - maior \n");

            while (!sc.hasNextInt()) {
                sc.next();
            }

            int resposta = sc.nextInt();

            if (resposta == 1) {
                return true;
            } else if (resposta == 2) {
                max = palpite - 1;
            } else if (resposta == 3) {
                min = palpite + 1;
            } else {
                System.out.println("opcao errada ");
            }
        }

        return false;

    }

}
