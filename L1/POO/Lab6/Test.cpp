#include "TabelLDI.h"

#include <conio.h>
#include <iostream>
using namespace std;

void CreareMultime(TabelLDI *t)
{
	int nr;
	cout<<"Introduceti element: ";
	cin>>nr;
	while (nr!=0)
	{
		t->Insert(nr);
		cout<<"Introduceti element: ";
		cin>>nr;
	}
}
void AfisareMultime (TabelLDI* t)
{
	NodT *p=new NodT;
	for (p=t->getCTab();p!=NULL;p=p->getUrm())
		cout<<*p->getElem()<<" ";
}

void  main()
{
	TabelLDI* t=new TabelLDI;
	int w=-1,el;
	while (w!=27)
	{
		cout<<"(1) Creare unei Multimi "<<endl;
		cout<<"(2) Afisarea elementelor Multimii "<<endl;
		cout<<"(3) Verificarea apartenentei la multime "<<endl;
		cout<<"(4) Adaugarea unui element in multime"<<endl;
		cout<<"(5) Eliminarea unui element din multime "<<endl;
		cout<<"(6) Afisare cardinal multime "<<endl;
		cout<<"(7) Reuniunea a doua multimi "<<endl;
		cout<<"(8) Intersectia a doua multimi "<<endl;
		cout<<" (Esc) pentru iesire"<<endl;
		cout<<endl;
		w=_getch();
		switch (w) 
		{
		case 49:{
				cout<<"Introduceti elementul '0' pentru oprire "<<endl;
				CreareMultime(t);
				cout<<endl;
				break;
				  }
		case 50:{
			if (t->GetLength()==0)
				cout<<"Multimeaa este vida"<<endl;
			else
				AfisareMultime(t);
				cout<<endl;
				break;
				  }
		case 51:{
			cout<<"Dati elementul: ";
			cin>>el;
			if (t->Cauta(el))
				cout<<"Elementul "<<el<<" apartine Multimii";
			else
				cout<<"Elementul "<<el<<" nu apartine Multimii";	
			cout<<endl;
			break;
				  }
		case 52:{
			cout<<"Dati elementul: ";
			cin>>el;
			t->Insert(el);	
			break;
				  }
		case 53:{
			cout<<"Dati elementul: ";
			cin>>el;
			t->Elimina(el);	
			cout<<endl;
			break;
				}
		case 54:{
			cout<<"Cardinalul multii este: "<<t->GetLength();		
			cout<<endl;
			break;
				  }
		case 55:{
			cout<<"Introduceti elementele Multimii a doua: "<<endl;
			TabelLDI* p=new TabelLDI;
			CreareMultime(p);
			cout<<endl<<"Multimea Reuniune : ";
			AfisareMultime(t->ReuniuneMultimi(*p));
			delete p;
			cout<<endl;
			break;
				  }
		case 56:{
			cout<<"Introduceti elementele Multimii a doua: "<<endl;
			TabelLDI* p=new TabelLDI;
			CreareMultime(p);
			cout<<endl<<"Multimea Intersectie : ";
			AfisareMultime(t->IntersectieMultimi(*p));
			cout<<endl;
			delete p;
			break;
			  }
		}
	}
	delete t;
}
