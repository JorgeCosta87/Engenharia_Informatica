#ifndef IMOVEL_H
#define IMOVEL_H

#include<string>
using namespace std;

class Imovel {
    static int ordem;
    string codigo;
    float preco;
    float area;
protected:
    void setCodigo(string c) {
        codigo = c;
    }
public:
    Imovel(float p, float a);
    
    string getCodigo()const {
        return codigo;
    }
    void setPreco(float p) {
        preco = p;
    }

    float getPreco()const {
        return preco;
    }

    float getArea() const {
        return area;
    }

    static int getOrdem() {
        return ordem;
    }

    virtual ~Imovel() {
    }
    virtual string getAsString()const;
    //virtual Imovel * duplica()const{ return new Imovel(*this);}
};
ostream & operator<<(ostream & saida, const Imovel & x);
#endif