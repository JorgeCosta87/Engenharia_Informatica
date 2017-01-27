#include <sstream>
using namespace std;

#include "Sociavel.h"
#include "Ginasio.h"

Sociavel::Sociavel(string n,unsigned int b, Tarifario * t) : Cliente(n, b,  t) { 
}
void Sociavel::reageSaida(Ginasio * g) {
	if (g->getNumClientesATreinar() == 1) // se so sobrou este
		g->saiClienteDoTreino(getBI());  // pede para sair
}
string Sociavel::getAsString() const {
	ostringstream oss; 
	oss << "Sociavel - " << Cliente::getAsString();
	return oss.str();
}