#include<sstream>
#include "Apartamento.h"



Apartamento::Apartamento(float area, int a, int n):
Imovel(10 * area, area),andar(a), nAssoalhadas(n){
	setCodigo( "Apartamento-" + getCodigo());
}

string Apartamento::getAsString()const{
	ostringstream oss;
	oss << "Apartamento \n" << Imovel::getAsString() 
		<< "   andar: " << andar << "\n   N. de assoalhadas: " << nAssoalhadas << endl;
	return oss.str();
}