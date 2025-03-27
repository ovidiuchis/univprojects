#include"Cat.h"
#include<string>
#include<iostream>
#include<conio.h>

using namespace std;

typedef struct{
	char nume[20];
	int nota;
}elev;
int CmpE(El a,El b)
{
	return strcmp(((elev*)a)->nume,((elev*)b)->nume);
}
void CitireElevi(tabel &t)
{
	Init(t,CmpE);
	char nume[20];
	int nota;
	cout<<"Dati numele: ";
	cin.get();
	cin.get(nume,20);
	cout<<"Dati nota: ";
	cin>>nota;
	while(nota!=0)
	{
		elev *E=new elev;
		strcpy(E->nume,nume);
		E->nota=nota;
		Insert(t,E);
		cout<<"Dati numele: ";
		cin.get();
		cin.get(nume,20);
		cout<<"Dati nota: ";
		cin>>nota;
		if (nota==0) 
			break;
		
	}
}
void AfisareElevi(tabel t)
{
	for (int i=0;i<GetL(t);i++)
	{
		cout<<((elev*)GetElem(t,i))->nume;
		cout<<"  : ";
		cout<<((elev*)GetElem(t,i))->nota;
		cout<<endl;
	}
}
int GetGrade(tabel t,char name[])
{
	for (int i=0;i<GetL(t);i++)
		if (strcmp(name,((elev *)GetElem(t,i))->nume)==0)
			return ((elev *)GetElem(t,i))->nota;
}
void main()
{
  tabel t;
  char w=0;
  char nume[20];
  int nota;
  while (w!=27)
  {
	  cout<<"(1) pt a creea tabelul"<<endl;
	  cout<<"(2) pt a afisa tabelul"<<endl;
	  cout<<"(3) pt a cauta nota unui elev dupa nume "<<endl;
	  cout<<"(4) pt a cauta elevii avand o nota oarecare "<<endl;
	  cout<<"Esc pt exit" <<endl<<endl;
	  w=getch();
	  switch (w) 
	  {
	  case 51:{
		  cout<<"Dati numele : ";
		  cin.get();
		  cin.get(nume,20);
		  cout<<"Elevul "<<nume<<" are nota: " ;
		  cout<<GetGrade(t,nume);
		  cout<<endl<<endl<<endl;
		  break;
			 }
	  case 52:{
		  cout<<"Dati nota: ";
		  cin>>nota;
		  for (int i=0;i<GetL(t);i++)
			  if (((elev *)GetElem(t,i))->nota==nota)
				  cout<<"Elevul "<<((elev *)GetElem(t,i))->nume<<" are nota introdusa"<<endl<<endl<<endl;;
			 
		  break;
			 }
	  case 49:{
		  CitireElevi(t);
		  cout<<endl<<endl<<endl;
		  break;
			 }
	  case 50:{
		  AfisareElevi(t);
		  cout<<endl<<endl<<endl;
		  break;
			 }

	  default:{
		  cout<<"Nu ati introdus o optiune valida";
		  break;
			  }
	  }
  }
  DeleteComponents(t); 
  Delete(t);
}