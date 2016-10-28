/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   Prego.cpp
 * Author: costa
 * 
 * Created on 26 de Outubro de 2016, 22:23
 */

#include "Prego.h"

#include <iostream>
using namespace std;


Prego::Prego(int a, int b){
        x = a; y = b;
        cout << "construindo prego em " << x << "," << y << "\n";
    }
Prego::Prego(){
        cout << "Destruindo prego em " << x << "," << y << "\n";
    }


void Prego::mudaDeSitio(int a, int b){
        x = a; y ;
    }

Prego::Prego(const Prego& orig) {}

