Unit Cmplx;
Interface
type complex=record
                   a,b:real;
             end;
procedure SetReal(var z:complex;v:real);
procedure SetImag(var z:complex;v:real);
Function GetReal(z:complex):real;
Function GetImag(z:complex):real;
Function Modul(z:complex):real;
procedure Adunare(z1,z2:complex;var z3:complex);
function Zero(var z:complex):boolean;
Implementation
function Zero;
begin
     Zero:=false;
     if (z.a=0) and (z.b=0) then
       Zero:=true;
end;
procedure SetReal;
begin
     z.a:=v;
end;
procedure SetImag;
begin
     z.b:=v;
end;
Function GetReal;
begin
     GetReal:=z.a;
end;
Function GetImag;
begin
     GetImag:=z.b;
end;
Function Modul;
begin
     Modul:=sqrt(z.a*z.a+z.b*z.b);
end;
procedure Adunare;
begin
     z3.a:=z1.a+z2.a;
     z3.b:=z1.b+z2.b;
end;
end.