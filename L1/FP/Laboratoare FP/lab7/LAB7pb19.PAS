program lab7;
type polinom=record
               grad:integer;
               coef:array[0..100] of integer;
             end;
procedure citire(var P:polinom);
var i:byte;
begin
   if p.grad>0 then
    begin
     for i:=0 to p.grad-1 do
      begin
       write('Coeficientul lui x^: ');
       write(i);
       write(' este : ');
       readln(p.coef[i]);
      end;
    
       repeat
        begin
         write('Coeficientul lui x^: ');
         write(p.grad);
         write(' este : ');
         readln(p.coef[p.grad]);
        end;
       until p.coef[p.grad]<>0
    end
    else
       begin
        write('Dati termenul liber: ');
        readln (p.coef[0]);
       end;
end;
procedure Save_Pol(p1:polinom;var p2:polinom);
var i:integer;
begin
     p2.grad:=p1.grad;
     for i:=0 to p1.grad do
      p2.coef[i]:=p1.coef[i];
end;
Function Val_Pol(p:polinom;x:integer):integer;
var s,i:integer;
begin
     s:=0;
     for i:=p.grad downto 0 do
      s:=x*s+p.coef[i];
     Val_Pol:=s;
end;
procedure Maxim(p1:polinom;var a,max:integer;var macs:polinom);
begin
     if Val_Pol(p1,a)>max then
      begin
       max:=Val_Pol(p1,a);
       Save_Pol(p1,macs);
      end;
end;
procedure Suma(p:polinom;var s:polinom);
var i:integer;
begin
     for i:=0 to p.grad do
      s.coef[i]:=s.coef[i]+p.coef[i];
     if p.grad>s.grad then
       s.grad:=p.grad;
end;
procedure Prelucrare(var max:integer;var s,macs:polinom);
var a,m,i:integer;
    p:polinom;
begin
     write('Dati valoarea a:');
     readln(a);
     for i:=0 to 100 do
       s.coef[i]:=0;
     writeln('dati gradul :');
     readln(p.grad);
     while p.grad>=0 do
         begin
           citire(p);
           Suma(p,s);
           Maxim(p,a,max,macs);
           writeln('Dati gradul :');
           readln(p.grad);
         end;
end;
procedure Afisare_Pol(p:polinom);
var i:byte;
begin
     for i:=p.grad downto 1 do
       begin
         write (p.coef[i]:2);
         write('x^');
         write(i);
         write('+');
       end;
     write(p.coef[0]);
end;
procedure Rezultate(s,macs:polinom;max:integer);
begin
     writeln('Polinomul Suma este');
     Afisare_Pol(s);
     writeln;
     writeln('Polinomul cu valoarea maxima in punctul dat este ');
     Afisare_Pol(macs);
     writeln;
     writeln('Valoare polinomul in punctul date este :');
     writeln(max);
     writeln;

end;
Var s,macs:polinom;max:integer;
begin
   max:=-32768;
   Prelucrare(max,s,macs);
   Rezultate(s,macs,max);
end.