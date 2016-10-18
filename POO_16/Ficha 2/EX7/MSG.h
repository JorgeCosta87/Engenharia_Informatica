/* 
 * File:   MSG.h
 * Author: Admin2
 *
 * Created on 12 de Outubro de 2015, 14:47
 */

#ifndef MSG_H
#define	MSG_H

#include <string>

using namespace std;

class MSG {
	static int contador;
	char letra;
	int num;
//	MSG(const MSG & ob);
public:
	MSG(char c = 'X');
//        MSG(char c);
	MSG(const MSG & ob);
//        MSG(const MSG && ob);
	~MSG();
	string getAsString()const;
	void setNum(int n);
};

#endif	/* MSG_H */
