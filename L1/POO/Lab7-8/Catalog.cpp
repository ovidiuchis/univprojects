#include"Catalog.h"
#include<iostream>
using namespace std;


Catalog::Catalog()
{
	this->titlu_disciplina=new char[30];
	this->R=new Lista(0);
}
Catalog::~Catalog()
{
	delete[] titlu_disciplina;
	delete R;
}
char* Catalog::getTitluD()
{
	return titlu_disciplina;
}
void Catalog::setTitluD(char* t)
{
	titlu_disciplina=t;
}
void Catalog::setLista(Lista* l)
{
	this->R=l;
}
Lista* Catalog::getLista()
{
	return this->R;
}
