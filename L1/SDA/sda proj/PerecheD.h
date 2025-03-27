#ifndef PRD_H
#define PRD_H

class PerecheD//o pereche cuvant-explicatie din dictionar
{
	char* cuvant;
	char* explicatie;
public:
	PerecheD();
	~PerecheD();
	char* getCuvant();
	char* getExplicatie();
	void setCuvant(char* n);
	void setExplicatie(char* n);
};

#endif