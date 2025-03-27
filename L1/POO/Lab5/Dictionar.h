typedef void *Key;
typedef void *Value;
struct _Dictionar;
typedef _Dictionar *Dictionar;
typedef int(*CmpFun)(Key,Key);
void Init(Dictionar &,CmpFun);
void Adauga(Dictionar &,Key,Value);
void Elimina(Dictionar &, Key);
void Modifica(Dictionar &,Key,Value);
int GetLength(Dictionar);
Key GetKey(Dictionar ,int );
Value GetValue(Dictionar ,int );
void DeleteD(Dictionar &);
int Search(Dictionar ,Key );


