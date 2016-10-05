/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   Caderno.cpp
 * Author: costa
 * 
 * Created on 4 de Outubro de 2016, 23:04
 */

#include "Caderno.h"


#include <cstdlib>
#include <string>
#include <sstream>
#include "Caderno.h"

using namespace std;
 
 
Caderno::Caderno(const string & marca, string cor, int n_folhas, float tamanho){
    this->marca = marca;
    this->cor  = cor;
    this->n_folhas = n_folhas;
    this->tamanho = tamanho;
}

 string Caderno::ObterMarca() const{
     return this->marca;
}
 
 string Caderno::ObterCor(){
     return this->cor;
}
 
 int Caderno::ObterNFolhas(){
     return this->n_folhas;
 }
 
 float Caderno::ObterTamanho(){
     return this->tamanho;
 }
 
 void Caderno::SetMarca(string marca){
     this->marca = marca;
 }
 
 void Caderno::SetCor(string cor){
     this->cor = cor;
 } 
  
 void Caderno::SetNFolhas(int n_folhas){
     this->n_folhas = n_folhas;
 }
 
 void Caderno::SetTamanho(float tamanho){
     this->tamanho = tamanho;
 }
 