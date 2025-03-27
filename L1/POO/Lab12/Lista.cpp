#include"Lista.h"
#include<iostream>
using namespace std;
Lista::Lista(CmpFun ff){
	head=NULL;
	length=0;
	f=ff;

}
Lista::~Lista()
{
	
	Nod* p;
	while(head!=NULL)
	{
		p=head;
		head=head->getUrm();	
		delete p;
	}
}
int Lista::belongs(Elem e)
{
	Nod* p=head;
	while (p!=NULL)
		if (f(e,p->getElem()))
			return 1;
		else
			p=p->getUrm();
	return 0;
}
int Lista::add(Elem e)
{
	Nod* p=new Nod(e,NULL,NULL);
	Nod* c=head;
	if (head==NULL)
	{
		head=p;
		length++;
		return 1;
	}
	else
		if (!belongs(e))
	    {
			while (c->getUrm()!=NULL)
				c=c->getUrm();
			p->setUrm(NULL);
			c->setUrm(p);
			p->setPred(c);
			length++;
			return 1;
		}
	return 0;
}

int Lista::del(Elem e)
{
	Nod* p=head;
	if (!belongs(e))
		return 0;
	else
	{
		while (f(p->getElem(),e))
			p=p->getUrm();
		if (p==head)
		{
			head=p->getUrm();
			head->setPred(0);
			length--;
		}
		else
		
			if(p->getUrm()!=0)
			{
				p->getPred()->setUrm(p->getUrm());
				p->getUrm()->setPred(p->getPred());
				length--;
			}
			else
			{
				p->getPred()->setUrm(0);
				p->setPred(0);
				length--;
			}
			delete p;
			return 1;
	}
}
int Lista::getLength()
{
	return length;
}
Elem Lista::getElem(int index)
{
	int i =0;
	Nod* p=head;
	while (p!=NULL && i<index)
	{
		p=p->getUrm();
		i++;
	}
	return p->getElem();
}
Iterator* Lista::iterator()
{
	return new Iterator(this);

}

