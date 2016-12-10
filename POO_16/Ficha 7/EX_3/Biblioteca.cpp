#include <iostream>
#include <sstream>

using namespace std;
#include "Livro.h"
#include "Biblioteca.h"

Biblioteca::~Biblioteca() {
    for (Livro * p : livros) {
        delete p;
    }
}

Biblioteca::Biblioteca(const Biblioteca & ob) {
    // nao ha ponteiros com valores lixo para limpar
    // funcionou o construtor por defeito do vector que criou
    // um vector vazio (sem ponteiros)
    // e do membro do tipo string
    
    // se houvesse ponteiros com valores lixo punham-se a nullptr
    // porque precisamos de preparar o objecto que esta a ser criado
    // para invocar o operador atribuicao que limpa a memoria velha
    // do objecto que o invoca, o primeiro membro da atribuicao
    *this = ob; // chama o operador atribuicao e copia os dados
    // de acordo com o que tem implementado: duplicando
    // a memoria dinamica que o destrutor liberta
}

Biblioteca & Biblioteca::operator=(const Biblioteca & ob) {
    // prevencao da auto-atribuicao (atribuicao de um objecto a si proprio)
    // esta feito: nesse caso => sair
    if (this == &ob) {
        return *this;
    }
    // limpeza da memoria velha do primeiro membro da atribuicao
    // libertar os livros apontados ...
    for (unsigned int i = 0; i < livros.size(); i++) {
        delete livros[i];
    }
    // esvaziar o vector que agora so aponta para memoria ja nao reservada
    livros.clear();
    
    // copiar a informacao de ob, duplicando os objectos dinamicos
   
    // copiar a informacao de ob (que refere o segundo membro da atribuicao)
    // duplicando os objectos dinamicos 
    for (unsigned int i = 0; i < ob.livros.size(); i++) {
        // duplicacao polimorfica de um livro da origem da copia
        Livro * p = ob.livros[i]->duplica();
        // acrescenta-se o duplicado  para que depois de uma atribuicao
        // o destrutor nao faca duplo delete a um mesmo objecto 
        // em memoria dinamica
        livros.push_back(p);
    }
    // nao esquecer os restantes membros
     morada = ob.morada;
     
    return *this;
}

bool Biblioteca::acrescentarLivro(Livro * livro) {
    if (livro == nullptr || pesquisa(livro->getIsbn()) != -1)
        return false;
    Livro * p = livro->duplica();
    livros.push_back(p);
     
//    livros.push_back(livro);
    return true;
}

int Biblioteca::pesquisa(long is) const {
    for (unsigned int i = 0; i < livros.size(); i++)
        if (livros[i]->getIsbn() == is){
            return i; // indice do primeiro livro com este isbn
        }
    return -1;// nao se encontra livro com este isbn
}

bool Biblioteca::remover(long is) {
    int aux = pesquisa(is);
    if (aux == -1)
        return false;
    // liberta o objecto apontado por livros[i]
    delete livros[aux];
    // nao esquecer de retirar do vector, o ponteiro 
    // que agora aponta para memoria ja libertada
    livros.erase(livros.begin() + aux);
    return true;
}

string Biblioteca::getAsString() const {
    ostringstream oss;
    oss << "\nMorada: " << morada << endl;
    for (unsigned int i = 0; i < livros.size(); i++)
        oss << livros[i]->getAsString();

    return oss.str();
}

ostream & operator<<(ostream & saida, const Biblioteca & x) {
    saida << x.getAsString();
    return saida;
}



