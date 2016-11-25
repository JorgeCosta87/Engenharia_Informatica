
#include <string>
#include <iostream>
using namespace std;

#include "Pessoa.h"
#include "Clube.h"

int main() {
	Pessoa a("Aaa", 1, 111), b("Bbb", 2, 222); // de acordo com o que estiver na classe Pessoa
	Pessoa c("Ccc", 3, 333), d("Ddd", 4, 444); 
	Clube * clube1 = new Clube(50);
	clube1->setMembroDoClube( &a, 0); // Pessoa a passa a pertencer ser membro do clube
	clube1->setMembroDoClube( &b, 1); // Idem Pessoa b

	cout << "Clube1: " << clube1->getAsString();

	Clube * clube2 = new Clube(10);
	clube2->setMembroDoClube( &a, 0);
	clube2->setMembroDoClube( &c, 1);
	clube2->setMembroDoClube( &d, 2);

	cout << "Clube2: " << clube2->getAsString();

	*clube1 = *clube2;
        delete clube2;
	cout << "Clube1 depois de =: " << clube1->getAsString();


	Clube clube3(*clube1);
	cout << "Clube3 const por copia de clube1: " << clube3.getAsString();
        delete clube1;
	cout << "Clube3 const por copia de clube2 depois de delete: " << clube3.getAsString();
	return 0;
}