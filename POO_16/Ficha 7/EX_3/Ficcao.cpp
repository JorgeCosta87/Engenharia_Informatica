
#include <iostream>
#include <sstream>

using namespace std;
#include "Ficcao.h"




string Ficcao::getAsString() const{
	ostringstream oss; 
	oss << endl << Livro::getAsString()
		<< "Planeta: " << planeta << endl
		<< "Ano: " << ano << endl;
	if (realista)
		oss << "Realista\n";
	else
		oss << "Fantasiosa\n";

	return oss.str();
}

Livro * Ficcao::duplica()const{
	return new Ficcao( *this);
}