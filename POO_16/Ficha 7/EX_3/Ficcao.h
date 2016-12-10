#ifndef FICCAO_H
#define FICCAO_H

#include "Livro.h"

class Ficcao: public Livro {
	string planeta;
	int ano;
	bool realista;
public:
	Ficcao(string t, string a, long i, string p, int aano, bool r)
		:Livro( t, a, i), planeta(p), ano(aano), realista(r){}
	string getPlaneta() const{ return planeta;}
	int getAno()const{ return ano; }
	bool getRealista(){ return realista; }
	virtual string getAsString() const;
	virtual Livro * duplica()const;
	
};



#endif