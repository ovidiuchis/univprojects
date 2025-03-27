#include"Rational_Complex.h"
#include<iostream>
using namespace std;

Complex::Complex()
{
	real=imaginar=0;
}
Complex::Complex(int r, int i)
{
	real=r;imaginar=i;
}
int Complex::getImaginar()
{
	return imaginar;
}
int Complex::getReal()
{
	return real;
}
void Complex::setImaginar(int i)
{
	imaginar=i;
}
void Complex::setReal(int r)
{
	real=r;
}
Complex::~Complex()
{
	real=imaginar=0;
}
Rational::Rational()
{
	sus=jos=0;
}
Rational::Rational(int s, int j)
{
	sus=s;
	jos=j;
}
int Rational::getJos()
{
	return jos;
}
int Rational::getSus()
{
	return sus;
}
void Rational::setJos(int j)
{
	jos=j;
}
void Rational::setSus(int s)
{
	sus=s;
}
Rational::~Rational()
{
	sus=jos=0;
}
