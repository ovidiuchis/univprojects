typedef void* Elem;
class Nod  
{
	Elem elem;
	Nod* urm;
	//Nod* pred;
public:
	Nod();
	Nod(Elem, Nod*);
	Elem getElem();
	void setElem(Elem);
	Nod* getUrm();
	void setUrm(Nod*);
	/*Nod* getPred();
	void setPred(Nod*);*/
	~Nod();

};