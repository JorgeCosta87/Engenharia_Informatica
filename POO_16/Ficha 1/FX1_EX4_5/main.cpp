/* 
 * File:   main.cpp
 * Author: Costa
 *
 * Created on 28 de Setembro de 2016, 22:30
 */

#include <cstdlib>
#include <iostream>
#include <string>
#include <cstring>

using namespace std;
 
 void imprime(string word){
    cout << word << endl;
}

void imprime(string word, int value){
    cout << word << " - " << value << endl;
}

void imprime(int value, string word){
    cout << value << " - " << word << endl;
}
 

int soma(int n){
    return n;
}
int soma(int n1, int n2){
    return n1 + n2;
}
int soma(int n1, int n2, int n3){
    return n1 + n2 + n3;
}

int main(void)
{
    imprime("fly");
    imprime("Book", 12);
    imprime(33,"Car");

    cout << "\n" << soma(1) << soma(1) << endl;
    cout << soma(2,2) << soma(2,2,2) << endl;
    return 0;
}


