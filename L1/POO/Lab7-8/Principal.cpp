#include"Student.h"
#include"Disciplina.h"
#include"Rezultat.h"
#include"Catalog.h"//Lista.h este importata de Catalog.h, fiind inclusa acolo
#include<conio.h>
#include<iomanip>
#include<string.h>
#include<iostream>
using namespace std;
int CmpStudenti(Elem a,Elem b)//identificatorul unic pt student este matricolul
{
	if (((Student*)a)->GetMatricol()==((Student*)b)->GetMatricol())   
		return 1;
	return 0;
}
int CmpDiscipline(Elem a,Elem b)//identificatorul unic pt disciplina este titlul ei
{
	if (strcmp(((Disciplina*)a)->getTitlu(),((Disciplina*)b)->getTitlu())==0)
		return 1;
	return 0;
}
int CmpCatalog(Elem a, Elem b)//identificatorul unic pentru Catalog este titlul disciplinei careia ii apartine catalogul
{
	if (strcmp(((Catalog*)a)->getTitluD(),((Catalog*)b)->getTitluD())==0)
		return 1;
	return 0;
}
int CmpRez(Elem a, Elem b)//un student nu poate avea mai multe rezultate la aceasi disciplina (adica in aceasi lista de rezultate)
{
	if (((Rezultat*)a)->getMatricolS()==((Rezultat*)b)->getMatricolS())
		return 1;
	return 0;
}
char* SearchStudent(Lista &L,int nrm)//retuneaza studentul cu matricolul 'nrm' din lista L
{
	
	Iterator* it=L.iterator();
	it->setToFirst();
	while (it->hasNext())
	{
		if(((Student*)it->getElem())->GetMatricol()==nrm)
			return ((Student*)it->getElem())->GetNume();
		it->next();
	}
	return 0;
}

