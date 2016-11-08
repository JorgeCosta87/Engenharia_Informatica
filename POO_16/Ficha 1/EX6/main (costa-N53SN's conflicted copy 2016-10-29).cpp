/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   main.cpp
 * Author: Costa
 *
 * Created on 28 de Setembro de 2016, 0:58
 */

#include <cstdlib>
#include <iostream>
#include <string>
#include <cstring>

using namespace std;
 
 
/*int soma(int n = 0){
    return n;
}
int soma(int n1, int n2){
    return n1 + n2;
}*/

//Utilizar um valor por defeito
int soma(int n1 = 0, int n2 = 0, int n3 = 0){
    return n1 + n2 + n3;
}

void troca(int& n1, int& n2)
{
    int tmp;
    tmp = n1;
    n1 = n2;
    n2 = tmp;
}

int main(void)
{
    int a = 5, b = 10;
    
    troca(a,b);
    cout << "\na = " << a << "\nb = " << b << endl;
    return 0;
}
