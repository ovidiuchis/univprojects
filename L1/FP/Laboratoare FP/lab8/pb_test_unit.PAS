uses MATRICER;
var A:matrara;n,m:integer;{A:matrice;i,j:byte; }
begin
      writeln;writeln;
      creare_matr(A);
      {creare_matr(B);}
      writeln('S-a citit matricea A : ');
      afisare_matr(A);
      {writeln('S-a citit matricea B : ');
      afisare_matr(B);
      writeln;writeln;

      el_max(A,l,c,x);
      writeln('maximul A ');
      write('linia: ');writeln(l);
      write('coloana: ');writeln(c);
      write('valoarea: ');writeln(x);

      el_min(A,l,c,x);
      writeln('minimul A ');
      write('linia: ');writeln(l);
      write('coloana: ');writeln(c);
      write('valoarea: ');writeln(x);

      prod_matr_scalar(A,x);
      writeln('Matricea A inmultita cu minimul: ');writeln(x);
      afisare_matr(A);
      writeln;writeln;

      scadere_matr(A,B,D);
      writeln('A-B: ');
      afisare_matr(D);
      adunare_matr(A,B,D);
      writeln('A+B: ');
      afisare_matr(D);
      read(n,m);
      for i:=1 to n do
       for j:=1 to m do
        read(A[i,j]);
      to_matrara(A,n,m,B);
      afisare_matr(B);  }
      introducere_val(A);
      afisare_matr(A);

end.