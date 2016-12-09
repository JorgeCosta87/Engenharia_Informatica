#include<sstream>
#include<string>

#include "Imovel.h"
#include "Imobiliaria.h"
#include "Apartamento.h"
#include "Loja.h"

//Imobiliaria::~Imobiliaria(){
//	for(unsigned int i = 0; i < imoveis.size() ; i++)
//		delete imoveis[i];
//
//}
//void Imobiliaria::swap(Imobiliaria & ob){
//	string aux = nome;
//	nome = ob.nome;
//	ob.nome = aux;
//
//	vector<Imovel *> v = imoveis;
//	imoveis = ob.imoveis;
//	ob.imoveis = v;
//}
//Imobiliaria & Imobiliaria::operator=(const Imobiliaria & ob){
//	if(this != &ob){
//		Imobiliaria aux(ob);
//		swap(aux);
//	}
//	return *this;
//}
//
//Imobiliaria::Imobiliaria( const Imobiliaria & ob):nome(ob.nome){
//	for( unsigned i = 0 ; i < ob.imoveis.size() ; i++)
//		imoveis.push_back(ob.imoveis[i]->duplica());
//}

int Imobiliaria::pesquisa( string codigo) const{
	for(unsigned int i = 0; i < imoveis.size() ; i++)
		if (codigo == imoveis[i]->getCodigo())
			return i;
	return -1;
}
string Imobiliaria::getAsString() const{
	ostringstream oss;
	oss << "Imobiliaria " << nome << endl;
	for(unsigned int i = 0; i < imoveis.size() ; i++)
		oss << imoveis[i]->getAsString() << endl;
	return oss.str();
}

void Imobiliaria::acrescentaImovel(Imovel * imovel){
    if(imovel != nullptr)
	imoveis.push_back( imovel);
}

string Imobiliaria::getAsString( string codigo) const{
	int qual = pesquisa(codigo);
	if(qual == -1)
		return "Codigo nao existente";

	return imoveis[qual]->getAsString();
}

bool Imobiliaria::setPreco(string codigo, float preco){
	if(preco < 0)
		return false;
	int qual = pesquisa(codigo);
	if(qual == -1)
		return false;
	imoveis[qual]->setPreco(preco);
	return true;
}
float Imobiliaria::getPreco(string codigo)const{
	int qual = pesquisa(codigo);
	if(qual == -1)
		return 0;
	return imoveis[qual]->getPreco();
}

bool Imobiliaria::remove(string codigo){
	int qual = pesquisa(codigo);
	if(qual == -1)
		return false;
//	delete imoveis[qual];
	imoveis.erase(imoveis.begin() + qual);
	return true;
}

ostream & operator<<(ostream & saida, const Imobiliaria & x){
	saida << x.getAsString();
	return saida;
}