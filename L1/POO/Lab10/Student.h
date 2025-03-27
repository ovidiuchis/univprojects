#ifndef STUD_H
#define STUD_H
#include"Object.h"
#include<iostream>
using namespace std;


class Student:public Object
{
private:
	char* nume;
	int matricol;
public:
	Student();
	Student(char*,int);
	char* GetNume();
	void SetMatricol(int n){matricol=n;};
	void SetNume(char* n){nume=n;};
	int GetMatricol();
	int equals(Object *);
	char* toString();
	~Student();
};
#endif