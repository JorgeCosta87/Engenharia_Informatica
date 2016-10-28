/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   Aviso.h
 * Author: costa
 *
 * Created on 26 de Outubro de 2016, 22:37
 */

#ifndef AVISO_H
#define AVISO_H

#include <string>
using namespace std;

class Prego; // para a claasse saber que existe, em vez de fazer includes // inclusão foward

class Aviso {
    
    string texto;
    const Prego * const prego;
    
public:
    Aviso(const string & t, const Prego * const p );
    
    Aviso(const Aviso& orig);
    int getX() const;
    int getY() const;
    string getAsString() const;
    
     ~Aviso();
private:

};

#endif /* AVISO_H */

