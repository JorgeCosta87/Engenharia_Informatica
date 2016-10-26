#ifndef DESENHO_H
#define DESENHO_H

#include <vector>
#include <fstream>
#include <string>
#include "Rectangulo.h"
using namespace std;

class Desenho{
	vector<Rectangulo> rectangulos; // coleccao de rectangulos
	string nome;// nome do desenho
public:
	Desenho(string nome);

	// acrescenta um rectangulo 
	void acrescentar(int x, int y, int larg, int alt);

	// pesquisa os rectangulos encontrados com canto sup esq no ponto a; 
	// retorna um vector com os rectangulos nestas condi��es
	std::vector<Rectangulo>  pesquisarRectMesmoCanto( const Ponto & a)const;

	// elimina os rectangulos com area superior a areaLimite (versao 2)
	int eliminarRectAreaSup( int areaLimite);

	// elimina o elemento com indice "qual"
	bool eliminarUm( int qual); 

	// retorna a soma das areas
	int somaDasAreas()const;
	
	// retorna uma string com a descricao do objecto
	string getAsString()const;

};

#endif