/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   Conta.h
 * Author: costa
 *
 * Created on 2 de Novembro de 2016, 23:38
 */
#include <string>

using namespace std;

#ifndef CONTA_H
#define CONTA_H

class Pessoa;

class Conta {
    
    int saldo;
    const Pessoa * const pessoa;
    
    
public:
    Conta()=delete;
    Conta(const Pessoa *p);
    Conta(const Conta& orig);
    
    LEvanta)int valor);
    int getSaldo() const;
    string getTitular() const;
    virtual ~Conta();
private:

};

#endif /* CONTA_H */

