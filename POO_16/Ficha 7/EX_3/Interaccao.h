#ifndef INTERACCAO_H
#define INTERACCAO_H

#include <vector>
#include <string>

using namespace std;

#include "Biblioteca.h"

class Interaccao {
public:
        static int lerInt(string msg);
        static long lerLong(string msg);
	static int escolheOpcao( vector<string> opcoes);
	static void lerDadosLivro( string & titulo, string & autor, long & isbn);
	static void menu( Biblioteca & b);
	static void opcaoAcrescentarLivro( Biblioteca & b);
	static void opcaoAcrescentarLivroPolicial( Biblioteca & b);
	static void opcaoAcrescentarLivroDeFiccao( Biblioteca & b);
	static void opcaoEliminarLivro(Biblioteca & b);
};

#endif /* INTERACCAO_H */