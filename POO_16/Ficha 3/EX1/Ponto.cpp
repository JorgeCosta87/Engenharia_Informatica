/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   Ponto.cpp
 * Author: costa
 * 
 * Created on 19 de Outubro de 2016, 22:37
 */

#include "Ponto.h"
#include <iostream>
#include <sstream>
#include <cmath>

Ponto::Ponto(int x0, int y0):x(x0) {
    x  = x0;
}

Ponto::Ponto(const Ponto& orig) {
}

Ponto::~Ponto() {
    cout << "\n~Ponto()  " << endl;  
}



string Ponto::getAsString()const{
	ostringstream oss;
	oss<< " ( " << x << " , " << y << " ) ";
	return oss.str();
}

double Ponto::calculaDistancia(const Ponto & outro) const {
    // x, y coordenadas do ponto que invoca (apontado por this)
    //outro.x, outro.y coordenadas do ponto recebido como parametro)
    
    double d2 = (x - outro.x) * (x - outro.x) + (y - outro.y) * (y - outro.y);
    return sqrt(d2);
}

void Ponto::setY(int y) {
    this->y = y;
}

int Ponto::getY() const {
    return y;
}

void Ponto::setX(int x) {
    this->x = x;
}

int Ponto::getX() const {
    return x;
}

