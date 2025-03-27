#ifndef DISC_H
#define DISC_H
#include<iostream>
#include"Object.h"

class Disciplina:public Object
{
private:
	char* titlu;
	char* nume_profesor;
public:
	Disciplina();
	Disciplina(char *_titlu,char* _nume_prof):titlu(_titlu),nume_profesor(_nume_prof){};
	void setProfesor(char *n){nume_profesor=n;};
	void setTitlu(char* t){titlu=t;};
	char* getTitlu();
	char* getProfesor();
	int equals(Object *);
	char* toString();
	~Disciplina();
};
#endif