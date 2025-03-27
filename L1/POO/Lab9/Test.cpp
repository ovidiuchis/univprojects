#include"Coada.h"
#include"Rational_Complex.h"
#include<iostream>
#include<conio.h>
using namespace std;
void CpyComplex(Elem a,Elem b)
{
	*((Complex*)a)=*((Complex*)b);
}
void CpyRational(Elem a,Elem b)
{
	*((Rational*)a)=*((Rational*)b);
}
ostream& operator<<(ostream &o, Complex &c)
{
	o<<c.getReal()<<"+i*"<<c.getImaginar();
	return o;
}
istream& operator>>(istream &i,Complex &c)
{
	int r,ii;
	cout<<"Real : ";
	i>>r;
	cout<<"Imaginar: ";
	i>>ii;
	c.setImaginar(ii);
	c.setReal(r);
	return i;
}
ostream& operator<<(ostream &o, Rational &r)
{
	o<<r.getSus()<<"/"<<r.getJos();
	return o;
}
istream& operator>>(istream &i,Rational &r)
{
	int rr,ii;
	cout<<"Numarator: ";
	i>>rr;
	cout<<"Numitor: ";
	i>>ii;
	r.setSus(rr);
	r.setJos(ii);
	return i;
}
int main()
{
	int w=-1;
	while (w!=27)
	{
		cout<<"(1) Introducere numere complexe in Coada, si afisare "<<endl;
		cout<<"(2) Introducere numere rationale in Coada, si afisare"<<endl;
		cout<<"Esc";
		w=_getch();
		switch (w){
			case 49:
				{
					Coada C(CpyComplex);
					Complex *c=new Complex;					
					cout<<"Intrucem elemente numere complexe in coada:(pana la introducerea elementului 0+0i) "<<endl;
					cin>>*c;
					while (c->getImaginar()!=0 && c->getReal()!=0)
					{
						C+=c;
						c=new Complex;
						cin>>*c;
					}
					cout<<"Ati introdus :"<<endl;
					while (!C)
					{
						C-=c;
						cout<<*c<<" ";
					}
					cout<<endl;
					break;
				}
			case 50:
				{

					Coada R(CpyRational);
					Rational *r=new Rational;
					cout<<"Intrucem elemente numere rationale in coada:(pana la introducerea elementului cu numitor 0) "<<endl;
					cin>>*r;
					while (r->getJos()!=0 )
					{
						R+=r;
						r=new Rational;
						cin>>*r;
					}
					cout<<"Ati introdus :"<<endl;
					while (!R)
					{
						R-=r;
						cout<<*r<<" ";
					}
					cout<<endl;
					break;
				}
			default:
				{
					cout<<"optiune invalida"<<endl;
					break;
				}
		}
	}
}