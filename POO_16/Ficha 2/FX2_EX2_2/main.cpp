/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   main.cpp
 * Author: costa
 *
 * Created on 4 de Outubro de 2016, 22:32
 */
/* 
 * File:   main.cpp
 * Author: Costa
 *
 * Created on 28 de Setembro de 2016, 1:22
 */

#include <cstdlib>
#include <iostream>
#include "Tabela.h"

using namespace std;
 
int main(void)
{
    Tabela tab;
    
    tab.inicializa(4);
    
    tab.listar();
    
    tab.setA(0, 999);
    tab.listar();
    
    cout << "\nn.a[0] : " <<tab.getA( 0) << endl;
    
    cout << tab.elementoEm(100) << endl;
    tab.elementoEm(100) = 15;
    
    cout << tab.elementoEm(100) <<endl;
    
    
    return 0;
}
