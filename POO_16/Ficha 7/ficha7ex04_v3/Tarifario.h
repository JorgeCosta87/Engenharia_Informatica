#ifndef TARIFARIO_H
#define TARIFARIO_H

#include <iostream>
#include <string>
using namespace std;

// Alinea A
class Tarifario {
	unsigned int * treinos;
	unsigned int quantos;
	virtual unsigned int calculaPagamento()const = 0;  // a implementar pelas derivadas
public:
	void acrescentaTreino(unsigned int t);
	unsigned int calculaPagamentoEApagaTreinos();

	// ---- funcoes seguintes: nao mencionadas, obrigatorias na mesma

	// e preciso um construtor para inicializar o ponteiro e a variavel quantos
	Tarifario();

	// Vai ser preciso ter o destrutor para devolver a memoria ocupada pela matriz dinamica
	virtual ~Tarifario();

	// a matriz dinamica de inteiros (treinos) pertence exclusivamente a cada objecto
	// de Tarifario, mas nao e automaticamente copiada quando se copiam ou atribuem estes
	// objectos (apenas o ponteiro e copiado levando a partilha de matriz entre objectos
	// e mais tarde a deletes repetidos da mesma matriz, entre outras incoerencias)
	// => e preciso fazer o operador de atribuicao e o construtor por copia:

	Tarifario(const Tarifario & x);
	Tarifario & operator=(const Tarifario & x);

	// Funcoes que nao foram pedidas mas vao dar jeito ao resto do codigo
	unsigned int getNumTreinos() const;
	
	unsigned int getTreino(unsigned int i) const;

	virtual Tarifario * duplica()const = 0;  // tem que ser abstracta tb. Nao se pode construir
	                                    // Tarifario ainda porque e classe abstracta
};

#endif