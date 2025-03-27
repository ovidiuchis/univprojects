#include "Nod.h"

#include <iostream>
using namespace std;


Nod::Nod()
{
	urm=NULL;
	elem=NULL;

}

Nod::~Nod()
{
	urm=NULL;
	delete elem;
}

Nod::Nod(Elem _elem,Nod* _urm)
{
	elem=_elem;
	urm=_urm;

}
Elem Nod::getElem()
{
	return elem;
}
void Nod::setElem(Elem _elem)
{
	elem=_elem;

}
Nod* Nod::getUrm(){
	return urm;
}
void Nod::setUrm(Nod* _urm)
{
	urm=_urm;
}
