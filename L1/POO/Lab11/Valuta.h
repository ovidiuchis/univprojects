#ifndef VL_H
#define VL_H

class Valuta{
	char* numev;
	float val_ron;
public:
	Valuta();
	~Valuta();
	float getValRon();
	char* getNumeV();
	void setValRon(float);
	void setNumeV(char*);
};
#endif