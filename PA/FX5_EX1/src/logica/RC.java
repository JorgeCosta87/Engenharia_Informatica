package ficha5ex01a.logica;

public class RC implements IEstados{
    
    @Override
    public IEstados up(){		
        return new Andar1();
    }

    @Override
    public IEstados down(){
        return this;
    }
}
