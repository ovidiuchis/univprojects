#ifndef CLOG_H
#define CLOG_H
#include"Lista.h"
class Catalog:public Object
{
	char* titlu_disciplina;
	Lista* R;
public:
	Catalog();
	~Catalog();
	char* getTitluD();
	int equals(Object*);
	char * toString(){return 0;};
	void setTitluD(char* t);
	void setLista(Lista* l);
	Lista* getLista();
};
#endif
