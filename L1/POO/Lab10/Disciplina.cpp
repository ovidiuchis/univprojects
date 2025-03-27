#include"Disciplina.h"


int Disciplina::equals(Object *o)
{
	return !strcmp(titlu,((Disciplina*)o)->titlu);
}
char* Disciplina::getTitlu()
{
	return titlu;
}
char* Disciplina::getProfesor()
{
	return nume_profesor;
}
Disciplina::Disciplina()
{
	titlu=new char[30];
	nume_profesor=new char[20];
}
Disciplina::~Disciplina()
{
	delete[] titlu;
	delete[] nume_profesor;
}
char* Disciplina::toString()
{
	char *buf=new char[50];
	strcpy(buf,titlu);
	strcat(buf,"\n");
	strcat(buf,nume_profesor);
	return buf;
}
