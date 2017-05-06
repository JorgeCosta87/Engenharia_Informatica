package simpsons.modelo;

import java.util.List;
import java.util.Observable;

public class ModeloColeccaoPersonagens extends Observable 
{
    private DadosColeccaoPersonagens coleccao;
        
    public ModeloColeccaoPersonagens( DadosColeccaoPersonagens c)
    {
        coleccao = c;
    }
    // metodos que consultam
    public List<Personagem> getPersonagens()
    {
        return coleccao.getPersonagens();
    }   

    public int getIndicePersonagemDestacado() 
    {
        return coleccao.getIndicePersonagemDestacado();
    }
    
    public Personagem getPersonagemDestacado()
    {
        return coleccao.getPersonagemDestacado();
    }   
    
     public boolean isAndar() {
        return coleccao.isAndar();
    }
     
// metodos que alteram
    public void setAndarOuParar() {
        coleccao.setAndarOuParar();
        
        setChanged();
        notifyObservers();
    }
    public void setPersonagens(List<Personagem> personagens)
    {
        coleccao.setPersonagens(personagens);
        
        setChanged();
        notifyObservers();
    }

    public void setDestaque(int indiceDestaque) 
    {
        coleccao.setIndicePersonagemDestacado(indiceDestaque);
        
        setChanged();
        notifyObservers();
    }
    
    public void  incIndicePersonagemDestacado()
    {
       coleccao.incIndicePersonagemDestacado();
       setChanged();
       notifyObservers();
   }
    
}
