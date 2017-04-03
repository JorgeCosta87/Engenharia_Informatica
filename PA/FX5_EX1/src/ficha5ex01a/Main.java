package ficha5ex01a;

import ficha5ex01a.logica.Elevador;
import ficha5ex01a.iu.texto.UsaElevador;

public class Main {
   public static void main(String args[]){
        Elevador e = new Elevador();
        UsaElevador usaE = new UsaElevador(e);
        usaE.corre();
    }     
}
