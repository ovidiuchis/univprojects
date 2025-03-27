--select * from JocOlimpic where localitate='Vancouver';

select count(*) from table(select sporturi from JocOlimpic where an=2005)T;

select s.cclasament from JocOlimpic j, table(j.sporturi) s where s.nume='inot'; 

select deref(sportivX) from Premii p  where p.premiu.denumire='barbie';



