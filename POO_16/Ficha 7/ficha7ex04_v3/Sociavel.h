#ifndef SOCIAVEL_H
#define SOCIAVEL_H

#include "cliente.h"
// Alinea E

class Sociavel : public Cliente {
public:
	Sociavel(string n,unsigned int b, Tarifario * t);
	virtual void reageEntrada(Ginasio * g) {}
	virtual void reageSaida(Ginasio * g);

	Cliente * duplica()const {
		return new Sociavel(*this);
	}
	virtual string getAsString()const;
};

#endif


