#include"Coada_Prioritati.h"
#include"Elev.h"
#include"Valuta.h"
#include<iostream>
#include<conio.h>
#include<iomanip>
using namespace std;

int CmpElevi(Elev a,Elev b)
{
	return strcmp(a.getNume(),b.getNume());
}
int CmpValute(Valuta a,Valuta b)
{
	return strcmp(a.getNumeV(),b.getNumeV());
}
int CautaNotaElev(CoadaPr<Elev,CmpElevi>& C,char* nume)
{
	Elev j;
	for (int i=0;i<C.getLength();i++)
	{
		j=C.Peek(i);
		if (strcmp(nume,j.getNume())==0)
			return j.getNota();
	}
	return 0;
}
float CautaValRon(CoadaPr<Valuta,CmpValute>& C,char* nume)
{
	Valuta j;
	for (int i=0;i<C.getLength();i++)
	{
		j=C.Peek(i);
		if (strcmp(nume,j.getNumeV())==0)
			return j.getValRon();
	}
	return 0;


}


int main()
{
	CoadaPr<Elev,CmpElevi> E;
	CoadaPr<Valuta,CmpValute> V;
	int w=-1;
	while (w!=27)
	{
		cout<<"(1)Adauga Elevi in coada "<<endl;
		cout<<"(2)Adauga Valute in coada"<<endl;
		cout<<"(3)Cauta Elev dupa campul nume"<<endl;
		cout<<"(4)Cauta Valuta dupa campul nume_valuta"<<endl;
		cout<<"(5)Afiseaza elevi"<<endl;
		cout<<"(6)Afiseaza valute"<<endl;
		cout<<"Tasta Esc exit "<<endl;
		w=_getch();
		switch(w){
			case 49:
				{//Adaugare Elevi in coada
					int nota;
					char *nume;
					nume=new char[20];
					Elev e;
					cout<<"Introducerea datelor se termina cu nota 0"<<endl;
					cout<<"Introduceti numele elevului:";
					cin.get(nume,20);
					cin.get();
					cout<<"Introduceti nota elevului: ";
					cin>>nota;
					
					while(nota!=0)
					{
						e.setNota(nota);
						e.setNume(nume);
						E.Add(e);
						nume=new char[20];
						cin.get();
						cout<<"Introduceti numele elevului:";
						cin.get(nume,20);
						cin.get();
						cout<<"Introduceti nota elevului: ";
						cin>>nota;
						
					}
					cout<<endl<<endl<<endl;
					break;
				}
			case 50:
				{//Adaugare Value in coada
					float val;
					char* nume=new char[20];
					Valuta v;
					cout<<"Introducerea datelor se termina cu valuta valorand 0"<<endl;
					cout<<"Introduceti numele valutei:";
					cin.get(nume,20);
					cin.get();
					cout<<"Introduceti valoarea in ron: ";
					cin>>val;
					while (val!=0)
					{
						v.setValRon(val);
						v.setNumeV(nume);
						V.Add(v);
						nume= new char[20];
						cin.get();
						cout<<"Introduceti numele valutei:";
						cin.get(nume,20);
						cin.get();
						cout<<"Introduceti valoarea in ron: ";
						cin>>val;
					}
					cout<<endl<<endl<<endl;
					break;
				}
			case 51:
				{//Cauta elev
					char nume[20];
					cin.get();
					cout<<"Dati numele elevulu: "<<endl;					
					cin.get(nume,20);
					cin.get();
					if (CautaNotaElev(E,nume))
						cout<<"Nota elevului este: "<<CautaNotaElev(E,nume);
					else
						cout<<"Aceste elev nu exista";
					cout<<endl<<endl<<endl;
				}
					break;
		
			case 52:
				{//Cauta Valuta
					char nume[20];
					cin.get();
					cout<<"Dati numele "<<endl;
					
					cin.get(nume,20);
					cin.get();
					if (CautaValRon(V,nume))
						cout<<"Valoare in lei este :"<<CautaValRon(V,nume);
					else
						cout<<"Nu exista valuta";
					cout<<endl<<endl<<endl;
					break;
				}
			case 53:
				{//Afiseaza elevi
					Elev i;
					while (! E.eVida())
					{
						i=E.Extract();
						cout<<setw(20)<<i.getNume()<<" "<<setw(10)<<i.getNota()<<endl;
					}
					cout<<endl<<endl<<endl;
					break;
				}
			case 54:
				{//afiseaza valute
					Valuta i;
					while (! V.eVida())
					{
						i=V.Extract();
						cout<<setw(20)<<i.getNumeV()<<" "<<setw(10)<<i.getValRon()<<endl;
					}
					cout<<endl<<endl<<endl;
					break;
				}
		}
	}
	return 0;
}