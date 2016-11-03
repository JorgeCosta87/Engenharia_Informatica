
#ifndef ARQUIVODEIDENTIFICACAO_H
#define ARQUIVODEIDENTIFICACAO_H

#include <vector>
#include <string>
using namespace std;

class Pessoa;

class ArquivoDeIdentificacao{
	string nome;
	vector<Pessoa * > pessoas;
	int pesquisa(long bi)const;
public:
	ArquivoDeIdentificacao(string nome0);
        ArquivoDeIdentificacao(const ArquivoDeIdentificacao & ob)=delete; // para nao haver outro construtor
        ArquivoDeIdentificacao & operator=(const ArquivoDeIdentificacao & ob)=delete;
	~ArquivoDeIdentificacao();
	string getNome()const;
	void setNome(string nome0);
	bool acrescentaPessoa(string n, long b, long nif);
	string getAsString()const;
	const Pessoa * getPessoa(long bi);


	bool gravarPessoasEmFicheiroDeTexto();
	bool lerPessoasDeFicheiroDeTexto();
};


#endif /* ARQUIVODEIDENTIFICACAO_H */

