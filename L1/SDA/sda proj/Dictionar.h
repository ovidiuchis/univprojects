#ifndef DICT_H
#define DICT_H
#include"PerecheD.h"
class Iterator;
class Dictionar
{
	PerecheD inreg[30];
	int length;
public:
	Dictionar();
	~Dictionar();
	void Add(PerecheD);//adauga o pereche cuvant--explicatie
	int Del(char*);//elimina perechea al carui cuvant este specificat de parametru
	int Modif(char*,char*);//modifica explicatia cuvantului specificat de primull parametru la char specificat de al doilea
	int belongs(PerecheD);//verifica daca perechea specificata prin parametru apartine dictionarului
	int getLength();//returneaza numarul de perechi din dictionar
	PerecheD getPereche(int);//returneaza perechea de pe pozitia specificata de parametru
	char* getExplicatie(char*);//va returna explicatia cuvantului specificat prin parametru
	Iterator* iterator();//returneaza un iterator pe structura dictionar
};

class Iterator 
{
	Dictionar* d;
	int current;
public:
	Iterator(Dictionar* d);
	PerecheD getElem();
	int hasNext();
	void next();
	void setToFirst();
	~Iterator();
};
#endif