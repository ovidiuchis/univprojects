Program lab4pb6;
type sir=array[1..100] of integer;
procedure citire(var x:sir; var n:integer);
var i:integer;
begin
     write('Dati n ');readln(n);
     for i:=1 to n do
       readln(x[i]);
end;
procedure afisare(x:sir; s,d:integer);
var i:integer;
begin
     for i:=s to d do
       write(x[i],' ');
end;
function verif(x:sir; i,j:integer):boolean;
var p,el:integer;
begin
     el:=0;
     for p:=i to j-1 do
      if x[p]=x[j] then
       inc(el);
     if el>0 then
       verif:=false
      else
       verif:=true;
end;
procedure secv(x:sir;var n,i,el,j:integer);
begin
 while (el<=2) and (j<n) do
      begin
       if (verif(x,i,j+1)) then
        begin
         inc(el);
         if(el<=2) then
         inc(j);
        end
       else
        inc(j);
      end;
end;
procedure prelsir (x:sir;n:integer;var s,d:integer);
var i,j,el:integer;
begin
     i:=1;j:=1;s:=1;d:=1;
     while (j<n) do
      begin
       el:=1;
       secv(x,n,i,el,j);
       if (j-i>d-s) then
         begin
          d:=j;
          s:=i;
         end;
       inc(i);
       j:=i;
      end;
end;
var s,d,n:integer;x:sir;
begin
     citire(x,n);
     prelsir(x,n,s,d);
     write('Secventa : ');
     afisare(x,s,d);
     readln;
end.