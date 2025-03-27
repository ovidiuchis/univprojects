#ifndef PUNCT_H
#define PUNCT_H

class Punct{
	float x,y;
public:
	Punct();
	~Punct();
	float getX(){return x;};
	float getY(){return y;};
	float Distanta(Punct);
	void setX(float _x){x=_x;};
	void setY(float _y){y=_y;};
};

#endif