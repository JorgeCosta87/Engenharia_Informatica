
#include <cstdlib>
#include<string>
#include<sstream>
#include<iostream>
using namespace std;

#include "Peixe.h"
#include "Aquario.h"

/*
 * 
 */
int main() {

    Peixe a("Robalo", "branco");
    Peixe b("Pescada");
    Peixe c("Salmao");
    
//    cout << "a: " << a.getAsString() << endl;
//    cout << "b: " << b.getAsString() << endl;
    
    Aquario * aq1 = new Aquario;
   
    aq1->addPeixe( &a);
    aq1->addPeixe( &b);
    aq1->addPeixe( &c);
    
    cout << aq1->getAsString() << endl;
   
    aq1->alimentar(20);

//    cout << aq1->getAsString() << endl;
//    aq1.alimentar(30);
//    cout << aq1.getAsString() << endl;
//    cout << aq1.getAsString() << endl;
    
    Aquario * aq2 = new Aquario;
    aq2->addPeixe( &a);
    aq2->addPeixe( &a);
    aq2->addPeixe( &a);
    
    cout << aq2->getAsString() << endl;
    
    *aq2 = *aq1;
    
    delete aq1;
    cout << " aq1:\n";
    cout << " aq2:\n";
    cout << aq2->getAsString() << endl;
    
    Aquario * aq3 = new Aquario (*aq2);
    delete aq2;
    cout << aq3->getAsString() << endl; 
    delete aq3;
    return 0;
}

