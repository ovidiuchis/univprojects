#ifndef CP_H
#define CP_H

#include<iostream>
using namespace std;

template <class T,int(*CmpFun)(T,T)> class CoadaPr
{
private:
	class Nod{
	private:
		Nod* next;
		Nod* prev;
		T elem;
	public:
		Nod(){next=prev=NULL;};
		Nod(T e,Nod* p,Nod* n){
			elem=e;
			next=n;
			prev=p;
		};
		~Nod(){
			next=prev=NULL;};
		void setNext(Nod *u){
			next=u;};
		Nod* getNext(){
			return next;};
		void setPrev(Nod* p){prev=p;}
		Nod* getPrev(){return prev;};
		void setElem(T e){
			elem=e;};
		T getElem(){
			return elem;};
	};
		Nod* head;
		Nod* tale;
		int length;
public:
		CoadaPr(){
		head=tale=NULL;
		length=0;};
		~CoadaPr(){
			Nod* p;
			while(head!=NULL)
			{
				p=head;
				head=head->getNext();
				delete p;
			}
		};
		int getLength(){return length;};

		int eVida(){return length==0;};

		void Add(T e){
			Nod* p=new Nod(e,NULL,NULL);
			if (length==0)
			{
				head=tale=p;
				length++;
			}
			else 
				if(length==1)//daca exista un singur elem in coada verificam daca va fi depus in fata sau in dupa acest el
				{
					if (CmpFun(e,head->getElem())<0)
					{
						head=p;
						head->setNext(tale);
						tale->setPrev(head);
					}
					else
					{
						tale=p;
						tale->setPrev(head);
						head->setNext(tale);
					}
					length++;
				}
				else//nici 1 nici 0
				{
					if (CmpFun(e,head->getElem())<0)
					{
						head->setPrev(p);
						p->setNext(head);
						head=p;
					}
					else
						if (CmpFun(e,tale->getElem())>0)
						{
							tale->setNext(p);
							p->setPrev(tale);
							tale=p;
						}
						else// inserare intre elemente
						{
							Nod* crt=head;
							while(CmpFun(e,crt->getElem())>0)
								crt=crt->getNext();
							p->setNext(crt);
							p->setPrev(crt->getPrev());
							(crt->getPrev())->setNext(p);
							crt->setPrev(p);
						}
				length++;
				}


		};
		T Peek(int index){
			int i=0;
			Nod* p=head;
			while (p!=NULL && i<index)
			{
				p=p->getNext();
				i++;
			}
			return p->getElem();
		}
	
			T Extract(){
				Nod*p =new Nod;
				p=head;
				head=head->getNext();
				length--;
				return p->getElem();

			}
};
#endif