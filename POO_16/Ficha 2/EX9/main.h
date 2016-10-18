/* 
 * File:   main.h
 * Author: Admin2
 *
 * Created on 11 de Outubro de 2016, 10:45
 */

#ifndef MAIN_H
#define	MAIN_H

#include <string>
#include "TeleVector.h"
class Televector;

Televector lerDadosTelevisao();
int escolheOpcao( std::string s[], int n);
int lerInt( std::string msg);
long lerLong( std::string msg);


#endif	/* MAIN_H */

