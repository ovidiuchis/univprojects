class Rezultat
{ 
private: 
	int matricol_student; 
	int rezultat; 
public:
	Rezultat();
	void setMatricolS(int n);
	void setRezultat(int m);
	int getMatricolS();
	int getRezultat();
	int showRezultat(int nrm);
	~Rezultat();
};