#ifndef APARTAMENTO_H
#define APARTAMENTO_H

#include "Imovel.h"

class Apartamento :	public Imovel {
	int andar;
	int nAssoalhadas;
public:
	Apartamento(float area, int a, int n);
	virtual string getAsString()const;
	//virtual Imovel * duplica()const{ return new Apartamento(*this);}
};
#endif