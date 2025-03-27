typedef void *El;
typedef int (*CmpFun)(El,El);

struct _tabel;

typedef _tabel *tabel;

void Init(tabel &,CmpFun );
void Insert(tabel &,El);
int Cauta(tabel ,El);
El GetElem(tabel,int);
int GetL(tabel);
void Sterge(tabel &t,El el);
void Delete (tabel &);
void DeleteComponents(tabel &t);

