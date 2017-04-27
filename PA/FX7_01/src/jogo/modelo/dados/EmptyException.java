
package jogo.modelo.dados;

/**
 *
 * @author Jose Marinho
 */
public class EmptyException extends Exception
{
    String location;
    
    public EmptyException(String location)
    {
        this.location = location;
    }
    
    @Override
    public String toString()
    {
        return "Empty exception (no balls available in " + location +")";
    }
}
