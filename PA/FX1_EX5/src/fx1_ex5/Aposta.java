
package fx1_ex5;

import java.util.Arrays;


public class Aposta {
    private static final int DIM = 6;
    private static final int MIN = 1;
    private static final int MAX = 49;
    private int[] aposta = new int[DIM];
    

    public Aposta() {
        for (int i = 0; i < aposta.length; i++) {
            aposta[i] = 0;
        }
    }
    public int[] getAposta() {
        return aposta;
    }
    boolean verificarExistencia(int nr) {
        for (int i = 0; i < aposta.length; i++) {
            if (nr == aposta[i]) {
                return true;
            }
        }
        return false;
    }
    public boolean marcarNumero(int nr) {
        if (verificarExistencia(nr)) {
            return false;
        }
        if (nr < MIN || nr > MAX) {
            return false;
        }
        for (int index = 0; index < aposta.length; index++) {
            if (aposta[index] == 0) {
                aposta[index] = nr;
                return true;
            }
        }
        return false;
    }
    public void sortearAposta() {
        int index = 0;
        while (index < aposta.length) {

            int nr = (int) (Math.random() * MAX) + MIN;
            if (verificarExistencia(nr)) {
                continue;
            }
            aposta[index] = nr;
            index++;
        }
    }
    public void limparChave() {
        for (int i = 0; i < aposta.length; i++) {
            aposta[i] = 0;
        }
    }
    @Override
    public String toString() {
//        ordenaChave();
        String s = "";
        for (int i = 0; i < aposta.length; i++) {
            s += "," + aposta[i];
        }
        return s;
    }
    public int verificarChave(int[] chaveGanhadora) {
        int nrAcertos = 0;
        for (int i = 0; i < chaveGanhadora.length; i++) {
            if (verificarExistencia(chaveGanhadora[i])) {
                nrAcertos++;
            }
        }
        return nrAcertos;
    }
    public void ordenaChave(){
        Arrays.sort(aposta);
    }
}
