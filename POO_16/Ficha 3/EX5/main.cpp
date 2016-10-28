/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   main.cpp
 * Author: costa
 *
 * Created on 26 de Outubro de 2016, 22:15
 */

#include <cstdlib>

#include "Prego.h"
#include "Aviso.h"

using namespace std;

/*
 * 
 */
int main(int argc, char** argv) {
    
    Prego p(1,2);
    Aviso a("abs", &p);
    Aviso b("zzz", &p);
    
    p.mudaDeSitio(4,5);
    
    
    return 0;
}

