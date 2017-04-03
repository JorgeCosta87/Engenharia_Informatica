package ficha5ex01a.logica;

public class Elevador {  
    private IEstados estado;

    public Elevador(){
        estado = new RC();
    }

    public IEstados getEstado(){
        return estado;
    }

    public void setEstado(IEstados estado){
        this.estado = estado;
    }
    // funções delegadas na maquina de estados 
    public void up() {
//        this.estado = estado.up();
        setEstado(estado.up());
    }

    public void down() {
//        this.estado = estado.down();
        setEstado(estado.down());
    }
}
