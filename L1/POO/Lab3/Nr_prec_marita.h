typedef struct
{
	int noCif;
	int *Cif;
}intpm;
void Suma(intpm n1,intpm n2,intpm &s);
int GetnoCif(intpm nr);
int GetCif(intpm nr,int poz);
void SetnoCif(intpm &nr,int n);
void SetCif(intpm &nr,int *pt);
void Dealoc(intpm &nr);
void InitSum(intpm &s);
void Init(intpm &nr);
int Cmp(intpm nr1,intpm nr2);
void Sort (intpm *z,int nrm);

