
#include<iostream>
using namespace std;
struct polinom{ 
	int grad;
	int coef[25];
};
void Afisare(polinom p)
{
	int i;
	for (i=p.grad;i>0;i--)
		if (p.coef[i]!=0)
			cout<<p.coef[i]<<"X^"<<i<<"+";
	if (p.coef[0]!=0)
		cout<<p.coef[0];
}
void Citire(polinom &p)
{
	int i;
	p.coef[0]=0;
	cout<<"Introduceti gradul polinomului: ";
	cin>>p.grad;
	for(i=p.grad;i>=0;i--)
	{
		cout<<"Coeficientul lui X^"<<i<<": ";
		cin>>p.coef[i];
	}
}
void Suma(polinom p1,polinom p2,polinom &s)
{
	int i;
	s.grad=0;
	s.coef[0]=0;
	if (p1.grad>=p2.grad)
	{
		for (i=p2.grad;i>=0;i--)
			s.coef[i]=p1.coef[i]+p2.coef[i];
		for(i=p1.grad;i>p2.grad;i--)
			s.coef[i]=p1.coef[i];
		s.grad=p1.grad;
	}
	else
	{
		for (i=p1.grad;i>=0;i--)
			s.coef[i]=p1.coef[i]+p2.coef[i];
		for(i=p2.grad;i>p1.grad;i--)
			s.coef[i]=p2.coef[i];
		s.grad=p2.grad;
	}
}
void Inmultire(polinom p1,polinom p2,polinom &P)
{
	int i,j;
	P.grad=p1.grad+p2.grad;
	for (i=0;i<=P.grad;i++) 
		P.coef[i]=0;
	for (i=p1.grad;i>=0;i--)
		for (j=p2.grad;j>=0;j--)
			P.coef[i+j]+=p1. coef[i]*p2.coef[j];
}
void main(void)
{
	polinom p,q,s,s1;
	cout<<"Primul polinom: "<<endl;
	Citire(p);
	cout<<"Al doilea polinom: "<<endl;
	Citire(q);
	cout<<"Polinomul Suma este: "<<endl;
	Suma(p,q,s1);
	Afisare(s1);
	cout<<endl;
	cout<<"Polinomul produs: "<<endl;
	Inmultire(p,q,s);
	Afisare(s);
	int a;
	cin>>a;
}