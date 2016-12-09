#ifndef LOJA_H
#define LOJA_H

#include "Imovel.h"

class Loja :public Imovel {
	
public:
	Loja( float area);
	virtual string getAsString()const;
	//virtual Imovel * duplica()const{ return new Loja(*this);}
};

#endif