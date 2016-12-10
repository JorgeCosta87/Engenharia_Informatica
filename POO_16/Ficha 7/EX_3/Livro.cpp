
#include <sstream>

using namespace std;
#include "Livro.h"

Livro::Livro(string t, string a, long i) :
titulo(t), autor(a), isbn(i) {
}

void Livro::setTitulo(string s) {
    titulo = s;
}

void Livro::setAutor(string a) {
    autor = a;
}

void Livro::setIsbn(long i) {
    isbn = i;
}

string Livro::getTitulo() const {
    return titulo;
}

string Livro::getAutor() const {
    return autor;
}

long Livro::getIsbn() const {
    return isbn;
}

string Livro::getAsString() const {
    ostringstream oss;
    oss << "\nTitulo :  " << titulo << endl
            << "Autor :  " << autor << endl
            << "ISBN:  " << isbn << endl;
    return oss.str();
}

bool operator==(const Livro & ob1, const Livro & ob2) {
    return ob1.getIsbn() == ob2.getIsbn();
}

ostream & operator<<(ostream & saida, const Livro & x) {
    saida << x.getAsString();
    return saida;
}

Livro * Livro::duplica()const {
    Livro * p = new Livro(*this);
    return p;
    //return new Livro( *this);
}