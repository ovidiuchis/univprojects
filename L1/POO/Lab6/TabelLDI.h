#include "NodT.h"

class TabelLDI
{
	int length;
	NodT* cap_tabel;
public:
	TabelLDI();
	~TabelLDI();
	void Insert(Elem);
	void Elimina(Elem);
    int GetLength();
	int Cauta(Elem);
	TabelLDI* ReuniuneMultimi(TabelLDI&);
	TabelLDI* IntersectieMultimi(TabelLDI&);
	NodT* getCTab();
};
