#include <iostream>
#include <sstream>

using namespace std;

#include "Prego.h"


Prego::Prego(int a, int b): x(a), y(b)  {
		cout << "construindo prego em " << x << "," << y << "\n";
}
Prego::~Prego() {
		cout << "destruindo prego em " << x << "," << y << "\n";
}
void Prego::mudaDeSitio(int a, int b) {
		x = a; y = b;
}
string Prego::getAsString()const{
	ostringstream oss;
	oss << "Prego: ( " << x << "," << y << ") ";
	return oss.str();
}
