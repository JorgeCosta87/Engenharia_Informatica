
#include<sstream>
using namespace std;

#include "Peixe.h"
#include "Aquario.h"

int Peixe::sequencia = 500;

Peixe::Peixe(string especie0, string cor0):
especie(especie0), cor(cor0), peso(INICIAL_PESO), 
        numSerie(sequencia++)
{}

string Peixe::getAsString()const{
    ostringstream oss;
    oss << "\nPeixe: " << especie << "\ncor: " << cor
         <<"\npeso: " << peso << "\nnum serie: " << numSerie << endl;
    return oss.str();
}
int Peixe::getNumSerie() const {
        return numSerie;
    
}

void Peixe::alimentar( int quant, Aquario * aquario){
    if (quant <= 0){
        return;
    }
    peso += quant;
    if(peso > LIMITE_PESO){
        if(aquario != nullptr){
            aquario->removePeixe(numSerie);
        }
    }
}
