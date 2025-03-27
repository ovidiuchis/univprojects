#ifndef NOD_H
#define NOD_H
#include"Shape.h"
class Nod  
{
	Shape* elem;
	Nod* urm;
	Nod* pred;
public:
	Nod();
	Nod(Shape*, Nod*, Nod*);
	Shape* getElem();
	void setElem(Shape*);
	Nod* getUrm();
	void setUrm(Nod*);
	Nod* getPred();
	void setPred(Nod*);
	~Nod();

};
#endif