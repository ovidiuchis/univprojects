#include"Punct.h"
#include<math.h>

Punct::Punct()
{
	x=y=0;
}
Punct::~Punct()
{
	x=y=0;
}
float Punct::Distanta(Punct p)
{
	return sqrt(pow((p.getX()-x),2)+pow((p.getY()-y),2));
}
