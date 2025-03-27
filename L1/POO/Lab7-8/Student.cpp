#include "student.h"
#include<iostream>
#include<string.h>
using namespace std;

void Student::SetNume(char* n)
{
	nume=n;
}
void Student::SetMatricol(int m)
{
	matricol=m;
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

