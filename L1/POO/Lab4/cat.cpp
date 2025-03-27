#include "Cat.h"
struct _tabel{
	int n;
	El elem[25];
	CmpFun f;
};
void Init(tabel & t,CmpFun f)
{
	t=new  _tabel;
	t->n=0;
	t->f=f;
}
void Insert (tabel &t,El el)
{
	 if (Cauta(t,el)==-1)
	 {
		 t->elem[t->n]=el;
		 t->n++;
	 }
}
int Cauta (tabel t,El el)
{
	for (int i=0;i<t->n;i++)
		if (t->f(t->elem[i],el)==0)
			return i;
	return -1;
}
El GetElem(tabel t,int index)
{

		return t->elem[index];
}
int GetL(tabel t)
{
	return t->n;

}
void Sterge(tabel &t,El el)
{
	int index=Cauta(t,el);
	if (index!=-1)
	{
		for (int i=index;i<t->n-1;i++)
			t->elem[i]=t->elem[i+1];
	}
	t->n--;
}
void DeleteComponents(tabel &t)
{
	for (int i=0;i<GetL(t);i++)
		delete t->elem[i];
}
void Delete (tabel &t)
{
	delete t;
}
