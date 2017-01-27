
#include<sstream>
using namespace std;

#include "Aquario.h"
#include "Peixe.h"


Aquario::Aquario(const Aquario& orig) {
    *this = orig;
}

Aquario::~Aquario() {
//    for(Peixe * p: peixes){
//        delete p;
//    }
    for( int i = 0 ; i < peixes.size() ; i++){
        delete peixes[i];
    }
}

Aquario & Aquario::operator=(const Aquario& orig) {
    // prevencao da auto-atribuicao
    if(this == &orig){
        return *this;
    }
    // libertar mem. din. velha
    for( int i = 0 ; i < peixes.size() ; i++){
        delete peixes[i];
    }
    //esvaziar o vector
    peixes.clear();
    
    // copiar a informacao de orig, duplicando os objectos dinamicos Peixe
    for( int i = 0 ; i < orig.peixes.size() ; i++){
        Peixe * p = orig.peixes[i];
        peixes.push_back( new Peixe( *p));
    }
    return *this;
}
bool Aquario::addPeixe(Peixe * peixe){
    if(peixe == nullptr){
        return false;
    }
    // se o peixe estiver no aquario
    if(pesquisaPeixe(peixe->getNumSerie()) != -1){
        return false;
    }
    // se ainda nao esta no aquario ...
    
    // cria uma copia do peixe dado, em memoria dinamica,
    // com new
    // o destrutor vai libertar com delete
    // e só se pode fazer delete a um objecto criado com new
    // delete a um objecto local de uma funcao provoca
    // erro de execucao
    Peixe * p = new Peixe(*peixe);
    peixes.push_back(p);
//    peixes.push_back(peixe);
    return true;
}
int Aquario::pesquisaPeixe(int numSerie)const{
    for(int i = 0 ; i < peixes.size(); i++){
        if(peixes[i]->getNumSerie() == numSerie){
            return i; // posicao no vector
        }
    }
    return -1; // posicao impossivel, nao se encontra
}
void Aquario::alimentar(int quant){
   
// ERRO:  confusão de indices, nem todos sao alimentados
//    for(int i = 0 ; i < peixes.size(); i++){
//        peixes[i]->alimentar(quant, this);
//    }
    
    // percorre a copia do vector do objecto aquario
    vector<Peixe *> copia = peixes;
    for(int i = 0 ; i < copia.size(); i++){
        // o peixe pede para se remover no vector original
        // (do objecto aquario)
        copia[i]->alimentar(quant, this);
    }
}

//void Aquario::alimentar(int quant){
//   
//// ERRO:  confusão de indices, nem todos sao alimentados
//    for(int i = 0 ; i < peixes.size(); i++){
//        peixes[i]->setPeso(peixes[i]->getPeso()+quant);
//        if(peixes[i]->getPeso() > 50){
//            peixes.erase(peixes.begin()+i);
//        }
//    }
//
//}

Peixe * Aquario::removePeixe(int numSerie){
    int qual = pesquisaPeixe(numSerie);
    if(qual == -1){
        return nullptr;
    }
    Peixe * p = peixes[qual];
    // remove o peixe do aquario mas o peixe continua
    // vivo, vai para um quintal maior
    // se fosse para ser destruido na remocao
    // estaria aqui 
    // delete peixes[i]
    peixes.erase(peixes.begin() + qual);
    return p;
}

string Aquario::getAsString()const {
    ostringstream oss;
    oss << "\nAquario: \n";
    for (Peixe * p : peixes) {
        oss << p->getAsString();
    }
    return oss.str();
}