
#ifndef LIVRO_H
#define LIVRO_H


#include <string>

using namespace std;

class Livro{
	string titulo;
	string autor;
	long isbn;	
public:
	Livro(string t, string a, long i);
	virtual ~Livro(){}
        
	void setTitulo( string s);
	void setAutor( string a);
	void setIsbn(long i);
	string getTitulo() const;
	string getAutor() const;
	long getIsbn() const;

	virtual string getAsString() const;

	virtual Livro * duplica()const;
};
bool operator==( const Livro & ob1, const Livro & ob2);

ostream & operator<<(ostream & saida, const Livro & x);

#endif