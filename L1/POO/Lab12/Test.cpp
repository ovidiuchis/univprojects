#include"Patrat.h"
#include"Cerc.h"
#include"Lista.h"
#include<math.h>
#include<conio.h>
#include<iostream>
#include<iomanip>
using namespace std;

int CmpS(Elem a,Elem b)
{
	return 0;
}
int main()
{
	Lista l(CmpS);
	Shape *p;
	int w=-1;
	while (w!=27)
	{
		cout<<"(1)Adauga Patrat"<<endl;
		cout<<"(2)Adauga Cerc"<<endl;
		cout<<"(3)Muta dx,dy "<<endl;
		cout<<"(4)Afiseaza tabelul (coordonate,arie,perimetru)"<<endl;
		w=_getch();
		switch (w)
		{
		case 49:
			{// add patrat
				p=new Patrat;
				p->CitCoord();
				l.add(p);
				break;
			}
		case 50:
			{//add cerc
				p=new Cerc;
				p->CitCoord();
				l.add(p);	
				break;
			}
		case 51:
			{//muta (translateaza) figurile
				float x,y;
				cout<<"Dati dx :";cin>>x;
				cout<<"Dati dy :";cin>>y;
				Iterator *it=l.iterator();
				it->setToFirst();
				while (it->hasNext())
				{
					it->getElem()->Muta(x,y);
					it->next();
				}
				
				break;
			}
		case 52:
			{//afiseaza tabel (coordonate,arie,perimetru)
				Iterator *it=l.iterator();
				it->setToFirst();
				while (it->hasNext())
				{
					cout<<"Coordonatele: ";
					it->getElem()->AfisCoord();
					cout<<"Aria: "<<it->getElem()->Arie()<<endl;
					cout<<"Perimentru: "<<it->getElem()->Perimetru()<<endl;
					it->next();
				}
				break;
			}
		}
	}
}