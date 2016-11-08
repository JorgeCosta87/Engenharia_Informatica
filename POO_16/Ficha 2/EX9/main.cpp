/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   main.cpp
 * Author: costa
 *
 * Created on 12 de Outubro de 2016, 23:33
 */

#include <cstdlib>
#include <iostream>
#include <sstream>
#include "TeleVector.h"

using namespace std;


int escolheOpcao(string opcoes [], int n) ;
TeleVector lerDadosTelevisao();
int lerInt(string msg);
/*
 * 
 */
int main(int argc, char** argv) {
    
   string opcoes[] = {"Sair",
        "Ler dados de uma televisao",
        "Listar dados de uma televisao",
        "ligar", // 3
        "desligar",
        "aumentar volume",
        "diminuir volume", // 6
        "mudar de canal"};


    string canais[] = {"um", "dois"};

    TeleVector tv(canais, 2);  //ok

    cout << "\nTV " << tv.getAsString() << endl;

    int opcao = 0;
    do {
        opcao = escolheOpcao(opcoes, sizeof (opcoes) / sizeof (string));
        switch (opcao) {
            case 0: cout << "\nSair\n";
                break;
            case 1: tv = lerDadosTelevisao();
                break;
            case 2: cout << "\n== Dados da televisao ==\n" << tv.getAsString();
                break;
            case 3: tv.ligar();
                break;
            case 4: tv.desligar();
                break;
            case 5: tv.aumentaVolume();
                break;
            case 6: tv.diminuiVolume();
                break;
            case 7:
            {
                int canal = lerInt("\nMuda de canal para: ");
                tv.mudaDeCanal(canal);
            }
                break;
            default:break;

        }

    } while (opcao != 0);
    //////////////////////////////////////////////////

}
// semelhantes   template 

int lerInt(string msg) {
    int valor;
    bool leu = false;
    do {
        cout << msg;
        string s;
        cin >> s;
        istringstream iss(s);
        if (iss >> valor) // se correu bem a leitura
            leu = true;
    } while (!leu);
    return valor;
}

long lerLong(string msg) {
    long valor;
    bool leu = false;
    do {
        cout << msg;
        string s;
        cin >> s;
        istringstream iss(s);
        if (iss >> valor) // se correu bem a leitura
            leu = true;
    } while (!leu);
    return valor;
}

TeleVector lerDadosTelevisao() {

    string *p = NULL; // assim ou com uma array de strings de tamanho DIM ?

    int n;

    do {
        n = lerInt("\nQuantos canais ? ");
    }while( n <= 0);
    
    p = new string[n];
    for (int i = 0; i < n; i++) {
        cout << "\ncanal " << (i + 1) << " : ";
        cin >> p[i];
    }
    TeleVector tv(p, n); //ok


    delete [] p;
    return tv;

}

int escolheOpcao(string opcoes [], int n) {
    for (int i = 0; i < n; i++)
        cout << endl << i << " - " << opcoes[i];

    int opcao = -1;
    do {
        opcao = lerInt("\n\nopcao > ");
    } while (opcao < 0 || opcao >= n);
    return opcao;
}
