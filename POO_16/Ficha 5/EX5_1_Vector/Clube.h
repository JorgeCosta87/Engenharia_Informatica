#ifndef CLUBE_H
#define CLUBE_H

#include <string>
#include <vector>
using namespace std;

class Pessoa;

class Clube {
    vector<Pessoa *> socios;
public:
    
    //Nesta versao não é preciso construtor por copia, atribuição e destrutor
    //Por nesta classe so usarmos ponteiros, e não ciramos nenuma memoria dinamica, logo não existe necessidade de cópiar nada
	Clube(int t);
	void setMembroDoClube(Pessoa * p, int pos);
	string getAsString()const;
};

#endif

