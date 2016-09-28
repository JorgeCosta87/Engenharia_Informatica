/*
    Escreva um programa em C++ que peça o nome completo do utilizador e depois imprima os vários
    nomes desse utilizador, cada um numa linha diferente. Se um dos nomes do utilizador for “Silva” o
    programa deve avisar que conhece alguém com esse nome.
    Objectivos do exercício
         Dominar a leitura de linhas completas contendo espaços.
         Treinar o processamento de strings contendo espaços e extrair palavras individuais.
         Experimentar a comparação de objectos string.
 
 */

#include <cstdlib>
#include <iostream>
#include <string>
#include <sstream>

using namespace std;
 


int main(void)
{
    string name, split;
    
    cout << "Digite o seu nome: " <<endl;
    
    getline(cin, name);
    
    istringstream iss(name);
    
    while(iss >> split){
        cout << "Name: " << split << endl; 
        if (split == "Silva") cout << "Match" << endl;
    }
    
    return 0;
}



