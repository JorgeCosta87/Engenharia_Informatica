

#ifndef PEIXE_H
#define	PEIXE_H

#include<string>
using namespace std;

class Aquario;

class Peixe {
    string especie;
    string cor;
    int peso;
    int numSerie;
    
    static int sequencia;
    static const int LIMITE_PESO = 50;
    static const int INICIAL_PESO = 10;
public:
    Peixe(string especie0, string cor0 = "cinzento");
    string getAsString()const;
    int getNumSerie() const;
    
    void alimentar( int quant , Aquario * aquario);    
};

#endif	/* PEIXE_H */

