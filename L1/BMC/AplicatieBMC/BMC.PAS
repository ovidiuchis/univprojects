{Autor: Ovidiu Chis
 Grupa 215
}
program AplicatieBmc;
uses crt;
{definim tipul numar cu care vom opera }
type numar=record
                 v:array[0..100] of byte;
                 b,n:byte;
           end;
vector=array[0..100] of longint;
{variabile folosite la nivel global}
var a,b,c:numar;
    cifra,t,baza,baza2:byte;
    ch1,ch2,cif:char;
function corect(a:numar):boolean;
var b:boolean;
    i:word;
begin
     b:=true;
     for i:=0 to a.n do
         if a.v[i]>=a.b then
          b:=false;
     corect:=b;
end;
procedure afisare(a:numar);{afisarea unei valori de tip numar}
var i:byte;
begin
     for i:=a.n downto 0 do
         if a.v[i]<=9 then write(a.v[i])
            else write(chr(ord(a.v[i])+55));
end;

procedure creare(var a:numar; b:byte);{crearea unei valori de tip numar}
var s:string;
    i:integer;
    k:boolean;
begin
     k:=false;
     while not k do
       begin
        a.b:=b;
        readln(s);
        a.n:=length(s)-1;
        for i:=a.n downto 0 do
        if s[i+1]<='9' then
          a.v[a.n-i]:=ord(s[i+1])-48
         else
          a.v[a.n-i]:=ord(UPCASE(s[i+1]))-55;
        k:=corect(a);
        if not k then
        write('Incorect. Reintroduceti ');
       end;
end;
function putere(x,n:longint):longint;
var i,nr:longint;
begin
     if n=0 then nr:=1 else
        begin
         nr:=1;
         for i:=1 to n do
          nr:=nr*x;
        end;
     putere:=nr;
end;
procedure To_Nr(val:longint; var a:numar);{creare unei valori de tip numar dintro valoarea predefinita long it}
var i:integer;
begin
     if val=0 then
      begin
       a.b:=10;
        i:=0;
         a.v[0]:=0;
      end
      else
       begin
        a.b:=10;
        i:=-1;
        while val>0 do
         begin
          inc(i);
          a.v[i]:=val mod 10;
          val:=val div 10;
         end;
       end;
     a.n:=i;
end;
procedure to_vectorbase(var v:vector; var n:byte; a:numar);
var i:integer;
begin
     n:=a.n;
     for i:=0 to a.n do
         v[i]:=a.v[i]*putere(a.b,i);
end;
procedure adunare(a,b:numar; var c:numar);{a+b=c }
var t,i:word;
    a1,b1:numar;
begin
     a1:=a;
     b1:=b;
     if a1.n>b1.n then
      begin
       for i:=b1.n+1 to a1.n do
        b1.v[i]:=0;
       b1.n:=a1.n;
      end
      else
       if a1.n<b1.n then
        begin
         for i:=a1.n+1 to b1.n do
          a1.v[i]:=0;
         a1.n:=b1.n;
        end;
     t:=0;
     for i:=0 to a1.n do
      begin
         if a1.v[i]+b1.v[i]+t<a1.b then
          begin
           c.v[i]:=a1.v[i]+b1.v[i]+t;
           t:=0;
          end
          else
           begin
            c.v[i]:=(a1.v[i]+b1.v[i]+t)mod a1.b;
            t:=(a1.v[i]+b1.v[i]+t)div a1.b;
           end;
      end;
     if t>0 then
      begin
       inc(i);
       c.v[i]:=t;
      end;
     c.n:=i;
     c.b:=a1.b;
end;
procedure scadere(a,b:numar; var c:numar);{a-b=c}
var t,i:word;
    a1,b1:numar;
begin
     a1:=a;
     b1:=b;
     if a1.n>b1.n then
      begin
       for i:=b1.n+1 to a1.n do
        b1.v[i]:=0;
       b1.n:=a1.n;
      end;
     t:=0;
     for i:=0 to a1.n do
      if a1.v[i]>=b1.v[i]+t then
       begin
        c.v[i]:=a1.v[i]-b1.v[i]-t;
        t:=0;
       end
        else
         begin
          c.v[i]:=a1.b+a1.v[i]-b1.v[i]-t;
          t:=1;
         end;
     c.n:=a1.n;
     c.b:=a1.b;
     if c.n<>0 then
        while (c.v[c.n]=0)and(c.n<>0) do
         dec(c.n);
end;
procedure inversare(var a:numar);
var b:numar;
    i:integer;
begin
     b.b:=a.b;
     b.n:=a.n;
     for i:=b.n downto 0 do
         b.v[b.n-i]:=a.v[i];
     a:=b;
end;
procedure inmultire(a:numar; cifra:byte; var c:numar);{a*cifra=c}
var t,i:word;
    a1:numar;
