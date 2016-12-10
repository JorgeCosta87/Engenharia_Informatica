#include <sstream>
using namespace std;

#include "Biblioteca.h"
#include "Interaccao.h"
#include "Policial.h"

int main() {

    Biblioteca b("Quinta das flores - Coimbra");

    Interaccao::menu(b);

//    Biblioteca * p2 = new Biblioteca(b); // construcao por copia
//    Biblioteca * p3 = new Biblioteca(*p2);
//    delete p2;
//    cout << *p3;
//    
//    *p3 = b; // atribuicao
//
//    delete p3;
//   
//    cout << b;
//
//    cout << "Fim  \n  b2: \n" << b2 << "\n b3:\n" << b3 << endl;
//



    //Livro * p = new Livro("livro da classe base", "aaa", 1);

    //cout << p->getAsString() << endl;

    //Livro * pol = new Policial("livro policial", "bbb", 2, "Poirot", 2);

    //cout << "\n------\n" << pol->getAsString() << endl;

    //
    //Livro livro("livro da classe base", "aaa", 1);
    //Policial p(livro, "Poirot", 2);

    //cout << p << endl;

}