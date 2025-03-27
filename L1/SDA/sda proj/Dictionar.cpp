#include"Dictionar.h"
#include"PerecheD.h"
#include<string.h>

Dictionar::Dictionar()
{
	length=0;
}
Dictionar::~Dictionar()
{
	length=0;
}
int Dictionar::belongs(PerecheD d)//verificarea apartenentei
{
	for (int i=0;i<length;i++)
		if(strcmp(inreg[i].getCuvant(),d.getCuvant())==0)
			return 1;
	return 0;
}
int Dictionar::Del(char * cuv)//elimina
{
	int poz,i;
	PerecheD aux;
	aux.setCuvant(cuv);
	if (!belongs(aux))
		return 0;
	else
	{
		for (i=0;i<length;i++)
		if(strcmp(inreg[i].getCuvant(),cuv)==0)
			poz=i;
		for (i=poz;i<length-1;i++)
			inreg[i]=inreg[i+1];
		length--;
		return 1;
	}
}
void Dictionar::Add(PerecheD d)//realizam o insertie, deodarece dictionarul este ordonat
{
	int i;
	if (!belongs(d))
	{
		if(strcmp(d.getCuvant(),inreg[0].getCuvant())<0)
		{
			for (i=length;i>=0;i--)
				inreg[i]=inreg[i-1];
			inreg[0]=d;
		}
		else
			if (strcmp(d.getCuvant(),inreg[length-1].getCuvant())>0)
				inreg[length]=d;
			else
			{
				i=0;
				while (strcmp(d.getCuvant(),inreg[i].getCuvant())>0)
					i++;
				for (int j=length;j>i;j--)
					inreg[j]=inreg[j-1];
				inreg[i]=d;
			}
	length++;
	}
}
Iterator* Dictionar::iterator()//iteratorul
{
	return new Iterator(this);
}
int Dictionar::getLength()
{
	return length;
}
int Dictionar::Modif(char *cuv,char* newexpl)//modifica explicatia unui civant
{
	int k=0;
	for (int i=0;i<length;i++)
		if (strcmp(inreg[i].getCuvant(),cuv)==0)
		{
			inreg[i].setExplicatie(newexpl);
			k=1;
		}
	if(k)
		return 1;
	return 0;
}
PerecheD Dictionar::getPereche(int index)//returneaza inregistrarea de la pozitia index
{
	return inreg[index];
}
char* Dictionar::getExplicatie(char* cuv)//retur exlicatia unui cuvant 
{
	for (int i=0;i<length;i++)
		if (strcmp(cuv,inreg[i].getCuvant())==0)
			return inreg[i].getExplicatie();
	return 0;
}