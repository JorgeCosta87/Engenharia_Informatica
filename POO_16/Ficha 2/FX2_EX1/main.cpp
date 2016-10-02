/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   main.cpp
 * Author: Costa
 *
 * Created on 28 de Setembro de 2016, 1:22
 */

#include <cstdlib>
#include <iostream>
#include <string>
#include <cstring>

using namespace std;
 
 const int DIM = 20;
 
 struct Tabela{
     int a[DIM];
     int n;
 };
 
 
void inicializa(Tabela & x, int num);
void listar(Tabela x);
int getA(Tabela x, int indice);
void setA(Tabela &x, int indice, int valor);
int & elementoEm(Tabela &x, int indice);

int main(void)
{
    Tabela tab;
    
    inicializa(tab, 4);
    
    listar(tab);
    
    setA(tab, 0, 999);
    listar(tab);
    
    cout << "\nn.a[0] : " <<getA(tab, 0) << endl;
    
    cout << elementoEm(tab,100) << endl;
    elementoEm(tab,100) = 15;
    
    cout << elementoEm(tab, 100) <<endl;
    
    
    return 0;
}

void inicializa(Tabela & x, int num){
    x.n = DIM;
    for (int i = 0 ; i < DIM; i++) x.a[i] =  num;
}

void listar(Tabela x){
    cout << "\nListar Estrutura: ";
    for(int i = 0; i < x.n; i++)
        cout <<"\n x.a[" << i << "]" << x.a[i];
    cout << endl;
}

int getA(Tabela x, int indice){
    if(indice < 0 || indice >= x.n) return 0;
    
    return x.a[indice];
}


void setA(Tabela &x, int indice, int valor) {
    if(indice < 0 || indice >= x.n) return;
    x.a[indice] = valor;
}

int & elementoEm(Tabela & x, int indice){
    static int lixo = 0;
    if(indice < 0 || indice >= x.n) return lixo;
    return x.a[indice];
    
}
