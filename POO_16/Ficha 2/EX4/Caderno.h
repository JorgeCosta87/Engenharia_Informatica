/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   Caderno.h
 * Author: costa
 *
 * Created on 4 de Outubro de 2016, 23:04
 */

#ifndef CADERNO_H
#define CADERNO_H

#include <string>

using namespace std;

class Caderno{
    string marca;
    string cor;
    int n_folhas;
    string tamanho;
     
 public:
    Caderno(const string & marca, const string cor, int n_folhas, const string tamanho);
    string ObterMarca() const;
    string ObterCor();
    int ObterNFolhas();
    string ObterTamanho();
    void SetMarca(string marca);
    void SetCor(string cor);
    void SetNFolhas(int n_folhas);
    void SetTamanho(string tamanho);

 };

#endif /* CADERNO_H */

