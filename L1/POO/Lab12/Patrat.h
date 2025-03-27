#ifndef PTR_H
#define PTR_H
#include"Shape.h"
#include"Punct.h"

class Patrat:public Shape
{
	Punct coord[4];
public:
	Patrat();
	void Muta(float,float);
	void CitCoord();
	void AfisCoord();
	float Perimetru();
	float Arie();
	~Patrat();

};

#endif