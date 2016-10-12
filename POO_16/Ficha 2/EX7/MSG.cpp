/* 
 * File:   MSG.cpp
 * Author: Admin2
 * 
 * Created on 12 de Outubro de 2015, 14:47
 */

#include <iostream>
#include <sstream>
#include <string>

using namespace std;

#include "MSG.h"

int MSG::contador = 0;

MSG::MSG(char c){
		letra = c;
		num = ++contador;
		cout << "\nCriado " << getAsString();
}
MSG::MSG(const MSG & ob){
		letra = ob.letra;
		num = -ob.num;
		cout << "\nCriado por copia " << getAsString();
}

//MSG::MSG(const MSG && ob){
//		letra = ob.letra;
//		num = -ob.num*10;
//		cout << "\nCriado por copia && " << getAsString();
//}

MSG::~MSG(){
		cout << "\nTerminado " << getAsString();
}
string MSG::getAsString()const{
	ostringstream oss;
	oss<< "letra: " << letra << " numero: " << num <<endl;
	return oss.str();
}

void MSG::setNum( int n){
	num = n;
}

