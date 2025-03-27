#include "Rezultat.h"
#include<iostream>
using namespace std;
Rezultat::Rezultat()
{
	matricol_student=0;
	rezultat=-1;
}
void Rezultat::setMatricolS(int n) 
{ 
	matricol_student=n;
} 
void Rezultat::setRezultat(int m)
{ 
	rezultat=m; 
} 
int Rezultat::getMatricolS()
{ 
	return matricol_student;
} 
int Rezultat::getRezultat() 
{ 
	return rezultat;
} 
Rezultat::~Rezultat() 
{ 
}
