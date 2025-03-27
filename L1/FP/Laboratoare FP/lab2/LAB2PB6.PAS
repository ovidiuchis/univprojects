program lab2pb6;
type sir=array[1..20] of integer;
Procedure citire(var n:integer;var X:sir);
var i:byte;
begin
     readln(n);
     for i:=1 to n do
      read(X[i]);
end;
procedure detsecv(var n,s,d:integer; var X:sir);
var i,j,ind,l:integer;dist:boolean;
begin
    ind:=1;
    l:=0;
    s:=0;
    d:=0;
    i:=2;
    while i<=n do
        begin
            if X[i-1]=X[i] then
                begin
                    ind:=i;
                    i:=i+1;
                end
            else
                begin
                    j:=i-2;
                    dist:=true;
                    l:=l+1;
                    while (j >= 1) and dist do
                        begin
                            if X[i]=X[j] then
                                begin
                                    dist:=false;
                                    ind:=j+1;
                                    l:=l-1;
                                    end
                            else j:=j-1;
                        end;
                end;

            if l >d then
                begin
                    s:=ind;
                    d:=l;
                end;
            i:=i+1;
        end;
end;
procedure afisare(var n,s,d:integer; var X:sir);
var i,j:integer;
begin

     i:=s;
     j:=1;
     while j <= d+1 do
      begin
       write(X[i]);
       write(' ');
       i:=i+1;
       j:=j+1;
      end;


end;
var n,s,d:integer;X:sir;
begin

    citire(n,X);
    detsecv(n,s,d, X);
    afisare(n,s,d,X);
    
end.