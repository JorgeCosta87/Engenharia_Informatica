#ifndef PREGO_H
#define PREGO_H
class Prego{
	int x,y;
public:
	Prego(int a, int b);
	~Prego();
	void mudaDeSitio(int a, int b);
	string getAsString()const;
	int getX()const{ return x;}
	int getY()const{ return y;}
};

#endif