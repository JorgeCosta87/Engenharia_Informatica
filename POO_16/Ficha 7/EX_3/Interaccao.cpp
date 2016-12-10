
#include <iostream>
#include <sstream>
#include <limits>

using namespace std;

#include "Livro.h"
#include "Ficcao.h"
#include "Policial.h"
#include "Biblioteca.h"
#include "Interaccao.h"


int Interaccao::lerInt(string msg) {
    int valor;
    bool leu = false;
    do {
        cout << msg;
        string s;
        cin >> s;
        istringstream iss(s);
        if (iss >> valor) // se correu bem a leitura
            leu = true;
    } while (!leu);
    return valor;
}
long Interaccao::lerLong(string msg) {
    long valor;
    bool leu = false;
    do {
        cout << msg;
        string s;
        cin >> s;
        istringstream iss(s);
        if (iss >> valor) // se correu bem a leitura
            leu = true;
    } while (!leu);
    return valor;
}
int Interaccao::escolheOpcao( vector<string> opcoes){
	for ( unsigned int i = 0 ; i < opcoes.size() ; i++)
		cout << endl << i << " - " << opcoes[i];

	int opcao = -1;
	do {
		opcao = lerInt("\n\nopcao > ");
	} while (opcao < 0 || opcao > opcoes.size());
	return opcao;
}


void Interaccao::menu( Biblioteca & b){
	
	vector<string> opcoes;
	opcoes.push_back("Sair");
	opcoes.push_back("Listar");
	opcoes.push_back("Acrescentar livro");
	opcoes.push_back("Acrescentar livro policial");
	opcoes.push_back("Acrescentar livro de ficcao");
	opcoes.push_back("Eliminar livro por ISBN");
	
	int opcao = 0;
	do {
		opcao = escolheOpcao( opcoes);
		switch (opcao){
			case 0: cout << "\nSair\n";
					break;
			case 1: cout << "\nListar \n" << b << endl; 
					break;
			case 2: opcaoAcrescentarLivro(b);
					break;
			case 3: opcaoAcrescentarLivroPolicial(b);
					break;
			case 4: opcaoAcrescentarLivroDeFiccao(b);
					break;
			case 5: opcaoEliminarLivro(b);
					break;
		}

	}while (opcao != 0);
}

void Interaccao::lerDadosLivro( string & titulo, string & autor, long & isbn){

	cout << "\nNovo livro\n	titulo: ";

	cin.ignore(numeric_limits <streamsize> ::max(), '\n' ); 
	getline(cin, titulo);

	
	cout << "\n	Autor: ";
	getline(cin, autor);

	isbn = lerLong("\n	ISBN: ");
}

void Interaccao::opcaoAcrescentarLivro( Biblioteca & b){
	string titulo, autor;
	long isbn;

	lerDadosLivro(titulo, autor, isbn);

	if(b.acrescentarLivro( new Livro(titulo, autor, isbn)))
		cout << "\nLivro acrescentado com sucesso";
	else
		cout << "\nO livro nao foi acrescentado";
}

void Interaccao::opcaoAcrescentarLivroPolicial( Biblioteca & b){
	string titulo, autor;
	long isbn;

	lerDadosLivro(titulo, autor, isbn);
	string det;
	cout << "\nDetective: ";
	getline(cin, det);

	int n = lerInt("\n N. de tiros: ");

	if(b.acrescentarLivro( new Policial(titulo, autor, isbn, det, n)))
		cout << "\nLivro acrescentado com sucesso";
	else
		cout << "\nO livro nao foi acrescentado";
}
void Interaccao::opcaoAcrescentarLivroDeFiccao( Biblioteca & b){
	string titulo, autor;
	long isbn;

	lerDadosLivro(titulo, autor, isbn);

	string planeta;
	cout << "\nPlaneta: ";
        cin.ignore(numeric_limits <streamsize> ::max(), '\n' ); 
	getline(cin, planeta);

	int ano = lerInt("\n Ano: ");;
	
	cout << "\nRealista?(s/n): ";
	string resposta;
	cin >> resposta;
	bool r = false;
	if(resposta == "s" || resposta == "S")
		r = true;
	if(b.acrescentarLivro( new Ficcao( titulo, autor, isbn, planeta, ano, r)))
		cout << "\nLivro acrescentado com sucesso";
	else
		cout << "\nO livro nao foi acrescentado";
}

void Interaccao::opcaoEliminarLivro(Biblioteca & b){
	cout << "\nEliminar livro dado o ISBN\n";

	long isbn = lerLong("\n	ISBN: ");
        
	bool eliminou = b.remover(isbn);
	if (eliminou){
		cout << "\n Livro eliminado\n";
	} else {
		cout << "\n Nao existe\n";
	}
}