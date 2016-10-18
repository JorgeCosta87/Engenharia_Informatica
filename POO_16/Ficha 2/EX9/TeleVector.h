#ifndef TELEVECTOR_H
#define	TELEVECTOR_H

#include <string>
#include <vector>

using namespace std;

class TeleVector{ 
	vector<string> canais;
	bool ligada;
	int volume; // de 0 (min) a 10 (max)
	int canal; // (o indice do elemento correspondente do array canais) +1

	// o conjunto de canais definido na construcao nao se altera a partir do exterior da classe	
	void setCanais(string canais0[], int n);
public:
	TeleVector(string canais0[], int n);

	bool isLigada()const; // função consulta porque é de consulta
	void ligar();
	void desligar();

	string getAsString()const;

	void aumentaVolume();
	void diminuiVolume();

	void mudaDeCanal(int c);

	//const string & getCanal( int ind)const{
	//	return canais[ind];
	//}

	const string & getCanal( int ind)const{
		return canais[ind];
	}

};



#endif	/* TELEVECTOR_H */