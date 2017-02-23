#include "Tarifario.h"

Tarifario::Tarifario(){
	treinos = nullptr; // inicialmente nao ter treinos nenhuns
	quantos = 0;
}
Tarifario::~Tarifario() {
		delete [] treinos;
}
void Tarifario::acrescentaTreino(unsigned int t) {
	unsigned int * aux = new unsigned int [quantos + 1];
	if (aux == nullptr) return;
	for (unsigned int i=0; i< quantos; i++)
		aux[i] = treinos[i];
	aux[quantos] = t;
	quantos++;
	delete []treinos;
	treinos = aux;
}
unsigned int Tarifario::calculaPagamentoEApagaTreinos() {
	unsigned int conta = calculaPagamento();  // vai chamar a funcao correspondente a classe do objecto que invoca
	delete []treinos;
	treinos = nullptr;
	quantos = 0;
	return conta;
}
Tarifario::Tarifario(const Tarifario & x) {
	// 1.  Preinicializacao tipicamente necessaria 
	treinos = nullptr;  // pre-inicializacao para que o operador de atribuicao
	quantos = 0;        // consiga trabalhar bem (precisa de ter o objecto num estado
		            // coerente, dai a inicializacao previa)
                            // para acontecer delete apenas a um valor de um ponteiro
                            // nulo ou com um valor dado por new ...
	// 2. Usar ooperador de atribuicao
	*this = x;
}

Tarifario & Tarifario::operator=(const Tarifario & x) {
	// 1. Testa auto-atribuicao para evitar trabalho desnecessario e possivel incoerencia
        //    e libertacao dos treinos da origem da copia (que coincide com o destino)
	if (this == & x) // na mem. dinamica. Se sao o mesmo -> ja sao iguais = concluido
		return *this;
		
	// 2. Devolve os recursos ocupados pelo objecto alvo da atribuicao.
	delete []treinos;
	treinos = nullptr; // coloca objecto ja num estado coerente com o significado
	quantos = 0;       // "tenho 0 treinos"

	// 3. Se o outro objecto tambem tem 0 treinos, ja estamos iguais. Concluido
	if (x.treinos == nullptr) return *this;

	// 4. Criar recursos iguais (copiar) aos do outro objecto
	// 4.1. Alocar matriz dinamica para tantos treinos como os do outro objecto
	// 4.2. Copiar dos dados: o conteudo da matriz e restantes membros
	treinos = new unsigned int[x.quantos];
	if (treinos == nullptr)
		return *this;      // se nao houve memoria fica com 0 treinos
	quantos = x.quantos;
	for (unsigned int i = 0; i<quantos; i++)
		treinos[i] = x.treinos[i];
	// 5. concluido
	return *this;
}
unsigned int Tarifario::getTreino(unsigned int i) const {
	if ( (i<0) || (i>=quantos) ){
		return 0;
        }
	return treinos[i];
}
unsigned int Tarifario::getNumTreinos() const { return quantos; }