#ifndef AVISO_H
#define AVISO_H

#include <string>
using namespace std;

class Prego;

class Aviso{
	string texto;
	const Prego * const prego;
public:
	Aviso(const string & t, const Prego * const p);
	~Aviso();
	int getX()const;
	int getY()const;
	string getAsString()const;
};

#endif
