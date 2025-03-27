#include"Nod.h"
typedef int (*CmpFun)(Elem,Elem);
//typedef 
class Iterator;

class Lista
{
	int length;
	Nod* head;
	CmpFun f;
public:
	Lista(CmpFun _f);
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


