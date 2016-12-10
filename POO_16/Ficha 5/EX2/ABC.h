#ifndef ABC_H
#define ABC_H

#include <cstring>
#include <iostream>
using namespace std;

class ABC {
    char * p;
public:
    ABC(char * s);
    
    ~ABC();
    ABC( const ABC & ob);
    ABC & operator=(const ABC & ob);
    
    const char * getConteudo() const { return p; }
};


#endif
