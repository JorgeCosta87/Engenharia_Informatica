#include<sstream>
#include "Imovel.h"

int Imovel::ordem = 0;

Imovel::Imovel( float p, float a):preco(p), area(a){
	ostringstream oss;
	oss << (++ordem);
	codigo = oss.str();
} 

string Imovel::getAsString()const{
	ostringstream oss;
	oss << "   codigo: " << codigo << "\n   preco: " 
		<< preco << "\n   area " << area << endl;
	return oss.str();
}
ostream & operator<<(ostream & saida, const Imovel & x){
	saida << x.getAsString();
	return saida;
}