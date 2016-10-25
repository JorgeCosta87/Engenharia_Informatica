#include <iostream>
#include <sstream>
#include <cmath>

using namespace std;

#include "Tirangulo.h"



Ponto::Ponto(int x0, int y0):x(x0), y(y0){
//	x = x0;
//	y = y0;
	cout << "\nPonto(int x0, int y0)  " << getAsString();
}
//Ponto::Ponto( const Ponto & z){
//		x = z.x;
//		y = z.y;
//		std::cout << "\nPonto(const Ponto & z)  " << getAsString();
//}
Ponto::~Ponto(){
	cout << "\n~Ponto()  " << getAsString();
}

int Ponto::getX()const{
	return x;
}
int Ponto::getY()const{
	return y;
}

void Ponto::setX(int x0){
	x = x0;
}
void Ponto::setY(int y0){
	y = y0;
}

// obter um objecto string com a descricao textual do seu conteudo (formato  (x  / y) ).
string Ponto::getAsString()const{
	ostringstream oss;
	oss << " ( " << x << "," << y << ") ";
	return oss.str();
}

double Ponto::calculaDistancia(const Ponto & outro)const{
	//  x, y, coordenadas do ponto que invoca (apontado por this)
	// outro.x, outro.y coordenadas do ponto recebido como parametro 
	double d2 = (x - outro.x)*(x - outro.x) + (y - outro.y)*(y - outro.y);
	return sqrt(d2);
}
