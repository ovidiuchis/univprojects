program lab5pb11;
type multime=set of 0..9;
type sir=array[1..100]of integer;
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
     for i:=1 to n do
      begin
       write(s[i]);
       write(' ');
      end;
end;
procedure desc_nr(nr:integer;var A:multime);
begin
     A:=[];
     while(nr<>0) do
      begin
       A:=A+[nr mod 10];
       nr:=nr div 10;
      end;
end;
function nr_inrudite(nr1,nr2:integer):boolean;
var A,B:multime;i,k:integer;
begin
   k:=0;
   desc_nr(nr1,A);
   desc_nr(nr2,B);
   for i:=0 to 9 do
    if i in A*B then
     inc(k);
   if(k>=2) then
     nr_inrudite:=true
    else
     nr_inrudite:=false;
end;
procedure Secv(v:sir; n,i:integer; var l:integer);
var ok:boolean;
begin
    l:=0;
    ok:=true;
    while (i<n) and (l<n-i+1) and ok do
       if nr_inrudite(v[i],v[i+1]) then
        begin
         inc(l);
         inc(i);
        end
       else ok:=false;
end;
procedure DetSecvC(v:sir; n:integer; var s,lmax:integer);
var l,i:integer;
begin
    s:=1; lmax:=0; i:=1;
    while (i<n) do
    begin
       Secv(v,n,i,l);
       if (l>lmax) then
       begin
          s:=i;
          lmax:=l;
       end;
       if (l>0) then
         i:=i+l
       else i:=i+1;
    end;
end;
procedure afisare_secventa(var v:sir;s,l:integer);
var i:byte;
begin
    begin
       for i:=s to s+l do
       write(v[i],' ');
       writeln;
    end
end;
procedure pune_in_X(var X:sir;v:sir;s,l:integer;var xi:integer);
var i:integer;
begin
     for i:=s to s+l do
      begin
       X[xi]:=v[i];
       inc(xi);
      end;
end;
procedure prelucrare_siruri(v:sir;var X:sir;var xi:integer);
var i,s,l,n:integer;
begin
     xi:=1;
     repeat
      begin
       writeln('Dati sirul terminandu-se cu 0: ');
       citire_sir(v,n);
       if v[1]=0 then break;
       writeln('Sirul citit este: ');
       afisare_sir(v,n);writeln;
       writeln;
       DetSecvC(v,n,s,l);
       pune_in_X(X,v,s,l,xi);
       writeln('Secventa cautata dir sir este: ');
       afisare_secventa(v,s,l);
      end;
    until v[1]=0;
end;
procedure elimina_element(var v:sir;n:integer;i:byte);
var j,j1:byte;
begin
     for j:=i to n-1 do
        v[j]:=v[j+1];
end;
procedure sir_distinct(var v:sir;var n:integer);
var i,j,k:byte;
begin
     k:=0;
     for i:=1 to n-1 do
      for j:=i+1 to n  do
       if v[i]=v[j] then
        begin
         elimina_element(v,n,j);
         dec(n);
        end;
end;
VAR v,X:sir;i,xi:integer;
begin
     prelucrare_siruri(v,X,xi);
     sir_distinct(X,xi);
     writeln('Sirul valorilor distincte din secvente este: ');
     afisare_sir(X,xi-1);
end.