Unit Multimea;
Interface
type vector=array[1..100] of integer;
type multime=record
                   n:integer;
                   e:vector;
             end;
procedure init(var m:multime);
procedure adauga(var m:multime;e:integer);
procedure citire(var m:multime);
procedure intersectie( m1,m2:multime;var m3:multime);
procedure reuniune(m1,m2:multime;var m3:multime);
function exista(var m:multime;el:integer):boolean;
procedure copy(m1:multime;var m2:multime);
procedure afisare(var m:multime);
Implementation
procedure afisare;
var i:byte;
begin
     for i:=1 to m.n do
      begin
       write(m.e[i]);
       write(' ');
      end;
end;
procedure init;
begin
     m.n:=0;
end;
procedure copy;
var i:byte;
begin
     init(m2);
     for i:=1 to m1.n do
        begin
         inc(m2.n);
         m2.e[m2.n]:=m1.e[i];
        end;
end;
function exista;
var i:byte;
begin
     i:=1;
     while (i<=m.n) and (m.e[i]<>el) do
      inc(i);
     exista:=(i<=m.n);
end;
procedure adauga;
begin
     if not exista(m,e) then
      begin
       inc(m.n);
       m.e[m.n]:=e;
      end;
end;
procedure reuniune;
var i:byte;
begin
     for i:=1 to m1.n do
       m3.e[i]:=m1.e[i];
     m3.n:=m1.n;
     for i:=1 to m2.n do
      adauga(m3,m2.e[i]);
end;
procedure intersectie;
var i:byte;
begin
     for i:=1 to m1.n do
       if exista(m2,m1.e[i]) then
          adauga (m3,m1.e[i]);
     for i:=1 to m2.n  do
       if exista(m1,m2.e[i]) then
          adauga (m3,m2.e[i]);
end;
procedure citire;
var e:integer;
begin
     init(m);
     read(e);
     while e<>-1 do
      begin
       adauga(m,e);
       read(e);
      end;
end;
end.

