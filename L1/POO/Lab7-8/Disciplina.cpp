#include "disciplina.h"
#include<iostream>
using namespace std;

void Disciplina::setTitlu(char* t)
{
	titlu=t;
}
void Disciplina::setProfesor(char* n)
{
	nume_profesor=n;
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