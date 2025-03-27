#include"PerecheD.h"
#include<string.h>

PerecheD::PerecheD()
{
	cuvant=new char[20];
	explicatie=new char[50];
}
PerecheD::~PerecheD()
{
	if(!cuvant)
		delete[]cuvant;
	if(!explicatie)
		delete[] explicatie;
}
char* PerecheD::getCuvant()
{
	return cuvant;
}
char* PerecheD::getExplicatie()
{
	return explicatie;
}
void PerecheD::setCuvant(char* cuv)
{
	cuvant=cuv;
}
void PerecheD::setExplicatie(char* exp)
{
	explicatie=exp;
}