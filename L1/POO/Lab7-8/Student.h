#include<iostream>

class Student
{
private:
	char* nume;
	int matricol;
public:
	Student();
	void SetNume(char* n);
	void SetMatricol(int m);
	char* GetNume();
	int GetMatricol();
	~Student();
};