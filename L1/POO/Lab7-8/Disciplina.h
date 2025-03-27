 #include<iostream>

class Disciplina
{
private:
	char* titlu;
	char* nume_profesor;
public:
	Disciplina();
	void setTitlu(char* t);
	void setProfesor(char* n);
	char* getTitlu();
	char* getProfesor();
	~Disciplina();
};