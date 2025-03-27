#include"Dictionar.h"
#include<iostream>
using namespace std;

Iterator::Iterator(Dictionar*_d)
{
	current=0;
	this->d=_d;
}
Iterator::~Iterator()
{
	delete d;
}
PerecheD Iterator::getElem()
{
	return d->getPereche(current);
}
int Iterator::hasNext()
{
	if (current ==d->getLength())
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