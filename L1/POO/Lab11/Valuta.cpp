#include"Valuta.h"

Valuta::~Valuta()
{
	if (!numev)
		delete [] numev;
}
Valuta::Valuta()
{
	numev=new char[20];
	val_ron=0;
}
char* Valuta::getNumeV()
{return numev;}
float Valuta::getValRon()
{return val_ron;}
void Valuta::setNumeV(char *n)
{
	numev=n;
}
void Valuta::setValRon(float f)
{
	val_ron=f;
}
