#ifndef INTERACCAO_H
#define INTERACCAO_H

#include <string>
#include <vector>
using namespace std;

class Ginasio;

class Interaccao {
public:
    static unsigned int lerUInt(string msg);
    static unsigned int escolheOpcao(vector<string> opcoes);
    static void menu(Ginasio & b);
    static string lerNome(string pergunta);
};

#endif