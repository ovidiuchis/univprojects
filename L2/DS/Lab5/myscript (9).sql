declare
 s Sportiv;
 s2 Sportiv;
 s3 Sportiv;
begin

 s:=Sportiv('1234','ion','popescu','inot',30);
s2:=Sportiv('1244','vasile','ionescu','inot',39);
 s3:=Sportiv('1224','gheorghe','pop','inot',320);
delete from JocOlimpic;

insert into JocOlimpic(sporturi,sportivi, localitate, an) values(Sporturi(Sport('inot',null)),Sportivi(s,s2,s3),'Vancouver',2005);

update table(select sporturi from JocOlimpic where an=2005) T
set nume='andrei' where cnp='1234';

update JocOlimpic set sporturi=Sporturi(Sport('inot',Clasament(s,s2,s3))) where an=2005;

delete from table(select sportivi from JocOlimpic where an=2005)T
where cnp=1224;


--insert into sportivii values(s);

--insert into Premii(premiu) values (Papusa('barbie','roz'));

update Premii set sportivX=(select ref(s) from sportivii s where cnp='1234');

end;





