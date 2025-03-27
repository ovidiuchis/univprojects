#include"Lista.h"
class Catalog
{
	char* titlu_disciplina;
	Lista* R;
public:
	Catalog();
	~Catalog();
	char* getTitluD();
	void setTitluD(char* t);
	void setLista(Lista* l);
	Lista* getLista();
};
