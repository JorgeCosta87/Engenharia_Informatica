/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   Triangulo.h
 * Author: costa
 *
 * Created on 25 de Outubro de 2016, 17:00
 */

#ifndef TRIANGULO_H
#define TRIANGULO_H

#include "Ponto.h"

class Triangulo {
    
    string name;
    Ponto vertices[3];
    
    
public:
    Triangulo(int x1, int y1, int x2, int y2, int x3, int y3);
    
    Triangulo(const Triangulo& orig);
    virtual ~Triangulo();
    
    
    Ponto getVertice(int number) const;
    void setVertice(int number, int x, int y);
    string getAsString() const;

};

#endif /* TRIANGULO_H */

