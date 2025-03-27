#include<iostream>
using namespace std;
class Complex{
	int real;
	int imaginar;
public:
	Complex();
	Complex(int,int);
	~Complex();
	int getReal();
	int getImaginar();
	void setReal(int);
	void setImaginar(int);
};

class Rational{
	int sus,jos;
public:
	Rational();
	Rational(int,int);
	~Rational();
	int getSus();
	int getJos();
	void setSus(int);
	void setJos(int);
};
