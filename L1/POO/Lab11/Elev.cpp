#include"Elev.h"
#include<string.h>
#include<stdlib.h>
#include<iostream>
using namespace std;
Elev::Elev()
{
	char* nume=new char[20];
	nota=0;
}
Elev::~Elev()
{
	if (!nume)
		delete[] nume;
}
	
