Unit MATRICER;
Interface
type sir=array[1..100] of integer;
type matrice=array[1..100,1..100] of integer;
type matrara=record n,m,np:integer;
                    l,c,v:sir;
             end;
procedure creare_matr(var A:matrara);
procedure adunare_matr(var A,B,C:matrara);
procedure prod_matr_scalar(var A:matrara;x:integer);
procedure scadere_matr(var A,B,C:matrara);
procedure afisare_matr(var A:matrara);
function  egale(var A,B:matrara):boolean;
Procedure  el_max(var A:matrara;var l,c,x:integer);
Procedure  el_min(var A:matrara;var l,c,x:integer);
procedure to_matrara(var A:matrice;n,m:integer;var B:matrara);
procedure introducere_val(var A:matrara);  // procedure mai are nevoie de o functie de validare pozitie pentru a fi completa    (daca nu e ocupata pozitia pe                                                       care se doreste inroducerea de valori)
Implementation
function valid(a,b:integer):boolean;
begin
     valid:=true;
     if (a>b) or (a<1) then
      valid:=false;
end;
procedure introducere_val;
var i,k,ln,cl,val:integer;
begin
     k:=1;
     while k=1 do
      begin
       writeln('Introduceti linia si coloana pe care doriti sa introduceti val: ');
       read(ln,cl);
       if (not valid(ln,A.n)) or (not valid(cl,A.m)) then
          writeln('Valori introduse gresit, reintroduceti ');
          repeat
           begin
            writeln('Repetati introducerea datelor: ');
            read(ln,cl);
           end;
          until (ln<=A.n) and (ln>=1) and (cl<=A.m) and (cl>=1);
       write('Introduceti valoarea care va fi introdusa pe pozitia: [');
       write(ln);write(',');write(cl);writeln('] : ');
       read(val);
         inc(A.np);
         A.l[A.np]:=ln;
         A.c[A.np]:=cl;
         A.v[A.np]:=val;
       writeln('Tastati 1 daca doriti sa mai introduceti valori si 0 altfel');
       readln(k);
      end;
end;
procedure afisare_matr;
var i:byte;
begin
  for i:=1 to A.np do
   begin
    write('Pe pozitia [');write(A.l[i]);write(',');write(A.c[i]);write('] se afla valoarea: ');write(A.v[i]);
    writeln;
   end;
end;
procedure creare_matr(var A:matrara);
var i:byte;
begin
     writeln('Dati numarul de linii: ');
     readln(A.n);
     writeln('Dati numarul de coloane: ');
     readln(A.m);
     writeln('Dati numarul de valori(perechi) : ');
     readln(A.np);
     for i:=1 to A.np do
      begin
       writeln('Dati linia elementului, coloana, si elementul ');
       read(A.l[i]);
       read(A.c[i]);
       read(A.v[i]);
       if not valid(A.l[i],A.n) or not valid(A.c[i],A.m) then
        begin
         writeln('Ati introdus gresit datele, reluati ');
         dec(i);
        end;
      end;
end;
procedure elimina_element(var v:sir;n:integer;i:byte);
var j,j1:byte;
begin
     for j:=i to n-1 do
        v[j]:=v[j+1];
end;
procedure adunare_matr(var A,B,C:matrara);
var i,j:byte;
begin
     if (A.n<>B.n) or (A.m<>B.m) then
       writeln('Matricile nu au acealeasi dimensiuni ')
      else
       begin
        C.n:=A.n;
        C.m:=A.m;
        C.np:=0;
        for i:=1 to A.np do
         begin
          C.l[i]:=A.l[i];
          C.c[i]:=A.c[i];
          C.v[i]:=A.v[i];
          inc(C.np);
         end;
        inc(C.np);
        for i:=1 to B.np do
         begin
          C.l[C.np]:=B.l[i];
          C.c[C.np]:=B.c[i];
          C.v[C.np]:=B.v[i];
          inc(C.np);
         end;
        dec(C.np);
        for i:=1 to C.np-1 do
         for j:=i+1 to C.np  do
          if (C.l[i]=C.l[j]) and (C.c[i]=C.c[j]) then
            begin
             C.v[i]:=C.v[i]+C.v[j];
             elimina_element(C.l,C.np,j);
             elimina_element(C.c,C.np,j);
             elimina_element(C.v,C.np,j);
             dec(C.np);
            end;
       end;
end;
procedure prod_matr_scalar(var A:matrara;x:integer);
var i:byte;
begin
     for i:=1 to A.np do
      A.v[i]:=A.v[i]*x;
end;
procedure scadere_matr(var A,B,C:matrara);
var i,j:byte;
begin
     if (A.n<>B.n) or (A.m<>B.m) then
       writeln('Matricile nu au acealeasi dimensiuni ')
      else
       begin
        C.n:=A.n;
        C.m:=A.m;
        C.np:=0;
        for i:=1 to A.np do
         begin
          C.l[i]:=A.l[i];
          C.c[i]:=A.c[i];
          C.v[i]:=A.v[i];
          inc(C.np);
         end;
        inc(C.np);
        for i:=1 to B.np do
         begin
          C.l[C.np]:=B.l[i];
          C.c[C.np]:=B.c[i];
          C.v[C.np]:=B.v[i];
          inc(C.np);
         end;
        dec(C.np);
        for i:=1 to C.np-1 do
         for j:=i+1 to C.np  do
          if (C.l[i]=C.l[j]) and (C.c[i]=C.c[j]) then
            begin
             C.v[i]:=C.v[i]-C.v[j];
             elimina_element(C.l,C.np,j);
             elimina_element(C.c,C.np,j);
             elimina_element(C.v,C.np,j);
             dec(C.np);
            end;
       end;
end;
Function egale(var A,B:matrara):boolean;
var i:byte;
begin
   egale:=true;
   if A.np<>B.np then
    egale:=false
    else
     for i:=1 to A.np do
      if (A.l[i]<>B.l[i]) or (A.c[i]<>B.c[i]) then
       egale:=false
       else
        if A.v[i]<>B.v[i] then
         egale:=false;
end;
procedure el_max(var A:matrara;var l,c,x:integer);
var i:byte;
begin
     x:=-32000;
     for i:=1 to A.np do
      if A.v[i] >x then
       begin
         x:=A.v[i];
         c:=A.c[i];
         l:=A.l[i];
       end;
end;
procedure el_min(var A:matrara;var l,c,x:integer);
var i:byte;
begin
     x:=32000;
     for i:=1 to A.np do
      if A.v[i] <x then
       begin
         x:=A.v[i];
         c:=A.c[i];
         l:=A.l[i];
       end;
end;
procedure to_matrara;
var i,j:byte;
begin
     B.n:=n;
     B.m:=m;
     B.np:=0;
     for i:=1 to n do
      for j:=1 to m do
       if A[i,j]<>0 then
        begin
         inc(B.np);
         B.l[B.np]:=i;
         B.c[B.np]:=j;
         B.v[B.np]:=A[i,j];
        end;
end;
end.