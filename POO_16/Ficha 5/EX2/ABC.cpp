#include "ABC.h"

ABC::ABC(char * s) {
    p = new char[strlen(s) + 1];
    strcpy(p, s);
    cout << "Constr " << p << endl;
}

ABC::~ABC() {
    cout << "Destr " << p << endl;
    delete [] p;
}
//ABC::ABC( const ABC & ob){
//	if(ob.p == nullptr || strlen(ob.p) == 0){
//		p = nullptr;
//		return;
//	}
//	p = new char[strlen(ob.p) + 1];
//	if(p != nullptr){
//		strcpy(p, ob.p);
//	}
//        cout << "Constr Cop " << p << endl;
//}

ABC::ABC(const ABC & ob) {
    p = nullptr;
    *this = ob;
    cout << "CCop " << (p != nullptr ? p : "nullptr") << " = " << ob.p << endl;
}

ABC & ABC::operator=(const ABC & ob) {
    if (this != &ob) { // prevencao da auto-atribuicao         
        delete []p;
        if (ob.p == nullptr || strlen(ob.p) == 0) {
            p = nullptr;
            return *this;
        }
        p = new char[strlen(ob.p) + 1];
        if (p != nullptr) {
            strcpy(p, ob.p);
        }
    }
    cout << "Op= " << (p != nullptr ? p : "nullptr") << " = " << ob.p << endl;
    return *this;
}
