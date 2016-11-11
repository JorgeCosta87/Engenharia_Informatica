#ifndef FRACCAO_H
#define FRACCAO_H

#include <iostream>
#include <string>

using namespace std;

class Fraccao{
	int num;	// numerador
	int denom;	// denominador
public:
	Fraccao( int n = 0, int d = 1);
	// funcoes get
	int getNum()const{ return num; }
	int getDenom()const{ return denom; }

	// funcoes set
	void setNum( int n ){ num = n; }
	void setDenom( int d );

	void simplifica();

	string getAsString()const;
};


Fraccao operator+ (const Fraccao & a, const Fraccao & b);
#endif