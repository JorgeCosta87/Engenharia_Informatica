#ifndef PONTO_H
#define PONTO_H

#include <string>
#include <iostream>
using namespace std;

class Ponto{
	int x, y; // coordenadas
public:
	// nao deve ser possivel construir objectos desta classe sem a indicacao das suas coordenadas 
//	Ponto( int x0, int y0);  
        
	// ser possivel criar pontos sem especificacao das suas coordenadas ( ficam na posicao (0,0))
	Ponto( int x0 = 0, int y0 = 0); 
//	Ponto( const Ponto & z);
	// so para testes
	~Ponto();

	// as funcoes que permitem obter os dados devem poder ser chamadas sobre objectos Ponto constantes
	int getX()const;
	int getY()const;

	// as que modificam as coordenadas nao devem poder ser chamadas sobre objectos Ponto constantes
	void setX(int x0);
	void setY(int y0);

	// obter um objecto string com a descricao textual do seu conteudo
	string getAsString()const;

	// obter a distancia entre dois pontos
	double calculaDistancia(const Ponto & outro)const;
};

#endif



