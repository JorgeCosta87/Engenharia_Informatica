#include <sstream>
using namespace std;


#include "Pessoa.h"
#include "Clube.h"

Clube::Clube(int t) {
    tam = t > 0 ? t : 0;
    if (tam == 0) {
        socios = nullptr;
        return;
    }
    socios = new Pessoa * [tam];
    if (socios == nullptr) {
        tam = 0;
        return;
    }
    for (unsigned int i = 0; i < tam; i++) {
        socios[i] = nullptr;
    }
}

Clube & Clube::operator=(const Clube & ob) {
    if (this == &ob) { // prevencao da auto- atrubuicao
        return *this;
    }
    delete [](this->socios);
    socios = nullptr;
    tam = 0;
    
    
    if(ob.socios == nullptr || ob.tam == 0){
        return * this;   
    }
        socios = new Pessoa * [ob.tam];
        if (socios == nullptr) {
            return *this;
        }
           
       for (unsigned int i = 0; i < ob.tam; i++) {
            socios[i] = ob.socios[i];
       }      
        
    return *this;
}

Clube::Clube(const Clube & ob) {
    // limpar os ponteiros aos quais 
    // o operador atribuicao vai fazer delete
    // completar
    socios = nullptr;
    *this = ob;

    // aplicar o operador atribuicao
    // completar
}

Clube::~Clube() {
    delete [] socios;
}

void Clube::setMembroDoClube(Pessoa * p, int pos) {
    if (pos >= 0 && pos < tam && socios[pos] == NULL) {
        socios[pos] = p; // Notar que o obj. Pessoa e visto pelo Clube
    }
}

string Clube::getAsString()const {
    ostringstream oss;
    oss << "\nTam: " << tam << endl;
    for (unsigned int i = 0; i < tam; i++) {
        if (socios[i] != nullptr) {
            oss << socios[i]->getAsString() << endl; // tem de uusar ->
        }
    }
    return oss.str();
}