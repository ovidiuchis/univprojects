#ifndef LISTA_H
#define LISTA_H
#include"Nod.h"
#include"Shape.h"
typedef Shape* Elem;
typedef int (*CmpFun)(Elem,Elem);

class Iterator;

class Lista
{
	int length;
	Nod* head;
	CmpFun f;
public:
	Lista(CmpFun);
	int add(Elem e);
	int del(Elem e);
	int belongs(Elem e);
	int getLength();
	Elem getElem(int index);
	Iterator* iterator();
	~Lista();
};
class Iterator 
{
	Lista* l;
	int current;
public:
	Iterator(Lista* l);
	Elem getElem();
	int hasNext();
	void next();
	void setToFirst();
	~Iterator();
};
#endif