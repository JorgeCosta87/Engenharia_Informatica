/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   Triangulo.cpp
 * Author: costa
 * 
 * Created on 25 de Outubro de 2016, 17:00
 */

#include "Triangulo.h"
#include "Ponto.h"
#include <string>
#include <iostream>
#include <sstream>

using namespace std;

Triangulo::Triangulo(int x1, int y1, int x2, int y2, int x3, int y3):vertices{ Ponto(x1,x2), Ponto(x2,y2), Ponto(x3,y3) }  {
    cout << getAsString();
}

Triangulo::Triangulo(const Triangulo& orig) {
}

Triangulo::~Triangulo() {
}

Ponto Triangulo::getVertice(int number) const{
    
    return vertices[number];
}

void Triangulo::setVertice(int number, int x, int y){
    vertices[number].setX(x);
    vertices[number].setX(y);
}

string Triangulo::getAsString() const{
   	ostringstream oss;
	oss << " Triangulo" << name << " " 
		<< vertices[0].getAsString() << " " 
		<< vertices[1].getAsString() << " " 
		<< vertices[2].getAsString() << endl;
	return oss.str();
}


