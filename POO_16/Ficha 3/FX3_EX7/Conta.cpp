/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   Conta.cpp
 * Author: costa
 * 
 * Created on 2 de Novembro de 2016, 23:38
 */

#include "Conta.h"
#include "Pessoa.h"

#include <string>

Conta::Conta(string titular) {
    saldo = 0
   pessoa.setNome(titular);
}

Conta::Conta(const Conta& orig) {
}

Conta::~Conta() {
}

