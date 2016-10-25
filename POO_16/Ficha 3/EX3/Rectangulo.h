#ifndef RECTANGULO_H
#define RECTANGULO_H

#include <string>
using namespace std;

#include "Ponto.h"

class Rectangulo {
	Ponto canto; //composição, visto que a classe Rectagunlo contem um objecto da clase Ponto
	int largura;
	int altura;

public:
	Rectangulo(int x, int y, int larg, int alt);

	~Rectangulo();

	Ponto getCanto()const;
	int getLargura()const;
	int getAltura()const;
	string getAsString()const;
	int calculaArea()const;

	void setCanto( const Ponto & c);
	bool setLargura( int larg);
	bool setAltura( int alt);
};

#endif
