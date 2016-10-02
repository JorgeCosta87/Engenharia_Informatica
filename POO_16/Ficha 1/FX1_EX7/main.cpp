/*
        Escreva um programa em C++ que peça palavras ao utilizador. Após cada palavra lida, o programa
    escreve essa palavra ao contrário no ecrã. Se a palavra for um palíndromo (fica igual ao original
    quando escrita ao contrário), o programa escreverá à frente “palíndromo”. Antes de proceder a nova
    leitura de palavra o programa deve apresentar a mensagem “carregue em enter para prosseguir” e
    aguardar que seja premida essa tecla. O programa termina quando é escrita a palavra “fim”.
    Objectivos do exercício
         Treinar o processamento de strings caracter a caracter.
         Treinar métodos de efectuar pausas através de objectos cin.
         Consolidar competências de consulta da ajuda online do IDE.
 
 */

#include <cstdlib>
#include <iostream>
#include <string>
#include <sstream>

using namespace std;
 

string invertePalavra(string s){
    int i = 0, j = s.length() -1;
    while(i <j){
        char aux = s[i];
        s[i] = s[j];
        s[j] = aux;
        i++;
        j--;
    }
    return s;
}


int main(void)
{
    string palavra; 
    
    cout << "Digite uma palavra: " <<endl;
    
    cin >> palavra;
    
        
    string inv = invertePalavra(palavra);
    
    cout << "Palavra " << palavra << endl;
    cout << "Palavra invertida " << inv << endl;
    
    if(palavra == inv){
        cout << "palidromo\n";
    }else{
        cout << "nao palidromo\n";
    }
    
    
    
    return 0;
}





