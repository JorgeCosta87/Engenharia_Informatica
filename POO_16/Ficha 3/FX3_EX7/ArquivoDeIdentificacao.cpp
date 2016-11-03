#include <iostream>
#include <sstream>
#include <fstream>
#include <string>
using namespace std;

#include "ArquivoDeIdentificacao.h"
#include "Pessoa.h"

ArquivoDeIdentificacao::ArquivoDeIdentificacao(string nome0)
:nome(nome0){}


ArquivoDeIdentificacao::~ArquivoDeIdentificacao(){
	for( int i = 0 ; i < pessoas.size() ; i++)
		delete pessoas[i];
}

void ArquivoDeIdentificacao::setNome(string nome0){
	nome = nome0;
}
string ArquivoDeIdentificacao::getNome()const{
	return nome;
}
bool ArquivoDeIdentificacao::acrescentaPessoa(string n, long b, long  nif){
	int qual = pesquisa(b);
	if(qual != -1){
		return false;
	}
	pessoas.push_back(new Pessoa( n, b, nif));
	return true;
}

string ArquivoDeIdentificacao::getAsString()const{
	ostringstream oss;
	oss << nome << endl;
	
	for( int i = 0 ; i < pessoas.size() ; i++){
		oss << endl << pessoas[i]->getAsString();
	}
	return oss.str();
}

int ArquivoDeIdentificacao::pesquisa(long bi)const{
	for ( int i = 0 ; i < pessoas.size() ; i++){
		if( pessoas[i]->getBi() == bi){
			return i;
		}
	}
	return -1;
}
const Pessoa * ArquivoDeIdentificacao::getPessoa(long bi){
	int qual = pesquisa(bi);
	if (qual == -1){
		return nullptr;
	} else {
		return pessoas[qual];
	}
}

bool ArquivoDeIdentificacao::lerPessoasDeFicheiroDeTexto(){	
	ifstream dados("dados.txt");
	string nome;
	long bi;
	long nif;
	string s;

	if(!dados.is_open()){
		return false;
	}

	// ler dados de todas as pessoas
	// uma por linha

	while(!dados.eof()){ 
		// ler strig com os dados da pessoa
		getline(dados, s);
                
                istringstream iss(s);
		// ler dados da pessoa
		iss >> nome >> bi >> nif;  

                // se correu bem a leitura ...
		if ( iss){ 
			acrescentaPessoa(nome, bi, nif);
		}
	}
	dados.close();
	return true;
}

bool ArquivoDeIdentificacao::gravarPessoasEmFicheiroDeTexto(){
	ofstream dados("dados.txt");
	if(!dados.is_open()){
		return false;
	}
	
	for ( int i = 0 ; i < pessoas.size() ; i++){
		dados << pessoas[i]->getNome() << "   "
                       <<pessoas[i]->getBi() << "   "
                        <<pessoas[i]->getNif()<< endl;
	}
        
	dados.close();
	if (dados) {
		return true;
	}
	else return false;
}
