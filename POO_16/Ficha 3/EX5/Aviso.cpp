#include<iostream>
#include <sstream>
#include<string>

using namespace std;
#include "Aviso.h"
#include "Prego.h"

Aviso::Aviso(const string & t, const Prego * const p):texto(t), prego(p){
	cout << " Aviso " << texto << endl;
}

Aviso::~Aviso(){
	cout << " ~Aviso() " << texto << endl;
}
int Aviso::getX()const{ 
	return prego->getX();
}
int Aviso::getY()const{ 
	return prego->getY();
}
string Aviso::getAsString()const{
	ostringstream oss;
	oss << "Aviso: " << texto << "  "  << prego->getAsString();
	return oss.str();
}