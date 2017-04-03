package ficha5ex01a.logica;

public class Andar1 implements IEstados{

    @Override
    public IEstados up(){ 
        return new Andar2();
    }

    @Override
    public IEstados down(){
        return new RC();
    }
}
