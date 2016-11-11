#include <sstream>
#include <iostream>
#include <cmath>
#include "Fraccao.h"

Fraccao::Fraccao( int n , int d ):num(n){
	setDenom(d);
	cout << "Fraccao( int n , int d ) " << getAsString() << endl;
}
void Fraccao::setDenom( int d){
	if ( d > 0){
		denom = d;
	}else if (d == 0) {
		num = 0;
		denom = 1;
	} else { // d < 0
		num = -num;
		denom = -d;
	}
	simplifica();
}

void Fraccao::simplifica(){
	int sinal = num >= 0 ? 1 : -1;// guarda o sinal da fraccao
	num = abs(num);
	// calcula o m. d. c. de num e denom, n�o negativos
	int a = num, b = denom;
	while (b){
		int aux = b;
		b = a % b;
		a = aux;
	}
	// a : o m. d. c. de num e denom, calculado pelo algoritmo de Euclides
	num = num / a * sinal;
	denom = denom / a;
}
string Fraccao::getAsString()const{
	ostringstream oss;
	oss << "(" << num << " / " << denom << ")" ;
	return oss.str();
}
