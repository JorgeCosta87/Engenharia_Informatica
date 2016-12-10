#ifndef POLICIAL_H
#define POLICIAL_H

#include "Livro.h"

class Policial: public Livro {
	string detective;
	int nTiros;
public:
	Policial(string t,string a, long i, string d, int nt = 0);

	string getDetective() const;
	int getNTiros()const;
	virtual string getAsString() const;

	virtual Livro * duplica()const;	
};

#endif