char* SearchDisciplina(Lista &D,char* titlu)//impunem: un profesor preda o singura disciplina
{											//returneaza numele profesorului care preda disciplina cu titlul 'titlu'	
	Iterator* id=D.iterator();
	id->setToFirst();
	while (id->hasNext())
	{	
		if(strcmp(((Disciplina*)id->getElem())->getTitlu(),titlu)==0)
			return ((Disciplina*)id->getElem())->getProfesor();
		id->next();
	}
	return 0;
}
int existaMatricol(Lista &L,int matricol)//va verifica daca matricolul 'matricol' este asignat unui student din lista de studenti L
{										//functia este necesara la adaugarea rezultatelor studentilor dupa matricol
	Iterator* it=L.iterator();
	it->setToFirst();
	while (it->hasNext())
	{
		if(((Student*)it->getElem())->GetMatricol()==matricol)
			return 1;
		it->next();
	}
	return 0;
}
int existaDisciplina(Lista &L,char* titlu)//va verifica daca disciplina cu titlul 'titlu' exista in lista de discipline L
{										  //functia este necesara la adaugarea rezultatelor la o materie oarecare 	
	Iterator* it=L.iterator();
	it->setToFirst();
	while (it->hasNext())
	{
		if(strcmp(((Disciplina*)it->getElem())->getTitlu(),titlu)==0)
			return 1;
		it->next();
	}
	return 0;
}
void main()
{

  int w=-1;
  Lista L(CmpStudenti);//Lista Studentilor inscrisi
  Lista D(CmpDiscipline);//Lista Disciplinelor disponibile
  Lista F(CmpCatalog);//Lista Cataloagelor (discipline,rezultate)

  while (w!=27)
  {
	  cout<<"(1) Creaza lista/Adauga Studenti "<<endl;
	  cout<<"(2) Adauga Rezultate (se va introduce titlul Disciplinei)"<<endl;
	  cout<<"(3) Afiseaza toti Studentii inscrisi "<<endl;
	  cout<<"(4) Afiseaza toate Rezultate Studentilor"<<endl;
	  cout<<"(6) Cautare Student dupa numar matricol "<<endl;
	  cout<<"(7) Creaza lista/Adauga Discipline "<<endl;
	  cout<<"(8) Afiseaza toate Disciplinele disponibile "<<endl;
	  cout<<"(9) Cautare profesor disciplina "<<endl;
	  cout<<"Tasta (ESC) pentru iesire "<<endl;
	  cout<<endl<<endl<<endl;
	  w=_getch();
	  switch (w)
	  {
		  case 49:
			  {
				  char* nume=new char[20];
				  int matricol;
				  Student* s=new Student;
				  cout<<"Se va incheia introducerea datelor , printr-un matricol Negativ "<<endl<<endl;
				  cout<<"Introduceti Numele Studentului : ";
				  cin.get(nume,20);
				  cin.get();
				  cout<<"Introduceti Matricolul Studentului: ";
				  cin>>matricol;
				  s->SetMatricol(matricol);
				  s->SetNume(nume);
				  if (matricol>0)
					  L.add(s);
				  while (matricol>0)
				  {
					  s=new Student;
					  nume=new char[20];
					  cout<<"Introduceti Numele Studentului : ";
					  cin.get();
					  cin.get(nume,20);					  
					  cout<<"Introduceti Matricolul Studentului: ";
					  cin>>matricol;
					  if (matricol<0)
						  break;
					  s->SetMatricol(matricol);
					  s->SetNume(nume);
					  L.add(s);
				  }
				  cout<<endl<<endl<<endl;
				  cin.get();
				  break;
			  }
		  case 51:
			  {
				  cout<<setiosflags(ios::left)<<setw(15)<<"NR Matricol"<<setw(20)<<"Numele Studentului"<<endl;
				  Iterator* it=L.iterator();
				  it->setToFirst();
				  while (it->hasNext())
				  {
					  cout<<setiosflags(ios::left)<<setw(15)<<((Student*)it->getElem())->GetMatricol()<<setw(20)<<((Student*)it->getElem())->GetNume();
					  cout<<endl;
					  it->next();
				  }
				  cout<<endl<<endl<<endl;
				  cin.get();
				  break;
			  }
		  case 53:
			  {
				  char* nume=new char[20];
				  int matricol;
				  Student* s=new Student;
				  cout<<"Introduceti Numele Studentului(a): ";
				  cin.get(nume,20);
				  cin.get();
				  cout<<"Introduceti Matricolul Studentului(a): ";
				  cin>>matricol;
				  s->SetMatricol(matricol);
				  s->SetNume(nume);
				  if (matricol>0)
					  L.add(s);
				  cout<<endl<<endl<<endl;
				  cin.get();				  
				  break;
			  }
		  case 54:
			  {
				  int matricol;
				  cout<<"Dati numarul matricol pentru afisarea studentului corespunzator: "<<endl;
				  cin>>matricol;
				  cin.get();
				  if (SearchStudent(L,matricol)!=0)
					  cout<<"Studentul este "<<setw(20)<<SearchStudent(L,matricol);
				  else
					  cout<<"Acest matricol nu exista "<<endl;
				  cout<<endl<<endl<<endl;
				  cin.clear();
				  break;

			  }
		  case 50:
			  {
				  char* name=new char[20];
				  cout<<"Dati numele Disciplinei: ";
				  cin.get(name,20);
				  cin.get();
				  if (!existaDisciplina(D,name))
					  cout<<"Disciplina nu exista in lista de discippline "<<endl;
				  else
				  {
					  Catalog* C=new Catalog;
					  Lista* R=new Lista(CmpRez);
					  Rezultat *rez;
					  rez=new Rezultat;
					  int matricol,nota;
					  C->setLista(R);
					  C->setTitluD(name);
					  cout<<"Se va incheia introducerea datelor , printr-un matricol Negativ sau unul invalid "<<endl<<endl;
					  cout<<"Dati Matricolul Studentului: ";
					  cin>>matricol;
					  cout<<"Dati Rezultatul obtinut: ";
					  cin>>nota;
					  if (matricol>0 || !existaMatricol(L,matricol))
					  {
						  rez->setMatricolS(matricol);
						  rez->setRezultat(nota);
						  C->getLista()->add(rez);  
					  }
					  while (matricol>0 || !existaMatricol(L,matricol))
					  {
						  rez=new Rezultat;
						  cout<<"Dati Matricolul Studentului: ";
						  cin>>matricol;
						  if (matricol<0 || !existaMatricol(L,matricol))
							  break;
						  cout<<"Dati Rezultatul obtinut: ";
						  cin>>nota;
						  rez->setMatricolS(matricol);
						  rez->setRezultat(nota);
						  C->getLista()->add(rez);//c.R		
					  }	
					  F.add(C);
				  }					  
					  cout<<endl<<endl<<endl;
					  cin.get();
					  break;
			  }
		  case 52:
			  {
				  Iterator* it=F.iterator();
				  it->setToFirst();
				  cout<<setiosflags(ios::left)<<setw(10)<<"NR Matricol "<<setw(20)<<"Nume Student "<<setw(20)<<"Disciplina "<<setw(3)<<"Rezultat "<<endl;
				  while (it->hasNext())
				  {
					  Iterator* ic=(((Catalog*)it->getElem())->getLista())->iterator();
					  while (ic->hasNext())
					  {
						  
						  cout<<setiosflags(ios::left)<<setw(10)<<((Rezultat*)ic->getElem())->getMatricolS()<<setiosflags(ios::left)<<setw(20)<<SearchStudent(L,((Rezultat*)ic->getElem())->getMatricolS());
						  cout<<setiosflags(ios::left)<<setw(20)<<((Catalog*)it->getElem())->getTitluD()<<setiosflags(ios::left)<<setw(3)<<((Rezultat*)ic->getElem())->getRezultat();
						  cout<<endl;
						  ic->next();
					  }
					  cout<<endl;
					  it->next();
				  }
				  cout<<endl<<endl<<endl;
				  cin.get();
				  break;
			  }
		  case 55:
			  {
	
				  char* numed=new char[20];
				  char* numep=new char[20];
				  Disciplina* d=new Disciplina;
				  cout<<"Introducerea datelor se incheie cu introducerea disciplinei 1 "<<endl;
				  cout<<"Introduceti numele discipline: ";
				  cin.get(numed,20);
				  cin.get();
				  cout<<"Introduceti numele profesorului: ";
				  cin.get(numep,20);
				  cin.get();
				  d->setProfesor(numep);
				  d->setTitlu(numed);
				  if (strlen(numed)!=1)
					  D.add(d);
				  while (strlen(numed)!=1)
				  {
					  d=new Disciplina;
					  numed=new char[20];
					  numep=new char[20];
					  cout<<"Introduceti numele discipline: ";
					  cin.get(numed,20);
					  cin.get();
					  cout<<"Introduceti numele profesorului: ";
					  cin.get(numep,20);
					  cin.get();
					  d->setProfesor(numep);
					  d->setTitlu(numed);
					  if (strlen(numed)==1)
						  break;
					  D.add(d);
				  }
				  cout<<endl<<endl<<endl;
				  cin.clear();
				  break;
			  }
		  case 56:
			   {
				   cout<<setiosflags(ios::left)<<setw(20)<<"Nume Disciplina"<<setw(20)<<"Nume profesor "<<endl;
				   Iterator* id;
				   id=D.iterator();
				   id->setToFirst();
				   while (id->hasNext())
				   {
					   cout<<setiosflags(ios::left)<<setw(20)<<((Disciplina*)id->getElem())->getTitlu()<<setw(20)<<((Disciplina*)id->getElem())->getProfesor()<<endl;
					   id->next();
				   }
				   cout<<endl<<endl<<endl;
				   cin.get();
				   break;
			   }
		  case 57:
			  {
				  char* nume=new char[20];
				  
				  cout<<"Introduceti numele disciplinei pentru afisarea profesorului corespunzator :"<<endl;
				  cin.get(nume,20);
				  cin.get();
				  if (SearchDisciplina(D,nume)!=0)
					  cout<<"Profesorul este:  "<<setw(20)<<SearchDisciplina(D,nume);
				  else
					  cout<<"Aceasta materie nu exista "<<endl;
				  cout<<endl<<endl<<endl;
				  cin.get();
				  break;
			  }
		}
	}
}