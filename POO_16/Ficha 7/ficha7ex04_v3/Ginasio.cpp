#include <sstream>
using namespace std;

#include "Ginasio.h"
#include "Cliente.h"

void Ginasio::avancaRelogio(unsigned int tempo) {
    relogio += tempo;
}

bool Ginasio::acrescentaCliente(Cliente * c) {
    if (c == nullptr) {
        return false;
    }
    // se existe um cliente com o mesmo bi
    if (pesquisaClienteDadoBI(c->getBI()) != -1) {
        return false;
    }
    clientes.push_back(c);
    return true;
}

unsigned int Ginasio::paga(unsigned int bi) {
    // Procura o cliente. E devolvida a sua posicao no vector clientes
    unsigned int ind = pesquisaClienteDadoBI(bi);
    // Se nao foi encontrado foi devolvido -1 
    if (ind != -1) {
        // Se encontrou, chama a paga()
        return clientes[ind]->paga();
    }
    return 0;
}

void Ginasio::entraClienteNoTreino(unsigned int bi) {
    unsigned int ind = pesquisaClienteDadoBI(bi);

    if (ind == -1) return; // pode acontecer ser um Cliente "nao encontrado"

    // 1. Verifica se o cliente ainda nao estava a treinar
    if (clientes[ind]->estaATreinar() == true) {
        return;
    }

    // 2. Avisa os outros clientes a treinar que ENTROU um na sala
    for (unsigned int i = 0; i < clientes.size(); i++) {
        if (clientes[i]->estaATreinar()){
            clientes[i]->reageEntrada(this);
        }
    }
    // o cliente inicia o treino
    clientes[ind]->iniciaTreino(relogio);
}

void Ginasio::saiClienteDoTreino(unsigned int bi) { // ou seja, testa se encontrou
    unsigned int ind = pesquisaClienteDadoBI(bi);
    if (ind == -1) return; // pode acontecer ser um Cliente "nao encontrado"

    // 2. Nao estava a treinar? Entao esquece. Foi engano		
    if (clientes[ind]->estaATreinar() == false) {
        return;
    }

    // primeiro tira da sala de treino e so depois avisa os que ficaram que saiu um	
    clientes[ind]->terminaTreino(relogio);

    // 4. Avisa os outros clientes a treinar que saiu um da sala
    for (unsigned int i = 0; i < clientes.size(); i++) {
        if (clientes[i]->estaATreinar()) {
            clientes[i]->reageSaida(this);
        }
    }
}

void Ginasio::removeCliente(unsigned int bi) {
    // 1. procura o cliente na base de dados de clientes
    unsigned int ind = pesquisaClienteDadoBI(bi);
    if (ind == -1) return; // Nao existe aqui ninguem com esse BI

    // 2. Encontrou - manda-o sair do treino (pode nem estar a treinar = faz nada)
    saiClienteDoTreino(bi); // funcao de ginasio - evita-se repetir o codigo aqui

    // 3. Ja agora, antes de ires, paga a conta sff.
    clientes[ind]->paga(); // deseja num. de contribuinte na factura?

    // 5. Apaga (a ficha do) cliente - O enunciado diz que os clientes pertencem ao ginasio
    delete clientes[ind]; // importante que o cliente seja mesmo uma variavel dinamica
    clientes.erase(clientes.begin() + ind); // retira do vector o ponteiro para memoria ja libertada
}

Ginasio::~Ginasio() {
    // Apaga as fichas. Nao e preciso fazer mais nada.
    for (unsigned int i = 0; i < clientes.size(); i++)
        delete clientes[i]; // Enunciado diz que clientes pertencem ao Ginasio
} // (devem ser meras fichas de papel num arquivo qualquer)

// Nao foram pedidas, fazem falta ou dao jeito

unsigned int Ginasio::getNumClientesATreinar() const {
    unsigned int n = 0;
    for (unsigned int i = 0; i < clientes.size(); i++) {
        if (clientes[i]->estaATreinar())
            n++;
    }
    return n;
}

unsigned int Ginasio::pesquisaClienteDadoBI(unsigned int bi) {
    for (unsigned int i = 0; i < clientes.size(); i++)
        if (clientes[i]->getBI() == bi)
            return i;
    return -1;
} // retorna o indice se encontrou, ou -1 se nao encontrou

Ginasio & Ginasio::operator=(const Ginasio & x) {

    // 1. Testa a auto-atribuicao. Se sao o mesmo objecto, "ja sao iguais"
    // nao se libertam recursos do destino da atribuicao porque coincide com a origem
    if (this == &x) return *this;

    // 2. Apaga o conteudo ja existente no "alvo" da atibuicao (*this)
    for (unsigned int i = 0; i < clientes.size(); i++)
        delete clientes[i]; // apaga mesmo os clientes (eram do ginasio)
    // os clientes foram apagados, mas os ponteiros
    clientes.clear(); // ainda estao no vector, o qual deve ser esvaziado.

    // 3. Faz copia polimorfica dos clientes do Ginasio original
    for (unsigned int i = 0; i < x.clientes.size(); i++)
        clientes.push_back(x.clientes[i]->duplica()); // Seja la o que fores, duplica-te

    // 4. So falta copiar o valor do relogio
    relogio = x.relogio;
    return *this;
}

Ginasio::Ginasio(const Ginasio & x) {
    // nao e preciso nenhuma pre-inicializacao explicita porque o vector e
    // inicializado automaticamente com o seu construtor por omissao (uma vez que nao
    // foi usado nenhum outro na lista de inicializaao deste constutor) e que o deixa
    // vazio e pronto a usar. Noutros casos poderia ser necesaria algo aqui.
    *this = x;
}

string Ginasio::getAsString() const {
    ostringstream oss;
    oss << "\nGinasio: "
            << " (tempo: " << relogio << ")"
            << "\nClientes" << endl;
    for (unsigned int i = 0; i < clientes.size(); i++)
        oss << clientes[i]->getAsString() << endl;

    oss << "\nA treinar " << endl;
    for (unsigned int i = 0; i < clientes.size(); i++) {
        if (clientes[i]->estaATreinar()) {
            oss << clientes[i]->getAsString() << endl;
        }
    }
    return oss.str();
}