begin
     if cifra=0 then
      begin
       c.n:=0;
       c.b:=a.b;
       c.v[0]:=0;
      end
       else
        begin
         a1:=a;
         t:=0;
         for i:=0 to a1.n do
          begin
           if a1.v[i]*cifra+t<a1.b then
            begin
             c.v[i]:=a1.v[i]*cifra+t;
             t:=0;
            end
             else
              begin
               c.v[i]:=(a1.v[i]*cifra+t)mod a1.b;
               t:=(a1.v[i]*cifra+t)div a1.b;
              end;
          end;
      if t>0 then
       begin
        inc(i);
        c.v[i]:=t;
       end;
      c.n:=i;
      c.b:=a1.b;
     end;
end;

procedure impartire(a:numar; cifra:byte; var c:numar; var t:byte);{a=cifra*c+t}
var a1:numar;
    i:byte;
begin
     a1:=a;
     c.b:=a1.b;
     c.n:=a1.n;
     inversare(a1);
     t:=0;
     for i:=0 to a1.n do
      begin
       c.v[i]:=(a1.v[i]+t*a1.b)div cifra;
       t:=(a1.v[i]+t*a1.b)mod cifra;
     end;
     inversare(c);
     if c.n<>0 then
        while (c.v[c.n]=0)and (c.n<>0) do
         dec(c.n);
end;

function zero(a:numar):boolean;{a=0?}
var b:boolean;
begin
     if (a.n=0)and(a.v[0]=0)then
      b:=true
       else
       b:=false;
     zero:=b;
end;
procedure from_baza_10(var a:numar; b:byte);{din baza 10 intro baza b}
var c,rez:numar;
    i:integer;
    t:byte;
begin
     i:=-1;
     repeat
           impartire(a,b,c,t);
           a:=c;
           inc(i);
           rez.v[i]:=t;
     until ((a.n=0)and(a.v[a.n]=0));
     rez.n:=i;
     rez.b:=b;
     a:=rez;
end;
procedure to_baza_10(var a:numar;b:byte);{dintro baza b in baza 10}
var c:numar;
    i:integer;
    m:longint;
begin
    c:=a;
    m:=0;
    for i:=c.n downto 0 do
        m:=m+c.v[i]*putere(c.b,i);
    to_nr(m,a);
end;
procedure conv_imp_succ(var a:numar; q:byte);{conversie impartiri succesive la o cifra}
var c,cat:numar;
    rest:byte;
    i:integer;
begin
     c.b:=q;
     i:=0;
     while zero(a)=false do
      begin
       impartire(a,q,cat,rest);
       c.v[i]:=rest;
       inc(i);
       a:=cat;
      end;
     c.n:=i-1;
     a:=c;
end;

procedure conv_subst(var a:numar; q:byte);{conversie subtituie}
var c,rez:numar;
    v:vector;
    n,i,p,k:byte;
begin
     to_vectorbase(v,n,a);
     rez.b:=q;
     rez.n:=0;
     rez.v[0]:=0;
     for i:=n downto 0 do
      begin
       To_Nr(v[i],c);
       from_baza_10(c,q);
       adunare(rez,c,a);
       rez:=a;
      end;
end;

{proceduri pentru prelucrarea fiecarei operatii(pregatirea numerelor,apelul propriu zis)}
procedure prel_adunare;
begin
        clrscr;
        writeln('Adunare');
        writeln;
        writeln('Introduceti: ');
        writeln;
        write('Baza primului numar: ');
        readln(baza);
        write('Numarul: ');
        creare(a,baza);
        write('Baza celui de-al doilea numar: ');
        readln(baza);
        write('Numarul: ');
        creare(b,baza);
        write('Baza destinatie: ');
        readln(baza);
        if a.b>baza then
         conv_imp_succ(a,baza)
          else
           if a.b<baza then
            conv_subst(a,baza);
        if b.b>baza then
          conv_imp_succ(b,baza)
         else
          if b.b<baza then
           conv_subst(b,baza);
        writeln;
        adunare(a,b,c);
        write('Rezultatul: ');
        textcolor(10);
        afisare(c);
        textcolor(4);
        readkey;
end;
procedure prel_scadere;
begin
       clrscr;
       writeln('Scadere');
       writeln;
       writeln('Introduceti: ');
       writeln;
       write('Baza primului numar: ');
       readln(baza);
       write('Numarul: ');
       creare(a,baza);
       write('Baza celui de-al doilea numar: ');
       readln(baza);
       write('Numarul: ');
       creare(b,baza);
       write('Baza destinatie: ');
       readln(baza);
       if a.b>baza then
        conv_imp_succ(a,baza)
         else
          if a.b<baza then
           conv_subst(a,baza);
       if b.b>baza then
        conv_imp_succ(b,baza)
         else
          if b.b<baza then
           conv_subst(b,baza);
       writeln;
       scadere(a,b,c);
       write('Rezultatul: ');
       textcolor(10);
       afisare(c);
       textcolor(4);
       readkey;
