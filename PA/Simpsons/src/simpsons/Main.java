package simpsons;

import simpsons.modelo.DadosColeccaoPersonagens;
import simpsons.modelo.ModeloColeccaoPersonagens;
import simpsons.vista.gui.VistaColeccao;

public class Main {

    public static void main(String[] args) {
        ModeloColeccaoPersonagens ob = new ModeloColeccaoPersonagens(new DadosColeccaoPersonagens());
        new VistaColeccao(ob);
    }

}
