
#ifndef AQUARIO_H
#define	AQUARIO_H

#include<string>
#include<vector>
using namespace std;

class Peixe;

class Aquario {
    vector<Peixe *> peixes;
public:
    
    Aquario() = default;
    
    // Quando um peixe e posto no aquario, este assume a
    // sua posse e controlo total
    Aquario(const Aquario& orig); // costrutor por copia
    Aquario & operator=(const Aquario& orig); // operador atribuicao
    virtual ~Aquario(); // destrutor
    
    bool addPeixe(Peixe * peixe);
    int pesquisaPeixe( int numSerie)const;
    void alimentar( int quant);
    Peixe * removePeixe( int numSerie);
    
    string getAsString()const;
};

#endif	/* AQUARIO_H */

