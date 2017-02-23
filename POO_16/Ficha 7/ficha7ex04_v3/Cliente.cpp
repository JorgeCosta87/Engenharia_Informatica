#include <sstream>
using namespace std;

#include "Cliente.h"
#include "Tarifario.h"

Cliente::~Cliente() {
    delete tarif;
}

Cliente::Cliente(string n, unsigned int b, Tarifario * t) : nome(n), bi(b), tarif(t) {
    horainicio = -1; // significa nao esta a treinar - necessario
}

void Cliente::iniciaTreino(unsigned int hora) {
    if (horainicio == -1)
        horainicio = hora;
}

void Cliente::terminaTreino(unsigned int hora) {
    if (horainicio != -1) {
        tarif->acrescentaTreino(hora - horainicio);
        horainicio = -1;
    }   
}

unsigned int Cliente::paga() {
    return tarif->calculaPagamentoEApagaTreinos();
}

void Cliente::mudaTarifario(Tarifario * t) {
    if (t != nullptr) { // So muda se o novo tarifario existir mesmo
        delete tarif; // Apaga tarifario anterior (deixa de servir)
        tarif = t; // (obs: os treinos do antigo tarifario ficaram
    } // por pagar.... devia-se pagar antes de mudar de tarif)
}

Cliente & Cliente::operator=(const Cliente & x) {

    // 1. Testa auto-atribuicao para evitar trabalho desnecessario
    // e libertacao do tarifario da origem da copia (que coincide com o destino)
    if (this == &x) return * this;

    // 2. Liberta recursos actuais do objecto alvo da atribuicao
    //    Neste caso so o objecto tarifario
    delete tarif;

    // 3. Cria/Copia recursos (iguais ao) do outro objeto
    // 3.1 No caso do tarifario, pode ser de qualquer tipo 
    //     Usar o new nao e viavel (nao se sabe o tipo). O Tarifario que se duplique
    //     Tem que ser pela via do "duplica" (implementar no tarifario e derivadas)
    nome = x.nome;
    bi = x.bi;
    horainicio = x.horainicio;
    tarif = x.tarif->duplica();

    return *this;
}

Cliente::Cliente(const Cliente & x) {
    // 1. Efectua pre-inicializacao para compatibilizar com o operador
    //    neste caso basta colocar o ponteiro tarif num estado inicial coerente
    tarif = nullptr;

    // 2. Usa operador de atribuicao
    *this = x;
}

string Cliente::getAsString() const {
    ostringstream oss;
    oss << nome << " - BI: " << bi;
    return oss.str();
}