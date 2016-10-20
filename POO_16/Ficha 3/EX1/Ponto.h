/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   Ponto.h
 * Author: costa
 *
 * Created on 19 de Outubro de 2016, 22:37
 */

#ifndef PONTO_H
#define PONTO_H
#include <string>

using namespace std;

class Ponto {
    int x, y;
public:
    Ponto(int x0, int y0);
    
    
    Ponto(const Ponto& orig);
    virtual ~Ponto();
    
    
    
//    int getX() const;
//    int getY() const;
//    
//    void setX(int x0);
//    void setY(int y0);
    
    string getAsString() const;
    
    
    double calculaDistancia(const Ponto & outro) const;
    void setY(int y);
    int getY() const;
    void setX(int x);
    int getX() const;
    

};

#endif /* PONTO_H */

