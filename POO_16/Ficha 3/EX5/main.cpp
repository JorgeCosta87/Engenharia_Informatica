#include <iostream>
#include <string>
#include <vector>

using namespace std;
#include "Prego.h"
#include "Aviso.h"

int main(){
	Prego p(1,2);
	Aviso a("abc  def", &p);
	Aviso b("xyz  zzz", &p);

	cout << "A: " << a.getAsString() << endl;
	cout << "B: " << b.getAsString() << endl;

	p.mudaDeSitio(9,9);
	
	cout << "Depois de mudar de sitio: \n";
	cout << "A: " << a.getAsString() << endl;
	cout << "B: " << b.getAsString() << endl;

}