program lab3pb2;
type matrice=array[1..10,1..10] of integer;
function prim(nr:word):boolean;
var i:byte;k:boolean;
begin
     i:=2;
     k:=true;
     if nr mod 2=0 then
      k:=false
      else
       while( k  and (i<=trunc(sqrt(nr))))  do
        begin
         if nr mod i =0 then
           k:=false;
         i:=i+1;
        end;
     prim:=k;
end;
function elem(n:byte):byte;
var d,i,c:byte;
    begin
    i:=4;c:=0;
    while (c<n) do
     begin
      c:=c+1;
      if c=n then
       elem:=i;
      for d:=2 to i div 2 do
       if i mod d=0 then
         begin
          c:=c+1;
          if c=n then
           elem:=d;
         end;
      if (prim(i+1)) then
       i:=i+2
        else
         i:=i+1;
     end;
end;
procedure generare(var a:matrice;n:byte);
var i,j:byte;
begin
     for i:=1 to n do
      for j:=1 to n do
       a[i,j]:=elem((i-1)*n+j);
end;
procedure afisare(a:matrice;n:byte);
var i,j:byte;
begin
     for i:=1 to n do
      begin
       for j:=1 to n do
        begin
         write(a[i,j]);
         write(' ');
        end;
       writeln(' ');
      end;
end;
var a:matrice;n:byte;
begin
     writeln('n=');
     readln(n);
     generare(a,n);
     afisare(a,n);
end.