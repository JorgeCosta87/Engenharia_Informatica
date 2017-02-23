#ifndef GINASIO_H
#define GINASIO_H

#include <iostream>
#include <string>
#include <vector>
using namespace std;


class Cliente;
// Alinea F

class Ginasio {
	vector<Cliente *> clientes; // vector - ninguem proibiu. * porque e preciso p/ polimorf.
	unsigned int relogio;
        
        unsigned int pesquisaClienteDadoBI(unsigned int bi);
public:
	void avancaRelogio(unsigned int tempo);

	bool acrescentaCliente(Cliente * c);

	unsigned int paga(unsigned int bi);

	void entraClienteNoTreino(unsigned int bi);

	void saiClienteDoTreino(unsigned int bi);

	void removeCliente(unsigned int bi);
		
	// funcoes que nao foram explicitamente pedidas mas sao mesmo necessarias
	Ginasio() {
		relogio = 0;
	}

	~Ginasio();
	// Nao foram pedidas, fazem falta ou dao jeito

	unsigned int getNumClientesATreinar() const;	

	// Alinea G - Duplicar o Ginasio e toda a tralha que contem (clientes e os seus tarifarios)
	Ginasio & operator=(const Ginasio & x);

	Ginasio(const Ginasio & x);
	string getAsString() const;
};                         

#endif