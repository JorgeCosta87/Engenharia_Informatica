package hello;


class Aux {
    private int n=0;
    public void aumenta(){
        ++n;
    }
    public int getN()
    {
        return n;
    }

}

public class TwoClass {

    public static void main(String[] args)
    {
        Aux aux = new Aux();

        aux.aumenta();
        aux.aumenta();

        System.out.println("n= " + aux.getN());
    }
}