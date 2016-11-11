/* 
 * File:   main.cpp
 * Author: Admin2
 *
 * Created on 12 de Outubro de 2015, 14:45
 */

#include <iostream>
#include <string>
#include <cstdlib>

#include "MSG.h"
using namespace std;

/*
 * 
 */

void teste_g(){
	MSG aux('y');
}

void teste_h(MSG z){
	MSG aux('y');
}
void teste_l(MSG & z){
//	MSG aux('y');
    
}

MSG teste_m(){
	MSG aux('y'), aux2('z');
        if(rand() > 200)
            return aux;
        else return aux2;
        
//        MSG aux('y');
//        return aux;
}

MSG & teste_n(MSG & aux, MSG & aux2){
	if(0)
            return aux;
        else return aux2;
}

int main(){
	MSG a('a');
	MSG b;
	//MSG &c = b; //valido, c fica um referenia de b, nada é criado
//	MSG d = b;  // equivalente a MSG d(b); //construtor por copia é chamado.
//	a = b; // copia o conteudo de b para a
//	MSG mat[] = { 'M', 'N'}; //Cria dois objectos 
        //mat[1].getAsString();
//	MSG mat[] = { a, b}; // construtor por copia. Existem 2 objectos a e dois objectos b no programa
//      MSG *mat[] = { &a, &b}; // Passado por referencia
//        cout << mat[1].getAsString();
//	MSG mat[4] = { MSG('M'), MSG('N')}; // or MSG mat[4] = { 'M', 'N'};
//	MSG mat[] = { MSG(), MSG()};
//	MSG mat[2];
        
////alinha G
//            cout << "\n chamada de teste_g\n";
//            teste_g();
//            cout << "\n fim de teste_g\n";
//            cout << "\n chamada de teste_g\n";
//            teste_g();
//            cout << "\n fim de teste_g\n";


////alinha H
//        cout << "\n*****vai chamar teste_h\n";
//	teste_h(b);  // chama ccop
//        teste_h(MSG('g')); // nao chama ccop
//	cout << "\n*****retornou de teste_h\n";
//	cout << "\n*****vai chamar teste_h\n";
//	teste_h(b);
//	cout << "\n*****retornou de teste_h\n";
        
////alinha L        
//	cout << "\n passagem por referencia\n";
//	teste_l(b);
//	cout << "\n FIM\n";

        
//alinha M Para devolver cria-se uma nova copia ? e depis apaga ?
//	cout << "\nAntes de chamar teste_m() \n";
//	a = teste_m(); // cria uma copia do returno e copia o seu onteudo para a, depois essa copia termina
//	cout << "\nDepois de chamar teste_m() \n";

//alinha N Rever
	cout << "\nAntes de chamar teste_n() \n";
	b = teste_n(a, b);
	cout << "\nDepois de chamar teste_n() \n";
	teste_n(a, b) = a;
	cout << "\nDepois de chamar teste_n() outra vez\n";
        
        
        return 0;
}

