#include"Lista.h"
#include<iostream>
using namespace std;
#include"Shape.h"

Iterator::Iterator(Lista *_l)
{
	current=0;
	this->l=_l;
}
Iterator::~Iterator()
{
	delete l;
}
Shape* Iterator::getElem()
{
	return l->getElem(current);
}
int Iterator::hasNext()
{
	if (current ==l->getLength())
		return 0;
	return 1;
}
void Iterator::next()
{
	if (this->hasNext())
		current++;
}
void Iterator::setToFirst()
{
	current=0;
}