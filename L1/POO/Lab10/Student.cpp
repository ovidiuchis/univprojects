#include"Student.h"
#include<stdlib.h>
#include<string.h>


Student::Student(char* _nume,int _mat)
{
	nume=_nume;
	matricol=_mat;
}
char* Student::GetNume()
{
	return nume;
}
int Student::GetMatricol()
{
	return matricol;
}
Student::Student()
{
	nume=new char[20];
	
}
Student::~Student()
{
	delete[] nume;
	matricol=0;
}
int Student::equals(Object *e)
{
	return matricol==((Student*)e)->matricol;
}
char* Student::toString()
{
	char* buf=new char[30];
	buf[0]='\0';
	char aux[20];
	itoa(matricol,aux,10);
	strcat(buf,aux);
	strcat(buf,"\n");
	strcat(buf,nume);
	return buf;
}