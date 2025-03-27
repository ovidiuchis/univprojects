Uses Multimea;
procedure save_max(m:multime;var mx:multime);
begin
     if m.n>mx.n then
       copy(m,mx);
end;
procedure prelucrare(var i,r,mx:multime;var nrm:integer);
var m1,m2,aux:multime;
begin
     init(mx);
     init(r);
     nrm:=0;
     citire(m1);
     inc(nrm);
     if m1.n<>0 then
      begin
       save_max(m1,mx);
       citire(m2);
       inc(nrm);
       save_max(m2,mx);
       copy(m1,aux);
       while m2.n>0 do
        begin
         init(i);
         reuniune(m1,m2,r);
         copy(r,m1);
         intersectie(aux,m2,i);
         copy(i,aux);
         citire(m2);
         save_max(m2,mx);
         inc(nrm);
        end;
      end;
     dec(nrm);
end;
var i,r,mx:multime;nrm:integer;
begin
     prelucrare(i,r,mx,nrm);
     write('Reuniunea: ');
     afisare(r);writeln;
     write('Intersectia: ');
     afisare(i);writeln;
     write('Multimea cu cele mai mlte elemente: ');
     afisare(mx);writeln;
     write('Numar multimi citite: ');
     writeln(nrm);
end.