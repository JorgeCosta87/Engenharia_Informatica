package simpsons.modelo;

import java.util.Objects;

public class Personagem 
{
    private String nome;
      
    public Personagem( String nome)
    {
        this.nome = nome;
    }
    
    public String getNome()
    {
        return nome;
    }

    public void setNome(String nome)
    {
        this.nome = nome;
    }
    
    @Override
    public boolean equals(Object o)
    {
        if(o == null)
            return false;
        
        if(!(o instanceof Personagem))
            return false;
        
        return nome.equalsIgnoreCase(((Personagem)o).getNome());
    }

    @Override
    public int hashCode() {
        int hash = 3;
        hash = 29 * hash + Objects.hashCode(this.nome);
        return hash;
    }
    
    @Override
    public String toString()
    {
        return nome;
    }

}
