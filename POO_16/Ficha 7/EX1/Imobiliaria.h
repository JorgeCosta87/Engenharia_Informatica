#ifndef IMOBILIARIA_H
#define IMOBILIARIA_H

#include<string>
#include<vector>
using namespace std;

class Imovel;
//#include "Imovel.h"

class Imobiliaria {
	string nome;
	vector<Imovel *> imoveis;

	//void swap(Imobiliaria & ob);
	int pesquisa( string codigo) const;
public:
	Imobiliaria(string s):nome(s){};
	//~Imobiliaria();
	//Imobiliaria( const Imobiliaria & ob);
	//Imobiliaria & operator=(const Imobiliaria & ob);

	string getAsString() const;

	void acrescentaImovel(Imovel * imovel);

	string getAsString( string codigo) const;

	bool setPreco(string codigo, float preco);
	float getPreco(string codigo)const;

	bool remove(string codigo);
};
ostream & operator<<(ostream & saida, const Imobiliaria & x);

#endif