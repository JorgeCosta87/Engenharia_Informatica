#include <string>
#include <sstream>
#include <vector>
#include <iostream>

using namespace std;

#include "Tarifario.h"
#include "Apressado.h"
#include "Cliente.h"
#include "Ginasio.h"
#include "Sociavel.h"
#include "Interaccao.h"

unsigned int Interaccao::lerUInt(string msg) {
    unsigned int valor;
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
unsigned int Interaccao::escolheOpcao( vector<string> opcoes){
	for ( unsigned int i = 0 ; i < opcoes.size() ; i++)
		cout << endl << i << " - " << opcoes[i];

	unsigned int opcao = -1;
	do {
		opcao = lerUInt("\n\nopcao > ");
	} while (opcao < 0 || opcao > opcoes.size());
	return opcao;
}
string Interaccao::lerNome( string pergunta){
	string nome;
	cout << pergunta;
	cin.ignore(100, '\n');
	getline(cin, nome);
	return nome;
}

void Interaccao::menu( Ginasio & ginasio){
	
	vector<string> opcoes;
	opcoes.push_back("Sair");
	opcoes.push_back("Listar");
	opcoes.push_back("Acrescentar Cliente");
	opcoes.push_back("Eliminar cliente por BI");
	opcoes.push_back("Vai treinar");
	opcoes.push_back("Sai do ginasio");
	opcoes.push_back("Paga");
	opcoes.push_back("Passa tempo");
	
	
	int opcao = 0;
	do {
		opcao = escolheOpcao( opcoes);
		switch (opcao){
			case 0: cout << "\nSair\n";
					break;
			case 1: cout << "\nListar \n" << ginasio.getAsString() << endl; 
					break;
			case 2: {
					string nome = lerNome("\nNome: ");
					unsigned int bi = lerUInt("\nBI: ");

					cout << "\nEscolha o tarifario: ";
					Tarifario * p = 0;
					vector<string> opcoesTarifario;
					opcoesTarifario.push_back("Sair");
					opcoesTarifario.push_back("Apressado");
					unsigned int opt = escolheOpcao( opcoesTarifario);
					if (opt == 1){
						p = new Apressado;
					}else
						break;

					cout << "\nEscolha o tipo de cliente: ";
					Cliente * c = 0;
					vector<string> opcoesCliente;
					opcoesCliente.push_back("Sair");
					opcoesCliente.push_back("Sociavel");
					unsigned int opc = escolheOpcao( opcoesCliente);
					if (opc == 1){
						c = new Sociavel( nome, bi, p);
					}else
						break;

					ginasio.acrescentaCliente(c);
		
					}
					break;
			case 3: {
					unsigned int bi;
					cout << "\nBI: ";
					cin >> bi;
					ginasio.removeCliente(bi);

					}
					break;
			case 4: {
					unsigned int bi = lerUInt("\nBI: ");
					ginasio.entraClienteNoTreino(bi);			
					}
					break;
			case 5: {
					unsigned int bi = lerUInt("\nBI: ");
					ginasio.saiClienteDoTreino(bi);

					}
					break;
			case 6: {
					unsigned int bi = lerUInt("\nBI: ");
					cout << " Vai pagar "
					<< ginasio.paga(bi) << " Euros ";
					}
					break;
			case 7: {
					unsigned int numero  = lerUInt("\nNumero de unidades de tempo: ");
					ginasio.avancaRelogio( numero);
			
					}
					break;
		}

	}while (opcao != 0);
}

