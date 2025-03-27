#include"Nod.h"
typedef void (*CpyFun)(Elem,Elem);

class Coada{
	Nod* head;
	Nod* tale;
	int length;
	CpyFun f;
public:
	Coada(CpyFun);
	~Coada();
	int getLength(){return length;};
	Coada& operator+=(Elem);//Add
	Coada& operator-=(Elem);//Extract
	int operator!();//coada vida
	
};