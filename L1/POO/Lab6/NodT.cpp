#include "NodT.h"

#include <iostream>
using namespace std;


NodT::NodT()
{
	urm=pred=NULL;
	elem=NULL;

}

NodT::~NodT()
{
	urm=pred=NULL;
	delete elem;
}

NodT::NodT(Elem* _elem, NodT* _pred, NodT* _urm)
{
	elem=_elem;
	pred=_pred;
	urm=_urm;

}
Elem* NodT::getElem()
{
	return elem;
}
void NodT::setElem(Elem* _elem)
{
	elem=_elem;

}
NodT* NodT::getUrm(){
	return urm;
}
void NodT::setUrm(NodT* _urm)
{
	urm=_urm;
}
NodT* NodT::getPred(){
	return pred;
}
void NodT::setPred(NodT* _pred)
{
	pred=_pred;
}
