program lab6pb20;
type sir=array[1..100] of integer ;
procedure citire_sir(var s:sir;var n:integer);
var i:byte;
begin
     i:=0;
     repeat
      begin
       inc(i);
       readln(s[i]);
      end;
     until s[i]=0;
     n:=i-1;
end;
procedure afisare_sir(s:sir;n:integer);
var i:byte;
begin
     if n<=0 then
       writeln('Sirul nu are componente ')
      else
       for i:=1 to n do
         begin
          write(s[i]);
          write(' ');
         end;
end;
procedure elimina_e(var v:sir;var n:integer;i:byte);
var j:byte;
begin
          for j:=i to n do
             v[j]:=v[j+1];
          dec(n);
end;
procedure adauga_la_R(var R:sir;var ri:integer;val:integer);
var i:integer;
begin
     inc(ri);
     R[ri]:=val;
end;

function cautare_e(n:integer;v:sir;val:integer):boolean;
var i:byte;
begin
     cautare_e:=true;
     for i:=1 to n do
      if v[i]=val then
         cautare_e:=false;
end;
procedure elimina_neg(var v:sir;var n:integer;var R:sir;var ri:integer);
var i:byte;
begin
     for i:=1 to n do
      if v[i]<0 then
        begin
         if (cautare_e(ri,R,v[i])) then
           adauga_la_R(R,ri,v[i]);
         elimina_e(v,n,i);
         dec(i);
        end;
end;
procedure prelucrare_siruri(v:sir;var R:sir;var ri:integer);
var i,n:integer;
begin
     ri:=0;
     repeat
      begin
       writeln('Dati sirul terminandu-se cu 0: ');
       citire_sir(v,n);
       if v[1]=0 then break;
       writeln('Sirul citit este: ');
       afisare_sir(v,n);writeln;
       writeln;
       elimina_neg(v,n,R,ri);
       writeln('Sirul ramas este: ');
       afisare_sir(v,n);
       writeln;
      end;
    until (v[1]=0) and (n=1) ;
end;
VAR v,R:sir;ri,n:integer;
begin
     prelucrare_siruri(v,R,ri);
     writeln('Sirul valorilor distincte este: ');
     afisare_sir(R,ri);
end.