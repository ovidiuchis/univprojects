#ifndef LISTA_H
#define LISTA_H
#include"Nod.h"
typedef int (*CmpFun)(Object*,Object*);

class Iterator;

class Lista
{
	int length;
	Nod* head;
	CmpFun f;
public:
	Lista(CmpFun _f);
	int add(Object* e);
	int del(Object* e);
	int belongs(Object* e);
	int getLength();
	Object* getElem(int index);
	Iterator* iterator();
	~Lista();
};
class Iterator 
{
	Lista* l;
	int current;
public:
	Iterator(Lista* l);
	Object* getElem();
	int hasNext();
	void next();
	void setToFirst();
	~Iterator();
};
#endif