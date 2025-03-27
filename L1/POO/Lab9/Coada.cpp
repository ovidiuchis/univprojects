#include"Coada.h"
#include<iostream>
using namespace std;

Coada::Coada(CpyFun _f)
{
	head=tale=NULL;
	length=0;
	f=_f;
}
Coada::~Coada()
{
	Nod* p;
	while(head!=NULL)
	{
		p=head;
		head=head->getUrm();	
		delete p;
	}
}
Coada& Coada::operator +=(Elem e)
{
	Nod* p=new Nod(e,NULL);
	if (head==NULL)
	{
		head=tale=p;
		length++;
	}
	else
	{
		tale->setUrm(p);
		tale=p;
		length++;
	}
	return *this;
}
int Coada::operator!()
{
	return !(length==0);
}

Coada& Coada::operator-=(Elem e)
{
	Nod* p=new Nod;
	p=head;
	head=head->getUrm();
	f(e,p->getElem());	
	delete p;
	length--;
	return *(this);
}
	
