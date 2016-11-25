#ifndef CLUBE_H
#define CLUBE_H

#include <string>
using namespace std;

class Pessoa;

class Clube {
	Pessoa * * socios;
	int tam;
public:
	Clube(int t);
	Clube(const Clube & ob);  // constr por copia
	Clube & operator=(const Clube & ob);  //oper atrib
	~Clube();
	void setMembroDoClube(Pessoa * p, int pos);
	string getAsString()const;
};

#endif

