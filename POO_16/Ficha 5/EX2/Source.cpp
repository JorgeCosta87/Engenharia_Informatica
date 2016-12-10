
#include <iostream>
#include <cstdlib>
using namespace std;


#include "ABC.h"

// b)
//void gastaMem() {
//	ABC temp("Texto tempor�rio que ocupa espaco");
//	 //Etc. Tanto faz.
//}
//int main() {
//	for (unsigned int i=0; i<100000000; i++)
//		gastaMem();
//	cout << " o programa ja deve terminado por falta de mem�ria ";
//	return 0;
//}
// c)
void func(ABC x) {
  // tanto faz
}
void func() {
   ABC a("aaa");
   ABC b("bbb");
   a = b;
}
int main() {
   ABC y("ola");
   func(y);
   cout << y.getConteudo() << endl;
   func(y);
   cout << y.getConteudo() << endl;
   cout << "o programa ja deve ter rebentado";
   func();
   cout << "o programa ja deve ter rebentado novamente";
   return 0;
}
