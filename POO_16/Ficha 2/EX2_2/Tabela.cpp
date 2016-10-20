/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   Tabela.cpp
 * Author: costa
 * 
 * Created on 4 de Outubro de 2016, 22:32
 */

#include "Tabela.h"

#include <iostream>
#include <cstdlib>
#include <string>
#include <sstream>

using namespace std;
 
 
Tabela::Tabela(int num){
    inicializa(num);
}

void Tabela::inicializa(int num){
    n = DIM;
    for (int i = 0 ; i < DIM; i++) a[i] =  num;
}


int Tabela::getA(int indice){
    if(indice < 0 || indice >= n) return 0;
    
    return a[indice];
}


void Tabela::setA(int indice, int valor) {
    if(indice < 0 || indice >= n) return;
    a[indice] = valor;
}

int & Tabela::elementoEm(int indice){
    static int lixo = 0;
    if(indice < 0 || indice >= n) return lixo;
    return a[indice];
    
}

string Tabela::getAsString(){
    ostringstream oss;
   
    oss << "\nListar Estrutura: ";
    for(int i = 0; i < n; i++){
        if(i%5 == 0){
            oss << endl;
        }
        oss <<" a[" << i << "]" << a[i] << "  ";
    }
    oss << endl;
    return oss.str(); // converte para string
}

