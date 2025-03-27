#include"Dictionar.h"

struct _Dictionar{
	Key keys[25];
	Value vals[25];
	int length;
	CmpFun f;
};
void Init(Dictionar &d,CmpFun fun)
{
	d=new _Dictionar;
	d->length=0;
	d->f=fun;
}
int Search(Dictionar d,Key ch)
{
	for (int i=0;i<d->length;i++)
		if (d->f(d->keys[i],ch)==0)
			return i;
	return -1;
}
void Modifica(Dictionar &d,Key ch,Value newval)
{
	int index=Search(d,ch);
	if (index!=-1)
		d->vals[index]=newval;
}
void Adauga(Dictionar &d,Key ch,Value val)
{
	if(Search(d,ch)==-1)
	{
		d->keys[d->length]=ch;
		d->vals[d->length]=val;
		d->length=d->length+1;
	}
}
void Elimina(Dictionar &d,Key ch)
{
	int index=Search(d,ch);
	if (index!=-1)
	{
		for (int i=index;i<d->length-1;i++)
		{
			d->keys[i]=d->keys[i+1];
			d->vals[i]=d->vals[i+1];
		}
		d->length--;
	}
}
Value GetValue(Dictionar d,int index)
{
	if (index<d->length)
		return d->vals[index];
}
Key GetKey(Dictionar d,int index)
{
	if (index<d->length)
		return d->keys[index];
}
int GetLength(Dictionar d)
{
	return d->length;
}
void DeleteD(Dictionar &d)
{
	delete d;
	d->length=0;
}