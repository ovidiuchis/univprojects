#ifndef NOD_H
#define NOD_H
#include"Object.h"

class Nod  
{
	Object* elem;
	Nod* urm;
	Nod* pred;
public:
	Nod();
	Nod(Object*, Nod*, Nod*);
	Object* getElem();
	void setElem(Object*);
	Nod* getUrm();
	void setUrm(Nod*);
	Nod* getPred();
	void setPred(Nod*);
	~Nod();

};
#endif