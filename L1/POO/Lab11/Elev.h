#ifndef ELV_H
#define ELV_H

class Elev
{
	char* nume;
	int nota;
public:
	Elev();
	~Elev();
	char* getNume(){return nume;};
	int getNota(){return nota;};
	void setNume(char* n){nume=n;};
	void setNota(int n){nota=n;};
};
#endif





