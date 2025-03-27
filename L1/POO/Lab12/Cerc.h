#ifndef CERC_H
#define CERC_H
#include"Shape.h"
#include"Punct.h"

class Cerc:public Shape
{
	Punct centru;
	float raza;
public:
	Cerc(){raza=0;};
	~Cerc(){raza=0;};
	void Muta(float,float);
	void CitCoord();
	void AfisCoord();
	float Perimetru();
	float Arie();
};
#endif
