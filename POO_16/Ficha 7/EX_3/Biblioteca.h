#ifndef BIBILOTECA_H
#define BIBILOTECA_H

#include <vector>
#include <string>
#include <iostream>

using namespace std;

class Livro;

class Biblioteca {
	string morada;
	vector <Livro *> livros;
public:
	Biblioteca( string m ):morada(m){}
	Biblioteca( const Biblioteca & ob);
	Biblioteca & operator=(const Biblioteca & ob);
        virtual ~Biblioteca();
	bool acrescentarLivro( Livro * livro);
	int pesquisa( long i) const;
	bool remover( long i);
	string getAsString() const;
};

ostream & operator<<(ostream & saida, const Biblioteca & x);


#endif