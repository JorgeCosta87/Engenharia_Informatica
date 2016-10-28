/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   Aviso.cpp
 * Author: costa
 * 
 * Created on 26 de Outubro de 2016, 22:37
 */
#include <string>
#include <iostream>
#include <sstream>

using namespace std;


#include "Prego.h"
#include "Aviso.h"


Aviso::Aviso(const string & t, const Prego * const p ):texto(t), prego(p) { //os membors constates tem de ser iniciliaziados aqui!
    cout << " Aviso " << texto << endl;
}


Aviso::Aviso(const Aviso& orig) {
}

Aviso::~Aviso() {
    cout <<  " ~Aviso() " << texto << endl
}

int Aviso::getX() const{
    return prego->getX();
}

int Aviso::getX() const{
    return prego->getY();
}

string Aviso::getAsString() const{
    
    ostringstream oss;
    
    oss << "Aviso: " << texto << " " << prego->getAsString();
    return oss.str();
            
       
}