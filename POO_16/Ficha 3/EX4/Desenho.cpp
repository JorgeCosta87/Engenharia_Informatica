/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   Desenho.cpp
 * Author: costa
 * 
 * Created on 25 de Outubro de 2016, 22:44
 */


#include <sstream>
#include <string>
using namespace std;

#include "Desenho.h"
#include "Rectangulo.h"



Desenho::Desenho(string nome1) : nome(nome1) {
    //nome = nome1;
}

void Desenho::acrescentar(int x, int y, int larg, int alt){
    //Rectagulo rect(x,y,larg,alt); criar um rectangulo e este morre no final da função
    //rectangulos-push_back(rect) adiciona uma copia de rect ao vector, que a original morre no final da função
    rectangulos.push_back(Rectangulo(x,y,larg,alt));
}

vector<Rectangulo> Desenho::pesquisarRectMesmoCanto( const Ponto & a)const{
    vector<Rectangulo>v;
    for(unsigned int i = 0 ; i < rectangulos.size() ; i++){
        if(a.getX() == rectangulos[i].getCanto().getX()
                   && a.getY() == rectangulos[i].getCAnto().getY()){
            v.push_back(rectangulos[i]);
        }
    }
    return v;
}

int Desenho::somaDasAreas() const{
    int soma = 0;
    for( vector<Rectangulo>::const_iterator it = rectangulos.begin(); it != rectangulos.end(); ++it){
        soma += it->calculaArea();
    }
    
//    for(auto it = rectangulos.begin(); it != rectangulos.end(); ++it){
//        soma += it->calculaArea();
//    }
//    
//    for const auto & elem:rectangulos){ 
//        soma += elem.calculaArea();
//    }
//    
    return soma;
}

bool Desenho::eliminarUm(int qual){
    if( qual < 0 || qual >= rectangulos.size())
        return false;
    rectangulos.erase(rectangulos.begin() + qual);
    return true;
}

int Desenho::somaDasAreas() const{
    int soma = 0;
    for(vector<Rectangulo>::const_iterator it = rectangulos.begin();
            it != rectangulos.end(); ++it)
}

int Desenho::eliminarRectAreaSup(int areaLimite){
    int nElim = 0;
    for(vector<Rectangulo>::iterator it = rectangulos.begin();
            it!= rectangulos.end(); ){ //aqui nao tem it++ 
        if(it->calcularArea() > areaLimite) {
            it = rectangulos.erase(it); //importante que it recebe o retorno da função
            //iterator poiting to the new locatiopn of the elment that followed
            //the last elemnt erased by the function call.
            //This is the container end if the operation erased the last elemnt in the
            ++nElim;
        }else{
            ++it;
        }
    }
    return nElim;
    }

string Desenho::getAsString(){
    ostringstream oss;
    oss << " nome " << nome 
            << " tem " << rectangulos.size() << " rectangulos \n";
    
    
    //for (unsigned int i = 0 ; i < rectangulos.size() ; i++){
    oss << rectangulos[i].getAsString() <<endl
    }
    
    for (vector<Rectangulo>::const_iterator it = rectangulos.begin();
            it != rectangulos.end() ; ++it) {
        oss << it->getAsString() << endl;
    }
    
    return oss.sr();
}

Desenho::Desenho(const Desenho& orig) {
}

Desenho::~Desenho() {
}