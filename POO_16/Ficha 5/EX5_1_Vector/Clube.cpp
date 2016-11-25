#include <sstream>
using namespace std;


#include "Pessoa.h"
#include "Clube.h"

Clube::Clube(int t) {
    for (unsigned int i = 0; i < t; i++) {
        socios.push_back(NULL);
    }
}

void Clube::setMembroDoClube(Pessoa * p, int pos) {
    if (pos >= 0 && pos < socios.size() && socios[pos] == NULL) {
        socios[pos] = p; // Notar que o obj. Pessoa e visto pelo Clube
    }
}

string Clube::getAsString()const {
    ostringstream oss;
    oss << "\nTam: " << socios.size() << endl;
    for (unsigned int i = 0; i < socios.size(); i++) {
        if (socios[i] != nullptr) {
            oss << socios[i]->getAsString() << endl; // tem de uusar ->
        }
    }
    return oss.str();
}