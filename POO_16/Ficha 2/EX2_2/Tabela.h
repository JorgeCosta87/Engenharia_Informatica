/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   Tabela.h
 * Author: costa
 *
 * Created on 4 de Outubro de 2016, 22:32
 */

#ifndef TABELA_H
#define TABELA_H

#include <string>

using namespace std;

class Tabela{
     static const int DIM = 20;
     int a[DIM];
     int n;
     
 public:
    Tabela(int num = 0);
    void inicializa(int num);
    void listar();
    int getA(int indice); 
    void setA(int indice, int valor);
    int & elementoEm(int indice);
    string getAsString();
     
 };

#endif /* TABELA_H */

