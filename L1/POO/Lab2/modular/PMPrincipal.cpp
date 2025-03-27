#include"headerpol.h"
#include<iostream>
using namespace std;
void main(void)
{
	polinom p,q,s;
	cout<<"Primul polinom: "<<endl;
	Citire(p);
	cout<<"Al doilea polinom: "<<endl;
	Citire(q);
	cout<<"Polinomul produs: "<<endl;
	Inmultire(p,q,s);
	Afisare(s);
	int a;
	cin>>a;
}