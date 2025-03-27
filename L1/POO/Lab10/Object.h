#ifndef OBJ_H
#define OBJ_H
class Object {
public:
	virtual int equals(Object*)=0;
	virtual char* toString()=0;
	virtual ~Object(){};
};
#endif