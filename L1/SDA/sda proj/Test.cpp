#include"Dictionar.h"
#include"PerecheD.h"
#include<conio.h>
#include<string.h>
#include<iostream>
#include<iomanip>
using namespace std;

int main()
{
	int w=-1;
	Dictionar *D=new Dictionar;
	char* cuvant;char* explicatie;
	while (w!=27)
	{
		cout<<"(1)Adauga cuvant-explicatie in dictionar" <<endl;
		cout<<"(2)Cauta explicatia unui cuvant (cuvantul se va introduce de la tastatura)"<<endl;
		cout<<"(3)Modifica explicatia unui cuvant (cuvantul se va introduce de la tastatura)"<<endl;
		cout<<"(4)Afiseaza toate cuvintele din Dictionar "<<endl;
		cout<<"(5)Sterge un cuvant din dictionar"<<endl;
		cout<<"Exit tasta Escape"<<endl;
		w=_getch();
		switch(w)
		{
		case 49:
			{//Adauga o pereche cuvant-explicatie in dictionar
				cuvant=new char[20];
				explicatie=new char[30];
				PerecheD pp;
				cout<<"Introduceti cuvantul: ";
				cin.get(cuvant,20);
				cin.get();
				cout<<"Introduceti explicatia: ";
				cin.get(explicatie,30);
				cin.get();
				pp.setCuvant(cuvant);
				pp.setExplicatie(explicatie);
				D->Add(pp);
				cout<<endl<<endl<<endl;
				break;
			}
		case 50:
			{// Cauta explicatie
				cuvant=new char[20];
				cout<<"Introduceti cuvantul a carui explicatie o cautati: ";
				cin.get(cuvant,20);
				cin.get();
				if (!D->getExplicatie(cuvant))
					cout<<"Cuvantul introdus nu este inregistrat"<<endl;
				else
					cout<<"Explicatia: "<<D->getExplicatie(cuvant);
				cout<<endl<<endl<<endl;
				break;
			}
		case 51:
			{//modifica explicatie 
				cuvant=new char[20];
				cout<<"Introduceti cuvantul a carei explicatii doriti sa o modificati: ";
				cin.get(cuvant,20);
				cin.get();
				cout<<"Introduceti explicatia noua: ";
				cin.get(explicatie,30);
				cin.get();
				if (D->Modif(cuvant,explicatie))
					cout<<"Modificarea s-a realizat cu succes"<<endl;
				else 
					cout<<"Cuvantul dat nu este inregistrat in dictionar "<<endl;
				cout<<endl<<endl<<endl;
				break;
			}
		case 52:
			{//Afiseaza tot continutul
				Iterator* k=new Iterator(D);
				k->setToFirst();
				cout<<setw(20)<<"CUVANT"<<setw(30)<<"EXPLICATIE"<<endl;
				while (k->hasNext())
				{
					cout<<setw(20)<<k->getElem().getCuvant()<<setw(30)<<k->getElem().getExplicatie()<<endl;
					k->next();
				}
				cout<<endl<<endl<<endl;
				break;
			}
		case 53:
			{//Sterge un cuvant
				cuvant=new char[20];
				cout<<"Introduceti cuvantul care doriti sa il stergeti: ";
				cin.get(cuvant,20);
				cin.get();
				if (!D->Del(cuvant))
					cout<<"Cuvantul introdus nu este inregistrat"<<endl;
				else
					cout<<"Stergerea s-a realizat cu succes";
				cout<<endl<<endl<<endl;
				break;
			}
		}
	}
}