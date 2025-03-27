typedef int Elem;
class NodT  
{
	Elem* elem;
	NodT* urm;
	NodT* pred;
public:
	NodT();
	NodT(Elem*, NodT*, NodT*);
	Elem* getElem();
	void setElem(Elem*);
	NodT* getUrm();
	void setUrm(NodT*);
	NodT* getPred();
	void setPred(NodT*);
	~NodT();

};
