package ficha3ex07;

public class TemperaturaDiaria {

    private int [] temperaturasHorarias = new int[24];
    private String responsavelMedicoes;
    private String localMedicao;

    TemperaturaDiaria(int[] temps, String resp, String local) {
        responsavelMedicoes = resp;
        localMedicao = local;
        int n = Math.min(temperaturasHorarias.length, temps.length);
        for (int i = 0; i < n; i++) {
            temperaturasHorarias[i] = temps[i];
        }
    }

    public boolean equals(Object o) {
        if (!(o instanceof TemperaturaDiaria)) {
            return false;
        }
        TemperaturaDiaria outro = (TemperaturaDiaria) o;
        return getMaximo() == outro.getMaximo()
                && getMinimo() == outro.getMinimo();
    }
//    public int hashCode() {
//        int s = 0;
//        for (int t : temperaturasHorarias) {
//            s += t;
//        }
//        return s;
//    }
    public int hashCode() {

        return getMaximo() + getMinimo() ;
    }
    int getMaximo() {
        int max = temperaturasHorarias[0];
        for (int t : temperaturasHorarias) {
            if (t > max) {
                t = max;
            }
        }
        return max;
    }

    int getMinimo() {
        int min = temperaturasHorarias[0];
        for (int t : temperaturasHorarias) {
            if (t < min) {
                t = min;
            }
        }
        return min;
    }
}
