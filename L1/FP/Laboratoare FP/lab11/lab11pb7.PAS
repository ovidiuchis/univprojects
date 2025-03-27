program lab11pb7;
type
    sir= array[1..21] of integer;

Function valida(s:sir;n :integer):boolean;
var 
    i :integer;
    valid:boolean;
    npd,npi:integer;
begin
    npd:= 0;
    npi :=0;
    valid:= true;
    for i:=1 to n do
    begin
        if (s[i] = 0) then
            inc(npd)
        else
            inc(npi);
        if (npd<npi) then
            valid := false;
    end;
    if (npd<>npi) then
        valid := false;
    valida:=valid;
end;
procedure afis(s:sir;n:integer);
var i:integer;
begin
    if valida(s,n) then
    begin
    for i:= 1 to n do
    begin
        if (s[i] = 0) then
            write('(')
        else
            write(')');
    end;
    writeln;
    end;
end;

procedure Backtracking(k:integer; n:integer; VAR s:sir);
var
    i:integer;
begin
    for i:=0 to 1 do
    begin
        s[k]:= i;
        if (k = n) then afis(s,n)
        else
        Backtracking(k+1,n,s);
    end;
end;

var
    s:sir;
    n:integer;
begin
    write('Dati n : ');
    read(n);
    writeln;
    Backtracking(1,n,s);
end.
