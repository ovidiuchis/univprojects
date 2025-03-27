#include "Dictionar.h"
#include <iostream>
#include<string.h>
#include<conio.h>
using namespace std;

int CmpCuv(Key a,Key b)
{
  return strcmp((char*)a,(char*)b);
}
void CreareDictionar(Dictionar &d)
{
	char *cuvant=new char[15];
	char *explicatie=new char[100];
	Init(d,CmpCuv);
	cout<<"Dati cuvantul: ";
	cin.get(cuvant,15);
	cout<<"Dati explicatia : ";
	cin.get();
	cin.get(explicatie,100);
	while (strlen(cuvant)>1)
	{
		Adauga(d,cuvant,explicatie);
		cuvant=new char[15];
		explicatie=new char[100];
		cout<<"Dati cuvantul : ";
		cin.get();
		cin.get(cuvant,15);
		if (strlen(cuvant)<2)
			break;
		cout<<"Dati explicatia : ";
		cin.get();
		cin.get(explicatie,100);
	}
	cout<<endl;
	cin.clear();
}
void DeleteComponents(Dictionar &d)
{
	for (int i=0;i<GetLength(d);i++)
	{
		delete[] (char*)GetKey(d,i);
		delete[] (char*)GetValue(d,i);
	}
}
void AfisareContinut(Dictionar d)
{
	cout<<"Toate cuvintele si explicatiile "<<endl;
	for (int i=0;i<GetLength(d);i++)
	{
		cout<<(char*)GetKey(d,i)<<" = ";
		cout<<(char*)GetValue(d,i);
		cout<<endl;
	}
	cout<<endl;
}
void main()
{
	Dictionar d;
	int w=-1;
	Init(d,CmpCuv);
	while (w!=27)
	{
		cout<<"(1) pentru Creare unui Dictionar "<<endl;
		cout<<"(2) pentru Afisare continutului "<<endl;
		cout<<"(3) pentru cautarea unei explicatii "<<endl;
		cout<<"(4) pentru adaugarea unei perechi in dictionar"<<endl;
		cout<<"(5) pentru eliminarea unei perechi din dictionar "<<endl;
		cout<<"(6) pentru modificarea explicatiei unui cuvant "<<endl;
		cout<<" (Esc) pentru iesire"<<endl;
		cout<<endl;
		w=_getch();
		switch (w) 
		{
		case 49:{
				cout<<"Introduceti cuvantul vid pentru oprire "<<endl;
				CreareDictionar(d);
				break;
				  }
		case 50:{
			if (GetLength(d)==0)
				cout<<"Dictionarul este gol"<<endl;
			else
				AfisareContinut(d);
			break;
				  }
		case 51:{
			char *cuv=new char[15];
			cout<<"Introduceti cuvantul care il doriti explicat "<<endl;
			cin.get();
			cin.get(cuv,15);
			int poz=Search(d,cuv);
			if (poz==-1)
				cout<<"Nu exista acest cuvant in dictionar "<<endl;
			else
				cout<<cuv<<" = "<<(char*)GetValue(d,poz);
			cin.clear();
			break;
				  }
		case 52:{
			char *cuv=new char[15];
			char *expl=new char[100];
			cout<<"Dati cuvantul pe care doriti sa il adaugati "<<endl;
			cin.get();
			cin.get(cuv,15);
			cout<<"Dati explicatia acestui cuvant "<<endl;
			cin.get();
			cin.get(expl,100);
			Adauga(d,cuv,expl);
			cin.clear();
			break;
				  }
		case 53:{
			char *cuv=new char[15];
			cout<<"Dati cuvantul care doriti sa il eliminati"<<endl;
			cin.get();
			cin.get(cuv,15);
			Elimina(d,cuv);
			cin.clear();
			break;
				}
		case 54:{
			char *cuv=new char[15];
			char *expl=new char[100];
			cout<<"Dati cuvantul a carei explicatii doriti sa o modificati "<<endl;
			cin.get();
			cin.get(cuv,15);
			if (Search(d,cuv)==-1)
				cout<<"Acest cuvant nu exista "<<endl;
			else
			{
				cout<<"Dati noua explicatie: ";
				cin.get();
				cin.get(expl,100);
				Modifica(d,cuv,expl);
			}
			cin.clear();
			break;
				  }
		case 27:{
			break;
				  }
		}
	}

	DeleteComponents(d);
	DeleteD(d);
	_getch();
}