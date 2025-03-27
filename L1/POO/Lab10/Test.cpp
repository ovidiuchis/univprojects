#include"Student.h"
#include"Disciplina.h"
#include"Catalog.h"
#include"Rezultat.h"
#include"Lista.h"
#include<iostream>
#include<conio.h>
#include<fstream>
#include<iomanip>
#include<string>
using namespace std;

int CmpStudenti(Object* a,Object* b)//identificatorul unic pt student este matricolul
{
	if (((Student*)a)->GetMatricol()==((Student*)b)->GetMatricol())   
		return 1;
	return 0;
}
int CmpDiscipline(Object* a,Object* b)//identificatorul unic pt disciplina este titlul ei
{
	if (strcmp(((Disciplina*)a)->getTitlu(),((Disciplina*)b)->getTitlu())==0)
		return 1;
	return 0;
}
int CmpCatalog(Object* a, Object* b)//identificatorul unic pentru Catalog este titlul disciplinei careia ii apartine catalogul
{
	if (strcmp(((Catalog*)a)->getTitluD(),((Catalog*)b)->getTitluD())==0)
		return 1;
	return 0;
}
int CmpRez(Object* a, Object* b)//un student nu poate avea mai multe rezultate la aceasi disciplina (adica in aceasi lista de rezultate)
{
	if (((Rezultat*)a)->getMatricolS()==((Rezultat*)b)->getMatricolS())
		return 1;
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
char* SearchStudent(Lista& L,int nrm)//retuneaza studentul cu matricolul 'nrm' din lista L
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
Catalog* getCatalog(Lista& F,char* tdisciplina)//returneaza din lista cataloagelor (F), catalogul disciplinei disciplina 'tdisciplina' 
{
	Iterator* i=F.iterator();
	i->setToFirst();
	while (i->hasNext())
	{
		if (strcmp(((Catalog*)i->getElem())->getTitluD(),tdisciplina)==0)
			return (Catalog*)i->getElem();
		i->next();
	}
	return 0;
}


int main()
{
	  int w=-1;
	  Lista L(CmpStudenti);//Lista Studentilor inscrisi
	  Lista D(CmpDiscipline);//Lista Disciplinelor disponibile
	  Lista F(CmpCatalog);//Lista Cataloagelor (discipline,rezultate)

	  //Incarcarea in liste a eventualelor DATE EXISTENTE in fisiere	

	  //Incarcarea in lista a studentilor din fisier (daca exista)
	  ifstream stud("Studenti.txt");
	  char* nume=new char[20];
	  char matricol[10];	
	  stud.getline(matricol,20);
	  stud.getline(nume,20);
	  while (!stud.eof() )
	  {
		  Student* s=new Student;
		  s->SetMatricol(atoi(matricol));
		  s->SetNume(nume);
		  L.add(s);
		  nume=new char[20];
		  stud.getline(matricol,20);
		  stud.getline(nume,20);
	  }

	  //Incarcarea in lista a disciplinelor din fisier(daca exista)

	  ifstream dsc("Discipline.txt");
	  char* titlu=new char[20];
	  char *nume_p=new char[30];	
	  dsc.getline(titlu,20);
	  dsc.getline(nume_p,30);
	  while (!dsc.eof() )
	  {
		  Disciplina* d=new Disciplina;
		  d->setTitlu(titlu);d->setProfesor(nume_p);
		  D.add(d);
		  titlu=new char[20];
		  nume_p=new char[30];
		  dsc.getline(titlu,20);
		  dsc.getline(nume_p,30);
	  }
	  // Vom incarca doar datele continute de fisierele Studenti si Discipline 
	  //restu fisierelor vor fi vide la inceputul fiecarei executii
	  ofstream f("Catalog.txt");
	  f<<"";
	  f.close();
	  ofstream g("Nepromovati.txt");
	  g<<"";
	  g.close();
	  ofstream h("note1.txt");
	  h<<"";
	  h.close();
	  while (w!=27)
	  {
	  cout<<"(1) Adauga Studenti "<<endl;
	  cout<<"(2) Adauga Discipline"<<endl;
	  cout<<"(3) Adauga Rezultate (se va introduce titlul Disciplinei)  "<<endl;
	  cout<<"(4) Afiseaza Studentii inscrisi "<<endl;
	  cout<<"(5) Afiseaza Rezultate Studentilor(toate disciplinele)"<<endl;
	  cout<<"(6) Afiseaza studentii nepromovati "<<endl;
	  cout<<"(7) Afiseaza rezultatele la o singura disciplina (se va introduce titlul Disciplinei)"<<endl;
	  cout<<"Tasta (ESC) pentru iesire "<<endl;
	  cout<<endl<<endl<<endl;
	  w=_getch();
	  switch (w)
	  {
		  case 49:
			  {//Creaza/Adauga Studenti in Lista/Fisier
				  char* nume=new char[20];
				  int matricol;	
				  Student* s=new Student;
				  fstream stud("Studenti.txt",ios::app);
				  cout<<"Se va incheia introducerea datelor , printr-un matricol Negativ "<<endl<<endl;
				  cout<<"Introduceti Numele Studentului : ";
				  cin.get(nume,20);
				  cin.get();
				  cout<<"Introduceti Matricolul Studentului: ";
				  cin>>matricol;
				  s->SetMatricol(matricol);
				  s->SetNume(nume);
				  if (matricol>0)
				  {
					  L.add(s);
					  stud<<s->toString();
					  stud<<endl;
				  }
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
					  stud<<s->toString();
					  stud<<endl;
				  }
				  cout<<endl<<"Informatiile citite s-au depus si in fisierul 'Studenti.txt' ";
				  cout<<endl<<endl<<endl;
				  cin.get();
				  break;
			  }
		  case 52:
			  { //Citire/Afisare studenti din fisier
				  ifstream stud("Studenti.txt");
				  char nume[50];
				  char mat[40];
				  cout<<setiosflags(ios::left)<<setw(10)<<"Matricol"<<setw(30)<<"Nume Student"<<endl;
				  stud.getline(mat,40); 
				  stud.getline(nume,50);
				  while (! stud.eof() )
				  {
					  cout<<setiosflags(ios::left)<<setw(10)<<mat<<setw(30)<<nume<<endl;;
					  stud.getline(mat,40); 
					  stud.getline(nume,50);
					  
				  }
				  break;
			  }
		  case 51:
			  {//Adauga Rezultate la o disciplina (titlul ei se va citi de la tastatura)/nepromovatii se adauga automat in Nepromovati.txt
				  char* name=new char[20];
				  
				  cout<<"Dati numele Disciplinei: ";
				  cin.get(name,20);
				  cin.get();
				  if (!existaDisciplina(D,name))
					  cout<<"Disciplina nu exista in lista de discipline "<<endl;
				  else
				  {
					  
					  Catalog* C=new Catalog;
					  Lista* R=new Lista(CmpRez);
					  fstream clog("Catalog.txt",ios::app);
					  fstream np("Nepromovati.txt",ios::app);
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
					  
					  if (matricol>0 && existaMatricol(L,matricol))
					  {
						  rez->setMatricolS(matricol);
						  rez->setRezultat(nota);
						  C->getLista()->add(rez);
						  clog<<C->getTitluD()<<endl;
						  clog<<rez->getMatricolS()<<endl;
						  clog<<rez->getRezultat()<<endl;
						  if (rez->getRezultat()<5)
						  {
							  np<<C->getTitluD()<<endl;
							  np<<rez->getMatricolS()<<endl;
							  np<<SearchStudent(L,rez->getMatricolS())<<endl;
							  np<<rez->getRezultat()<<endl;
						  }

					  }
					  while (matricol>0 && existaMatricol(L,matricol))
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
						  clog<<C->getTitluD()<<endl;
						  clog<<rez->getMatricolS()<<endl;
						  clog<<rez->getRezultat()<<endl;
						  if (rez->getRezultat()<5)
						  {
							  np<<C->getTitluD()<<endl;
							  np<<rez->getMatricolS()<<endl;
							  np<<SearchStudent(L,rez->getMatricolS())<<endl;
							  np<<rez->getRezultat()<<endl;
						  }
					  }	
					  F.add(C);
					  clog.close();
					  np.close();
				  }				
					  cout<<endl<<"Informatiile citite s-au depus si in fisierul 'Catalog.txt' si in 'Nepromovati.txt'";	
					  cout<<endl<<endl<<endl;
					  
					  cin.get();
					  break;
			  }
		  case 53:
			  {//Citire/Afisare rezultate din fisier
				  ifstream clog("Catalog.txt");
				  cout<<setiosflags(ios::left)<<setw(15)<<"NR Matricol "<<setw(20)<<"Nume Student "<<setw(20)<<"Disciplina "<<setw(3)<<"Rezultat "<<endl;
				  char titlu[20],matricol[10],rezultat[10];
				  clog.getline(titlu,20);
				  clog.getline(matricol,10);
				  clog.getline(rezultat,10);
				  while (! clog.eof() )
				  {
					  cout<<setiosflags(ios::left)<<setw(15)<<matricol<<setw(20)<<SearchStudent(L,atoi(matricol))<<setw(20)<<titlu<<setw(3)<<rezultat<<endl;
					  clog.getline(titlu,20);
					  clog.getline(matricol,10);
					  clog.getline(rezultat,10);
				  }
				  cout<<endl<<endl<<endl;
				  clog.close();
				  cin.get();
				  break;
			  }
		  case 50:
			  {//Creaza/Adauga Discipline in Lista/Fisier
	
				  char* numed=new char[20];
				  char* numep=new char[20];
				  fstream dsc("Discipline.txt",ios::app);
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
				  {
					  D.add(d);
					  dsc<<d->toString();
					  dsc<<endl;
				  }

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
					  dsc<<d->toString();
					  dsc<<endl;
				  }
				  cout<<endl<<"Informatiile citite s-au depus si in fisierul 'Discipline.txt' ";
				  cout<<endl<<endl<<endl;
				  cin.clear();
				  break;
			  }
		
		case 54:
			{//Afisarea din fisier a nepromovatilor
				ifstream np("Nepromovati.txt");
				cout<<setiosflags(ios::left)<<setw(15)<<"Matricol"<<setw(20)<<"Nume"<<setw(20)<<"Titlu"<<setw(10)<<"Nota"<<endl;
				char nume[20],matricol[2],titlu[20],nota[3];
				while (! np.eof())
				{
					np.getline(titlu,20);
					np.getline(matricol,20);
					np.getline(nume,20);
					np.getline(nota,20);
					cout<<setiosflags(ios::left)<<setw(15)<<matricol<<setw(20)<<nume<<setw(20)<<titlu<<setw(10)<<nota<<endl;
				}
				cout<<endl<<endl<<endl;
				break;		
			}
		case 55:
			{//Afisarea pe ecran si in fisier a rezultatelor unei singure discipline (titlul ei se va citi)
				ofstream n1("note1.txt");
				char *titlu=new char[20];
				cout<<"Dati titlul disciplinei "<<endl;
				cin.get(titlu,20);
				if (getCatalog(F,titlu)==0)
				{
					cout<<"La aceasta materie nu s-au adaugat rezultate "<<endl;
					cin.get();
					break;
				}
				cout<<setiosflags(ios::left)<<setw(15)<<"Matricol"<<setw(20)<<"Nume"<<setw(20)<<"Titlu"<<setw(10)<<"Nota"<<endl;
				Iterator *i=getCatalog(F,titlu)->getLista()->iterator();
				i->setToFirst();
				while (i->hasNext())
				{
					cout<<setiosflags(ios::left)<<setw(15)<<((Rezultat*)i->getElem())->getMatricolS()<<setw(20)<<SearchStudent(L,((Rezultat*)i->getElem())->getMatricolS())<<setw(20)<<titlu<<setw(10)<<((Rezultat*)i->getElem())->getRezultat()<<endl;
					n1<<setiosflags(ios::left)<<setw(15)<<((Rezultat*)i->getElem())->getMatricolS()<<setw(20)<<SearchStudent(L,((Rezultat*)i->getElem())->getMatricolS())<<setw(20)<<titlu<<setw(10)<<((Rezultat*)i->getElem())->getRezultat()<<endl;
					i->next();
				}
				cout<<endl<<"Informatiile au fost depuse si in fisierul 'note1.txt'";
				n1.close();
				cout<<endl<<endl<<endl;	
				cin.get();
				break;

			}
			}
			}
	
	stud.close();
	return 0;
}