package fx2_ex1;


import java.util.Scanner;

public class UsaEnfor {

    public static void main(String[] args) {
        Enfor ob = new Enfor();

        boolean continua = true;
        String sim;
        Scanner scanner = new Scanner(System.in);
        while (continua) {
            ob.iniciar();
            System.out.println(ob.getMsg());

            while (ob.getEstado() != Enfor.FIM) {
                System.out.println("Palavra = " + ob.getPalavra());
                System.out.println("Letras usadas: " + ob.getUsadas());
                System.out.println("Aposta > ");
                String aposta = scanner.next();
                ob.adivinhar(aposta);
                System.out.println("Tentativa " + ob.getTentativas());
                System.out.println(ob.getMsg());
            }
            do {
                System.out.println("Continua?(sim/nao) ");
                sim = scanner.next();
                System.out.println("sim = " + sim);
            }while( !sim.equalsIgnoreCase("sim") && !sim.equalsIgnoreCase("nao"));
            continua = sim.equalsIgnoreCase("sim");   
        }
    }
    
}