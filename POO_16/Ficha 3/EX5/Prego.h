/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   Prego.h
 * Author: costa
 *
 * Created on 26 de Outubro de 2016, 22:23
 */

#ifndef PREGO_H
#define PREGO_H

class Prego {
    int x,y;
public:
    Prego(int a, int b);
    Prego();
    void mudaDeSitio(int a, int b);
    int getX() const{ return x;}
    int getY() const{return y;}
    Prego(const Prego& orig);
    virtual ~Prego();
private:

};

#endif /* PREGO_H */

