typedef struct{ 
	int grad;
	int coef[25];
}polinom;
void Afisare(polinom);
void Citire(polinom &);
void Inmultire(polinom,polinom,polinom &);
