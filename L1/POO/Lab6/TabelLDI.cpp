#include "TabelLDI.h"

#include<iostream>
using namespace std;

TabelLDI::TabelLDI(){
	length=0;
	cap_tabel=NULL;
}


TabelLDI::~TabelLDI()
{
	NodT* p;
	while(cap_tabel!=NULL)
	{
		p=cap_tabel;
		cap_tabel=cap_tabel->getUrm();
		delete p;
	}
}
int TabelLDI::Cauta(Elem e)
{
	NodT* p;
	for (p=cap_tabel;p!=NULL;p=p->getUrm())
		if (e==*(p->getElem()))
			return 1;
	return 0;
}
void TabelLDI::Insert(Elem e)
{
	NodT* p=new NodT(new Elem(e),NULL,NULL);
	NodT* c=cap_tabel;
	if (cap_tabel==NULL)
	{
		cap_tabel=p;
		length++;
	}
	else
		if (!Cauta(e))
	    {
			while (c->getUrm()!=NULL)
				c=c->getUrm();
			p->setUrm(NULL);
			c->setUrm(p);
			p->setPred(c);
			length++;
		}
}
NodT* TabelLDI::getCTab()
{
	return cap_tabel;
}
int TabelLDI::GetLength()
{
	return this->length;
}
void TabelLDI::Elimina(Elem e)
{
	NodT* aux=new NodT;
	if (*(cap_tabel->getElem())==e)
	{
		aux=cap_tabel;
		cap_tabel=cap_tabel->getUrm();
		delete aux;
		length--;
	}
	else
	{
		aux=cap_tabel;
		while (aux!=NULL)
		{
			if ((aux->getUrm()==NULL) && (*(aux->getElem())==e))
			{
					(aux->getPred())->setUrm(NULL);	
					delete aux;
					length--;
					break;
			}
			else
				if (*(aux->getElem())==e)
				{
					(aux->getPred())->setUrm(aux->getUrm());
					(aux->getUrm())->setPred(aux->getPred());
					delete aux;
					length--;
					break;
				}					
			aux=aux->getUrm();
		}
	}
}
TabelLDI* TabelLDI::ReuniuneMultimi(TabelLDI &p)
{
	TabelLDI* rez=new TabelLDI;
	NodT* w=new NodT;
	for(w=cap_tabel;w!=NULL;w=w->getUrm())
		rez->Insert(*(w->getElem()));
	for(w=p.cap_tabel;w!=NULL;w=w->getUrm())
		rez->Insert(*(w->getElem()));
	return rez;
}
TabelLDI* TabelLDI::IntersectieMultimi(TabelLDI &p)
{
	TabelLDI* rez=new TabelLDI;
	NodT* w=new NodT;
	for (w=cap_tabel;w!=NULL;w=w->getUrm())
		if (this->Cauta(*w->getElem()) && p.Cauta(*w->getElem()))
			rez->Insert(*w->getElem());
	for (w=p.cap_tabel;w!=NULL;w=w->getUrm())
		if (this->Cauta(*w->getElem()) && p.Cauta(*w->getElem()))
			rez->Insert(*w->getElem());
	return rez;
}