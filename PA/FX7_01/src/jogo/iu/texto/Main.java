package jogo.iu.texto;

import jogo.modelo.Jogo;

/**
 *
 * @author Jose Marinho
 */
public class Main {
    public static void main(String[] args) {		
        IUTexto ui = new IUTexto(new Jogo());
        ui.corre();
    }
}
