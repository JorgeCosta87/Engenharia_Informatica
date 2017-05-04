package desenho;

import java.util.Observable;

public class ModeloDesenho extends Observable{
    private DadosDesenho dadosDesenho;

    public ModeloDesenho(DadosDesenho dadosDesenho) {
        this.dadosDesenho = dadosDesenho;
    }
    
    // metodos que consultam

    public int getXf() {
        return dadosDesenho.getXf();
    }

    public int getXi() {
        return dadosDesenho.getXi();
    }

    public int getYf() {
        return dadosDesenho.getYf();
    }

    public int getYi() {
        return dadosDesenho.getYi();
    }
    public int getComponenteCor_R() {
        return dadosDesenho.getComponenteCor_R();
    }

    public int getComponenteCor_G() {
        return dadosDesenho.getComponenteCor_G();
    }

    public int getComponenteCor_B() {
        return dadosDesenho.getComponenteCor_B();
    }
    
    public void  setXi(int xi) {
        dadosDesenho.setXi(xi);
        
        setChanged();
        notifyObservers();
    }
    
    public void  setYi(int yi) {
        dadosDesenho.setXi(yi);
        
        setChanged();
        notifyObservers();
    }
    
    // metodos que actualizam o modelo
     public void defineNovaOval(int x, int y) {
        dadosDesenho.defineNovaOval(x, y);
        
        // o modelo foi actualizado
        // as vistas vao actualizar-se executando os respectivos metodos update()
        setChanged();
        notifyObservers();
    }

    public void setCantoInfDireito(int x, int y) {
        dadosDesenho.setCantoInfDireito(x, y);
        
        // o modelo foi actualizado
        // as vistas vao actualizar-se executando os respectivos metodos update()
        setChanged();
        notifyObservers();
    }

}
