program lab1pb11;{problema 11 din laboratorul 9}
Uses Cmplx;
type sir=array[1..100] of real;

procedure Secv(v:sir; n,i:integer; var l:integer);
var ok:boolean;z:complex;
begin
    l:=0;
    ok:=true;
    while (i<n) and (l<n/2) and ok do
       begin
        SetReal(z,v[i]);
        SetImag(z,v[i+1]);
        if Modul(z)<1 then
          begin
           inc(l);
           i:=i+2;
          end
         else
          ok:=false;
       end;
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
         i:=i+(2*l)
       else i:=i+2;
    end;
end;
procedure to_sir(var s:sir;var n:integer;z:complex);
begin
     inc(n);
     s[n]:=GetReal(z);
     inc(n);
     s[n]:=GetImag(z);
end;
procedure prelucrare(var cin,cout,outfin:string);
var f,g,h:text;z1,z2,z3:complex;a,b:real;n,st,lmax,i:integer;s:sir;
begin
     n:=0;
     assign(f,'cin.txt');
     reset(f);
     assign(g,'cout.txt');
     rewrite(g);
     assign(h,'outfin.txt');
     rewrite(h);
     while not eof(f) do
       begin
        read(f,a,b);
        SetReal(z1,a);SetImag(z1,b);
        if not Zero(z1) then
          begin
           write(h,GetReal(z1):3:2,'+i',GetImag(z1):3:2,' , ');
           to_sir(s,n,z1);
          end;
        while (a<>0) and (b<>0) do
         begin
          write(g,a:3:2,'+i',b:3:2,' , ');
          read(f,a,b);
          SetReal(z2,a);SetImag(z2,b);
          if not Zero(z2) then
            begin
             write(h,GetReal(z2):3:2,'+i',GetImag(z2):3:2,' , ');
             to_sir(s,n,z2);
            end;
          Adunare(z1,z2,z3);
          SetReal(z1,GetReal(z3));
          SetImag(z1,GetImag(z3));
         end;
        DetSecvC(s,n,st,lmax);
        writeln(g);
        writeln(g,'Cea mai lunga secventa cautata: ');
        for i:=st to st+(2*lmax)-1 do
         begin
          write(g,s[i]:3:2,'+i',s[i+1]:3:2,' , ');
          inc(i);
         end;
        n:=0;
        writeln(g);
        writeln(g,'  suma sirului: ',GetReal(z3):3:2,'+i',GetImag(z3):3:2);
        writeln(g);
       end;
     close(f);
     close(g);
     close(h);
end;
var int,out,outfin:string;
    s:sir;n:integer;
begin
     {Fiecare sir citit , suma elementelor sale si cea mai lunga secventa
      cu proprietatea ceruta se afla in fisierul: cout.txt, iar toate
      numerele complexe citite se afla in fisierul outfin.txt}
     prelucrare(int,out,outfin);
end.