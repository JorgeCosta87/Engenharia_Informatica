
#include <iostream>
#include <sstream>

using namespace std;
#include "Policial.h"

Policial::Policial(string t, string a, long i, string d, int nt)
: Livro(t, a, i), detective(d), nTiros(nt) {
}

string Policial::getDetective() const {
    return detective;
}

int Policial::getNTiros()const {
    return nTiros;
}

string Policial::getAsString() const {
    ostringstream oss;
    oss << endl << Livro::getAsString()
            << "Detective: " << detective << endl;
    if (nTiros > 10)
        oss << "Nao aconselhado a criancas\n";
    else
        oss << "n. de tiros: " << nTiros << endl;
    return oss.str();
}

Livro * Policial::duplica()const {
    return new Policial(*this);
}