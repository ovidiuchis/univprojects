#ifndef REZ_H
#define REZ_H
#include"Object.h"
class Rezultat:public Object
{ 
private: 
	int matricol_student; 
	int rezultat; 
public:
	Rezultat();
	void setMatricolS(int n);
	void setRezultat(int m);
	int getMatricolS();
	int getRezultat();
	int equals(Object*);
	char* toString();
	~Rezultat();
};
#endif