package desenho;

public class DadosDesenho {

    private int xi, yi;
    private int xf, yf;
    private int componenteCor_R, componenteCor_G, componenteCor_B;
   
    public DadosDesenho() {
        xi = yi = xf = yf = -1;
    }


    public void defineNovaOval(int x, int y) {
        xi = xf = x;
        yi = yf = y;

        componenteCor_R = (int) (Math.random() * 256);
        componenteCor_G = (int) (Math.random() * 256);
        componenteCor_B = (int) (Math.random() * 256);
    }

    public void setCantoInfDireito(int x, int y) {
        xf = x;
        yf = y;
    }

    public int getXf() {
        return xf;
    }

    public int getXi() {
        return xi;
    }

    public int getYf() {
        return yf;
    }

    public int getYi() {
        return yi;
    }

    public int getComponenteCor_R() {
        return componenteCor_R;
    }

    public int getComponenteCor_G() {
        return componenteCor_G;
    }

    public int getComponenteCor_B() {
        return componenteCor_B;
    }

    public void setXi(int xi) {
        this.xi = xi;
    }

    public void setYi(int yi) {
        this.yi = yi;
    }

    public void setXf(int xf) {
        this.xf = xf;
    }

    public void setYf(int yf) {
        this.yf = yf;
    }
    
    
}
