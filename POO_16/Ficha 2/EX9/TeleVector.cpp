#include "TeleVector.h"

#include <sstream>
#include <iostream>
using namespace std;

#include "TeleVector.h"


TeleVector::TeleVector(string canais0[], int n){
	setCanais(canais0, n);
	ligada = false;
	volume = 0;
	canal = 1; // (o indice do elemento correspondente do array canais) + 1	
}
void TeleVector::setCanais(string canais0[], int n){
	if(n < 0 )
		n = 0;
        canais.clear();
	for( unsigned int i = 0 ; i < n ; i++){
		canais.push_back(canais0[i]); // coloca os canais no fim do array
	}
        
}

bool TeleVector::isLigada()const{
	return ligada;
}

void TeleVector::ligar(){
	ligada = true;
}
void TeleVector::desligar(){
	ligada = false;
}

string TeleVector::getAsString()const{
	ostringstream oss;
	
        for ( unsigned int i = 0; i < canais.size(); i++)
            oss << canais[i] << "  ";
        
        for( const string & c: canais){ // string & é mesmo o valor e nao a copia, para ser eficiente, como tem um const nao pode ser alterado
            oss << c << "  ";
        }
        for( const auto & c: canais){ // auto é um tipo deduzido compliador sabe que o vector strings, logo sabes que é uma string
            oss << c << "  ";
        }
        for( vector<string>::const_iterator it = canais.begin(); // o iterator (uma ponteiro que aponta para a coleção) corre uma coleção, objecto que pertmi correr uma coleção. como estamos numa função const temos de usar const
                 it != canais.end(); it++){
            oss << *it << "  "; // o * aponta para o dado do endereço do ponteiro.
        }

        for( auto it = canais.begin(); it != canais.end(); it++){
            oss << *it << "  ";
        }
        
        if (!ligada){
		return "desligada\n";
	}
	oss << "\nCanal: " << canais[canal - 1] << " " << canal
		<< "\nVolume: " << volume << endl;
	return oss.str();
}
void TeleVector::aumentaVolume(){
	if (!ligada){
		return;
	}
	if(volume < 10){
		volume++;
	}
}
void TeleVector::diminuiVolume(){
	if (!ligada){
		return;
	}
	if(volume > 0){
		volume--;
	}
}

void TeleVector::mudaDeCanal(int c){
	if (!ligada){
		return;
	}
	unsigned cc = c;
	if(cc > 0 && cc <= canais.size()){ // canal valido
		canal = c;
		cout<< "\nCanal: " << canais[canal-1] << "   "  << canal << endl; // envia para o ecran 
	}
}