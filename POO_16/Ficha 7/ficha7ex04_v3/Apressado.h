#ifndef APRESSADO_H
#define APRESSADO_H

#include "tarifario.h"
// Alinea B


// Apenas e preciso redefinir a funcao calcula pagamentos
// O acesso aos treinos tem que ser feito via funcoes getXXX pois os dados sao
// privados na classe base.

class Apressado : public Tarifario {
	unsigned int calculaPagamento()const;
public:
	Tarifario * duplica()const;
};

#endif