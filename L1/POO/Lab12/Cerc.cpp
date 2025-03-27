#include"Cerc.h"
#define pi 3.14159
#include<iostream>
#include<iomanip>
using namespace std;

float Cerc::Arie()
{
	return pi*raza*raza;
}
float Cerc::Perimetru()
{
	return 2*pi*raza;
}
void Cerc::Muta(float p, float q)
{
	centru.setX(centru.getX()+p);
	centru.setY(centru.getY()+q);
}
void Cerc::CitCoord()
{
	float x,y;
	cout<<"Dati coordonatele centrului cercului forma 'x y'"<<endl;
	cin>>x>>y;
	centru.setX(x);centru.setY(y);
	cout<<"Dati raza: "<<endl;
	cin>>x;
	this->raza=x;
}
void Cerc::AfisCoord()
{
	cout<<"["<<centru.getX()<<","<<centru.getY()<<"] , "<<raza<<endl;;
}


