package ficha5ex01a.iu.texto;
import ficha5ex01a.logica.Andar1;
import ficha5ex01a.logica.Andar2;
import ficha5ex01a.logica.Elevador;
import ficha5ex01a.logica.IEstados;
import ficha5ex01a.logica.RC;
import java.util.Scanner;

public class UsaElevador {  
    private Elevador elevador;
    private boolean sair = false;
    
    public UsaElevador(Elevador elevador){
        this.elevador = elevador;
    }
    
    public void askForInputRC() {
        System.out.println("Ground floor");
        while (true) {
            System.out.println("(Q)uit,(U)p?");
            char c = ' ';
            Scanner s = new Scanner(System.in);
            c = s.next().charAt(0);
            if ((c == 'u') || (c == 'U')) {
                elevador.up();
                return;
            }
            if ((c == 'q') || (c == 'Q')) {
                sair = true;
                return;
            }
        }
    }

    public void askForInputAndar1() {

        System.out.println("1st floor");
        while (true) {
            System.out.println("(Q)uit, (U)p or (D)own?");
            char c = ' ';
            Scanner s = new Scanner(System.in);
            c = s.next().charAt(0);

            if ((c == 'u') || (c == 'U')) {
                elevador.up();
                return;
            }
            if ((c == 'd') || (c == 'D')) {
                elevador.down();
                return;
            }
            if ((c == 'q') || (c == 'Q')) {
                sair = true;
                return;
            }
        }
    }

    public void askForInputAndar2() {
        System.out.println("2nd floor");
        while (true) {
            System.out.println("(Q)uit,(D)own?");
            char c = ' ';
            Scanner s = new Scanner(System.in);
            c = s.next().charAt(0);
            if ((c == 'd') || (c == 'D')) {
                elevador.down();
                return;
            }
            if ((c == 'q') || (c == 'Q')) {
                sair = true;
                return;
            }
        }
    }

    
    public void corre() {
        while (!sair) {           
            IEstados estado = elevador.getEstado();           
            if (estado instanceof RC) {
                askForInputRC();
            } else if (estado instanceof Andar1) {
                askForInputAndar1();
            } else if (estado instanceof Andar2) {
                askForInputAndar2();
            }
        }

    }  
}
