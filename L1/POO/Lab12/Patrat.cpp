#include"Patrat.h"
#include<math.h>
#include<iostream>
#include<iomanip>
using namespace std;

Patrat::Patrat()
{

}
float Patrat::Arie()
{
	return pow(coord[1].Distanta(coord[2]),2);
}
float Patrat::Perimetru()
{
	return 4*coord[1].Distanta(coord[2]);
}
void Patrat::Muta(float _x, float _y)
{
	for (int i=0;i<4;i++)
	{
		coord[i].setX(coord[i].getX()+_x);
		coord[i].setY(coord[i].getY()+_y);
	}
}
void Patrat::CitCoord()
{
	float p,q;
	for (int i=0;i<4;i++)
	{
		cout<<"Dati coordonatele punctului "<<i+1<<" in forma 'x y'"<<endl;
		cin>>p>>q;
		coord[i].setX(p);coord[i].setY(q);
	}
}
void Patrat::AfisCoord()
{
	for (int i=0;i<4;i++)
		cout<<"["<<coord[i].getX()<<","<<coord[i].getY()<<"] , ";
	cout<<endl;
}
Patrat::~Patrat()
{
}
