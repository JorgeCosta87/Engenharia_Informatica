#include <string>
#include <sstream>

using namespace std;
#include "Pessoa.h"

Pessoa::Pessoa(const string & s, long b, long n)
: nome(s), bi(b), nif(n) {
}

string Pessoa::getNome()const {
    return nome;
}

void Pessoa::setNome(const string & n) {
    nome = n;
}

long Pessoa::getBi()const {
    return bi;
}

void Pessoa::setBi(long b) {
    bi = b;
}

long Pessoa::getNif()const {
    return nif;
}

void Pessoa::setNif(long t) {
    nif = t;
}

string Pessoa::getAsString()const {
    ostringstream oss;
    oss << "\nNome: " << nome
            << "\nBi: " << bi
            << "\nNif: " << nif << endl;
    return oss.str();
}


