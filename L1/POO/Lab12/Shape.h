#ifndef SHAPE_H
#define SHAPE_H

class Shape{
public:
	virtual void Muta(float,float)=0;
	virtual void CitCoord()=0;
	virtual void AfisCoord()=0;
	virtual float Perimetru()=0;
	virtual float Arie()=0;
	virtual ~Shape(){};
};

#endif