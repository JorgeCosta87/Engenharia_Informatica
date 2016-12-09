#include <iostream>
#include <string>
#include <vector>

using namespace std;

#include "Apartamento.h"
#include "Loja.h"
#include "Imobiliaria.h"

int escolheOpcao( vector<string> opcoes);
void opcaoAcrescentarApartamento(Imobiliaria & ag);
void opcaoAcrescentarLoja(Imobiliaria & ag);
void opcaoPesquisarImovelPorCodigo(const Imobiliaria & ag);
void opcaoPesquisarPrecoDeImovelPorCodigo(const Imobiliaria & ag);
void opcaoActualizarPrecoDeImovelPorCodigo(Imobiliaria & ag);
void opcaoRemoverImovelPorCodigo(Imobiliaria & ag);

int main(){
	Imobiliaria Imobiliaria("Imobiliaria");
	vector<string> opcoes;
	opcoes.push_back("Sair");
	opcoes.push_back("Listar");
	opcoes.push_back("Acrescentar apartamento");
	opcoes.push_back("Acrescentar loja");
	opcoes.push_back("Pesquisar imovel por codigo");
	opcoes.push_back("Pesquisar preco de imovel dado o codigo");
	opcoes.push_back("Actualizar o preco de um imovel dado o codigo");
	opcoes.push_back("Remover imovel dado o codigo");
	
	int opcao = 0;
	do {
		opcao = escolheOpcao( opcoes);
		switch (opcao){
			case 0: cout << "\nSair\n";
					break;
			case 1: cout << Imobiliaria << endl;
					break;
			case 2:	opcaoAcrescentarApartamento(Imobiliaria);
					break;
			case 3: opcaoAcrescentarLoja(Imobiliaria);
					break;
			case 4: opcaoPesquisarImovelPorCodigo(Imobiliaria);
					break;
			case 5: opcaoPesquisarPrecoDeImovelPorCodigo(Imobiliaria);
					break;
			case 6: opcaoActualizarPrecoDeImovelPorCodigo(Imobiliaria);
					break;
			case 7:	opcaoRemoverImovelPorCodigo(Imobiliaria);
					break;
		}

	}while (opcao != 0);
	
}


int escolheOpcao( vector<string> opcoes){
	for ( unsigned int i = 0 ; i < opcoes.size() ; i++)
		cout << endl << i << " - " << opcoes[i];
	cout << "\n\nopcao > ";

	int opcao = -1;
	do {
		cin >> opcao;
	} while (opcao < 0 || opcao > opcoes.size());
	return opcao;
}

void opcaoAcrescentarApartamento(Imobiliaria & ag){
	float area;
	int andar;
	int nAss;
	cout << "\nAcrescentar apartamento";
	cout << "   area: ";
	cin >> area;
	cout << "   andar: ";
	cin >> andar;
	cout << "   n. de assoalhadas: ";
	cin >> nAss;
	if(cin)
		ag.acrescentaImovel( new Apartamento(area, andar, nAss));
}
void opcaoAcrescentarLoja(Imobiliaria & ag){
	float area;
	cout << "\nAcrescentar loja: ";
	cout << "   area: ";
	cin >> area;
	if(cin)
		ag.acrescentaImovel( new Loja(area));
}

void opcaoPesquisarImovelPorCodigo(const Imobiliaria & ag){
	string codigo;
	cout << "\nPesquisar imovel por codigo\n   codigo: ";
	cin >> codigo;
	cout << ag.getAsString(codigo) << endl;
}
void opcaoPesquisarPrecoDeImovelPorCodigo(const Imobiliaria & ag){
	string codigo;
	cout << "\nPesquisar preco de imovel por codigo\n   codigo: ";
	cin >> codigo;
	cout << ag.getPreco(codigo) << endl;
}
void opcaoActualizarPrecoDeImovelPorCodigo(Imobiliaria & ag){
	string codigo;
	float preco;
	cout << "\nActualizar preco de imovel por codigo\n   codigo: ";
	cin >> codigo;
	cout << ag.getAsString(codigo) << endl;
	cout << "\n   preco: ";
	cin >> preco;
	if(cin)
		ag.setPreco(codigo, preco);
}
void opcaoRemoverImovelPorCodigo(Imobiliaria & ag){
	string codigo;
	cout << "\nRemover imovel por codigo\n   codigo: ";
	cin >> codigo;
	cout << ag.getAsString(codigo) << endl;
	cout << "\n   Remover ";
	if(ag.remove(codigo))
		cout << " removeu ";
	else cout << " nao removeu ";
}