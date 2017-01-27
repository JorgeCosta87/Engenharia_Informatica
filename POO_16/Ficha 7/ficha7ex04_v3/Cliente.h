#ifndef CLIENTE_H
#define CLIENTE_H

#include <iostream>
#include <string>
using namespace std;

// Alinea C
class Tarifario;
class Ginasio;

class Cliente {
	string nome;
	unsigned int bi;
	Tarifario * tarif;
	unsigned int horainicio;// hora de inicio do treino
        // -1 se o cliente nao estiver a treinar

//	Faz parte da alinea na original
        //se fosse proibido copiar e atribuir objectos da classe Cliente
	//Cliente(const Cliente & x) = delete;
	//Cliente & operator= (const Cliente & x) = delete;

public:
	// Construtor e necessario. Deve receber informacao do tarifario
        // Nao pode haver clientes sem tarifario
	Cliente(string n,unsigned int b, Tarifario * t);
	
	// e necessario um destrutor para apagar o Tarifario
	virtual ~Cliente();

	void iniciaTreino(unsigned int hora);	
	void terminaTreino(unsigned int hora);
	unsigned int paga();

	virtual void reageEntrada(Ginasio * g) = 0;
	virtual void reageSaida(Ginasio * g) = 0;

	void mudaTarifario(Tarifario * t);
        
        // Necessarias mas nao foram explicitamente pedidas
	// Dao jeito, nao foram pedidas explicitamente

	unsigned int getBI()const { return bi; }

	bool estaATreinar() const{ return horainicio != -1; }

	// Alinea C.5 - "Afinal e para copiar"

    // Pergunta original dizia que nao se podia copiar
	// Versao nova remove isso. Passa a ser necessario ter operador de atribuicao
	// e construtor por copia porque o Tarifario pertence ao cliente e tem que ser
	// tambem copiado mas como reside fora do objecto cliente (via ponteiro) so sera
	// copiado se for atraves de um construtor e operador de atribuicao
	// definidos pelo progamador

	// => Fazer: construtor por copia e operador de atribuicao
	
	Cliente & operator= (const Cliente & x);

	Cliente(const Cliente & x);

	virtual Cliente * duplica()const = 0;  // Tem que ser virtual pura (Cliente e abstracta)
	virtual string getAsString() const;
};


#endif