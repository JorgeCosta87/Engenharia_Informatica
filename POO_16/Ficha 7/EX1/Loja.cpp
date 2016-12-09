#include<sstream>
#include "Loja.h"


Loja::Loja(float area):
Imovel(15 * area, area){
	setCodigo( "Loja-" + getCodigo());
}
string Loja::getAsString()const{
	ostringstream oss;
	oss << "Loja \n" << Imovel::getAsString() 
		<< "   andar: R/C\n";
	return oss.str();
}