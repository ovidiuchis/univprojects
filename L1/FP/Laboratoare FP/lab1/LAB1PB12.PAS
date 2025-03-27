program lab1pb12;
Function prim(n:word):boolean;  {det daca un numar este prim sau nu }
Var o:byte;
begin
 prim:=true;
 if (n=1) or (n=0)   then
  prim:=false
  else
   for o:=2 to n div 2 do
    if n mod o=0  then
     prim:=false
end;
Procedure det_n(n:integer) ;
Var i,j,k,atr:integer;
begin
 j:=3;i:=0;
 if n=1 then
  writeln(2)
  else
   begin
    while i<n-1 do
     begin
      for k:=2 to  j do
       if (prim(k)=true)  and (j mod k=0)  then
         begin
          i:=i+1;
          atr:=k;
         end;
      j:=j+1;
     end;
    writeln(atr);           {afiseaza termenul cautat}
   end;
end;
Var n:integer;
begin
 writeln('dati n=');
 readln(n);
 det_n(n)
end.