
package ficha3ex07;

public class ficha3ex07 {

    public static void main(String[] args) {
        Temperaturas temperaturas = new Temperaturas();
         
         int [] t1 = { 1, 2, 3, 4, 5, 6, 7}; // min 1 max 7
         int [] t2 = { 1, 5, 2, 4, 2, 2, 7}; // min 1 max 7
         int [] t3 = { 1, 4, 2, 5, 2, 3, 7}; // min 1 max 7
         System.out.println("1");
         temperaturas.acrescenta(new TemperaturaDiaria(t1, "Aaa", "Coimbra") );
         System.out.println("2");
         temperaturas.acrescenta(new TemperaturaDiaria(t2, "Bbb", "Lisboa") );
         System.out.println("3");
         temperaturas.acrescenta(new TemperaturaDiaria(t3, "Ccc", "Porto") );

    }
}
