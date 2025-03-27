#include<iostream>
#include "Nr_prec_marita.h"
#include<conio.h>
using namespace std;
void CitireNr(intpm &nr)
{	
	int i,k;
	cout<<"Dati numarul de cifre: ";
	cin>>k;
	SetnoCif(nr,k);
	cout<<"Dati CIFRELE numarului in forma cifra 'spatiu' cifra: ";
	int *n=new int[k];
	for(i=0;i<k;i++)
	{
		cin>>n[i];
		if(n[i]>9)
		{
			for (int p=0;p<=i;p++)
				n[p]=0;
			cout<<"Re-introduceti cifrele numarului :";
			i=-1;
		}
	}
	SetCif(nr,n);
}
void AfisareNr(intpm nr)
{
	for (int i=0;i<GetnoCif(nr);i++)
		cout<<GetCif(nr,i);
}
void Redim(intpm *&z,int L)
{
	intpm *q;
	q=new intpm[L];
	for (int i=0;i<L-1;i++)
		q[i]=z[i];
	delete []z;
	z=q;
}
	
void CitireInsumare(intpm nr1,intpm &s,intpm *&z,int &nrm)
{
	nrm=0;
	InitSum(s);
	CitireNr(nr1);
	z=new intpm [1];
	while (GetnoCif(nr1)!=0)
	{		
		z[nrm++]=nr1;
		Redim(z,nrm+1);
		Suma(nr1,s,s);
		Init(nr1);
		CitireNr(nr1);
	}
}
void main()
{
	intpm nr1,s,*z;
	int nrm;
	Init(nr1);
	CitireInsumare(nr1,s,z,nrm);
	Sort (z,nrm);
	cout<<endl;
	//Afisari rezultate
	cout<<"Sirul [ordonat] al numerelor citite este: "<<endl;
	for (int i=0;i<nrm-1;i++)
	{
		AfisareNr(z[i]);
		cout<<" , ";
	}
	AfisareNr(z[nrm-1]);
	cout<<endl;
	cout<<"Suma numerelor este: ";
	AfisareNr(s);
	cout<<endl;
	//Dealocari 
	for (int j=0;j<nrm;j++)
		Dealoc(z[j]);
	delete z;
	Dealoc(s);
	_getch();
}