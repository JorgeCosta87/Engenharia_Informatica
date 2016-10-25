#include <iostream>
#include <sstream>
using namespace std;

#include "Rectangulo.h"


Rectangulo::Rectangulo( int x, int y, int larg, int alt)
:canto(x, y)
{
	if(!setLargura(larg)){
		largura = 1;
	}
	if(!setAltura(alt)){
		altura = 1;
	}
	cout << "\nRectangulo(...)  " << getAsString();
}


Rectangulo::~Rectangulo(){
	 cout << "\n~Rectangulo()  " << getAsString();
}

Ponto Rectangulo::getCanto()const{
	return canto;
}
int Rectangulo::getLargura()const{
	return largura;
}
int Rectangulo::getAltura()const{
	return altura;
}
std::string Rectangulo::getAsString()const{
	ostringstream oss;
	oss << " Rectangulo " << canto.getAsString() << " larg: " 
		<< largura << " alt: " << altura;
	return oss.str();
}

int Rectangulo::calculaArea()const{
	return largura * altura;
}

void Rectangulo::setCanto( const Ponto & c){
	canto = c;
}
bool Rectangulo::setLargura( int larg){
	if(larg <=  0){
		return false;
	}
	largura = larg;
	return true;
}
bool Rectangulo::setAltura( int alt){
	if(alt <=  0){
		return false;
	}
	altura = alt;
	return true;
}
