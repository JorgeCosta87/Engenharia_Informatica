#ifndef PESSOA_H
#define PESSOA_H

#include <string>

using namespace std;

class Pessoa {
    string nome;
    long bi;
    long nif;
    
    void setBi(long b);
public:
    Pessoa()=delete;
    Pessoa(const string & s, long b, long n);
    string getNome()const;
    void setNome(const string & n);
    long getBi()const;
    long getNif()const;
    void setNif(long t);
    string getAsString()const;

};

#endif /* PESSOA_H */

