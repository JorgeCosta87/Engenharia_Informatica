
package desenho;

public class AppDesenho {
   
    public static void main(String[] args) {
        DadosDesenho dadosDesenho = new DadosDesenho();
        ModeloDesenho modelo = new ModeloDesenho(dadosDesenho);
        new FrameDesenho(modelo);
        new FrameSinteseDesenhoTexto(modelo,600, 300, 300, 200);
    }
    
}
