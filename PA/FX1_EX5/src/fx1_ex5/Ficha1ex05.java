
package fx1_ex5;

import java.util.Scanner;

public class Ficha1ex05 {

    public static void main(String[] args) {
       Scanner s=new Scanner(System.in);
        Aposta aposta= new Aposta();
        boolean sair = false;
        int nr;
        while (!sair) {
            System.out.println("Escolha uma opção:");
            String [] opcoes = {"1 - Ver Aposta" , "2 - Limpar Aposta",
            "3 - Marcar numero","4 - Sortear chave", "5 - Verificar chave", "6 - Sair"};
            for( int i = 0 ; i < opcoes.length ; i++){
                System.out.println(opcoes[i]);
            }
           
            while(!s.hasNextInt()) s.next();
            int op=s.nextInt();
            
            switch (op) {
                case 1:
                    System.out.println("A sua aposta é:" + aposta);
                    break;
                case 2:
                    aposta.limparChave();
                    break;
                case 3:
                    System.out.println("Indique o numero que pretende marcar: ");
                    nr=s.nextInt();
                    if (!aposta.marcarNumero(nr))
                        System.out.println("Erro a marcar o numero indicado");
                    break;
                case 4:
                    aposta.sortearAposta();
                    break;
                case 5:
                    System.out.println("Indique a chave (6 numeros, um a um):");
                    int [] chave=new int[6];
                    for(int i=0;i<6;i++) {
                        do {
                            System.out.println(""+ (i+1) + "º numero:");
                            while(!s.hasNextInt()) s.next();
                            nr=s.nextInt();
                        } while (nr<1 || nr > 49);
                        chave[i]=nr;
                    }
                    System.out.println("\nAcertou em " + aposta.verificarChave(chave) + " numero(s)");
                    break;
                case 6:
                case 0:
                    sair=true;
                    break;
            }
            
        }
        System.out.println("Obrigado pela sua aposta");
    }
    
}