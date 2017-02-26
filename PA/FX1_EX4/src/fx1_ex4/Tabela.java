/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fx1_ex4;

/**
 *
 * @author costa
 */
class Tabela {
    
    private static final int DIM = 20;
    private int [] a = new int[DIM];
    private int duplicados = 0;
    
    public Tabela(){
        preenche();
    }
    
    public void preenche(){
        
        duplicados = 0; 
        for (int i = 0 ; i < a.length ; i++)
        {
            int num;
            int vezes = 0;
            do{
                num = (int) (Math.random() * 101);
                vezes++;
                
            }while(pesquisa(num,i));
            
            if(vezes > 1)
            {
                duplicados++;
            }
            
            a[i] = num;
        }
    }
    
    private boolean pesquisa(int valor, int quantos)
    {
        for(int i = 0 ; i < quantos ; i++)
        {
            if(a[i] == valor)
                return true;
        }
        return false;
    }
    
    
    @Override
    public String toString(){
        
        if(a == null)
        {
            return "\narray vazio";
        }
        String s = "";
        
        for(int i = 0 ; i < a.length ; i++)
        {
            s += " \n a[" + i + "] = " + a[i];
        }
        s+= "\n duplicados " + duplicados + "\n";
        
        return s;
    }
    
}