end;

procedure prel_inmultire;
begin
       clrscr;
       writeln('Inmultire (la o cifra)');
       writeln;
       writeln('Introduceti: ');
       writeln;
       write('Baza numarului: ');
       readln(baza);
       write('Numarul: ');
       creare(a,baza);
       cifra:=baza;
       while cifra >=baza do
        begin
         write('Cifra: ');
         readln(cif);
         if ord(cif)<=ord('9') then
           cifra:=ord(cif)-48
          else
           cifra:=ord(UPCASE(cif))-55;
        end;
       inmultire(a,cifra,c);
       writeln;
       write('Rezultatul: ');
       textcolor(10);
       afisare(c);
       textcolor(4);
       readkey;
end;

procedure prel_impartire;
begin
       clrscr;
       writeln('Impartire (la o cifra) ');
       writeln;
       writeln('Introduceti: ');
       writeln;
       write('Baza: ');
       readln(baza);
       write('Numarul: ');
       creare(a,baza);
       cifra:=baza;
       while (cifra >=baza)or(cifra=0) do
        begin
         write('Cifra: ');
         readln(cif);
         if ord(cif)<=ord('9') then
           cifra:=ord(cif)-48
          else
           cifra:=ord(UPCASE(cif))-55;
        end;
       impartire(a,cifra,c,t);
       writeln;
       write('Rezultatul: ');
       textcolor(10);
       afisare(c);
       write(' rest ');
       if t<=9 then
         write(t)
        else
         write(chr(ord(t)+55));
       textcolor(4);
       readkey;
end;
procedure prel_conversii;
begin
repeat
      clrscr;
      highvideo;
      writeln('Conversii ');
      writeln;
      writeln('Selectati: ');
      writeln;
      writeln('1.Conversie prin impartiri repetate');
      writeln('2.Conversie prin substitutie');
      writeln('3.Conversie printr-o baza intermediara <10>');
      writeln('Esc pentru inapoi');
      ch2:=readkey;
      case ord(ch2) of
           49:begin
                   clrscr;
                   writeln('Conversie prin impartiri repetate');
                   writeln;
                   writeln('Introduceti: ');
                   writeln;
                   write('Baza sursa: ');
                   readln(baza);
                   write('Numarul: ');
                   creare(a,baza);
                   write('Baza destinatie: ');
                   readln(baza);
                   conv_imp_succ(a,baza);
                   writeln;
                   write('Numarul: ');
                   textcolor(10);
                   afisare(a);
                   textcolor(4);
                   readkey;
           end;
           50:begin
                   clrscr;
                   writeln('Conversie prin substitutie');
                   writeln;
                   writeln('Introduceti: ');
                   writeln;
                   write('Baza sursa: ');
                   readln(baza);
                   write('Numarul: ');
                   creare(a,baza);
                   write('Baza destinatie: ');
                   readln(baza);
                   conv_subst(a,baza);
                   writeln;
                   write('Numarul: ');
                   textcolor(10);
                   afisare(a);
                   textcolor(4);
                   readkey;
           end;
           51:begin
                   clrscr;
                   writeln('3.Conversie printr-o baza intermediara <10>');
                   writeln;
                   writeln('Introduceti: ');
                   writeln;
                   write('Baza sursa: ');
                   readln(baza);
                   write('Numarul: ');
                   creare(a,baza);
                   write('Baza destinatie: ');
                   readln(baza2);
                   to_baza_10(a,baza);
                   from_baza_10(a,baza2);
                   writeln;
                   write('Numarul: ');
                   textcolor(10);
                   afisare(a);
                   textcolor(4);
                   readkey;
           end;
      end;
until (ord(ch2)=27);
end;
{Modulul Principal}
begin
     textcolor(4);
     highvideo;
     clrscr;
     writeln('aici');
     writeln('Meniul');
     repeat
      clrscr;
      textcolor(10);
      writeln('Autor:Ovidiu Chis');
      textcolor(4);
      highvideo;
      writeln('Selectati: ');
      writeln;
      writeln('1. Adunare ');
      writeln('2. Scadere ');
      writeln('3. Inmultire cu o cifra ');
      writeln('4. Impartire la o cifra ');
      writeln('5. Conversii ');
      writeln('   Esc pentru exit');
      ch1:=readkey;
       case ord(ch1) of
        49:prel_adunare;
        50:prel_scadere;
        51:prel_inmultire;
        52:prel_impartire;
        53:prel_conversii;
       end;
    until (ord(ch1)=27);
end.