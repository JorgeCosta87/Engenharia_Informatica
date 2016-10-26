#include <iostream>
#include <string>
#include <vector>

using namespace std;

#include "Ponto.h"
//#include "Triangulo.h"
//#include "Rectangulo.h"


// EXERCICIO 1
//int main(){
//
//	Ponto a(1,2), b(3,4);
////        Ponto a{1,2}, b{3,4};
//	Ponto c;  // nao e possivel ter pontos sem especificar as suas coordenadas  a)
//
////	a.x=12; // respeitar o conceito de encapsulamento: aceder a membros variaveis fora da classe
//	// deve ser impedido
//
//	cout << "\n A: " << a.getAsString() << "  B: " << b.getAsString()
//		 << " distancia: " << a.calculaDistancia(b) << endl;
////
//	const Ponto c(5,6);
//////
//	cout << "\nC: " << c.getAsString() << endl; // possivel por getAsString ser const
//	//c.setX(8);// erro por c ser constante e a funcao nao ser
//	c.getY();
////
//
////	Ponto tab_d[] = { Ponto( 1, 3), Ponto( 2, 4), Ponto( 5, 7) };
//    Ponto tab_d[] = { { 1, 3}, { 2, 4}, { 5, 7} };
////	cout << "\nC: " << tab_d[2].getAsString() << endl; 
//
//	Ponto tab_e[3];
//	cout << "\nC: " << tab_e[2].getAsString() << endl; 
////
//}


// EXERCICIO 2
//int main(){
//	 //triangulo de vertices (0,0),(0,0),(0,0) : ctor por omissao de Ponto
//	Triangulo a("ABC"); 
//	cout << "\n\ncout "<< a.getAsString() << endl;
//	 //triangulo de vertices (1,2),(3,4),(5,6) 
//	Triangulo c("XYZ", 1,2,3,4,5,6);
//        Triangulo c("ZZZ", Ponto(1,2), Ponto(3,4),Ponto(5,6));
//
//	cout << "\n main() " << c.getAsString() << endl;
//}
//
// EXERCICIO 3
int main(){
	Rectangulo a(1, 2 , 4, 2);
////	cout << "\n\n1: " << a.getAsString() << endl;
//	Rectangulo b(1, 2 , 44, 22);
//	cout << "\n\n2: " <<  b.getAsString() << endl;  // a)
//
	Ponto p2(4,5);
	a.setCanto(p2);
//
//	cout << "\n\nA: "<< a.getAsString() << endl;
//	cout << "\n\nB: " << b.getAsString() << endl;
//
//	//cout << a.getCanto().getAsString() << endl;
//
//
//	//const Rectangulo d(1, 2 , 4, 2);
//	//d.getLargura();
//	//d.getN();
//	//d.setAltura(5);
}
