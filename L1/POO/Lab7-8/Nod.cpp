#include "Nod.h"

#include <iostream>
using namespace std;


Nod::Nod()
{
	urm=pred=NULL;
	elem=NULL;

}

Nod::~Nod()
{
	urm=pred=NULL;
	delete elem;
}

Nod::Nod(Elem _elem, Nod* _pred, Nod* _urm)
{
	elem=_elem;
	pred=_pred;
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
Nod* Nod::getPred(){
	return pred;
}
void Nod::setPred(Nod* _pred)
{
	pred=_pred;
}
