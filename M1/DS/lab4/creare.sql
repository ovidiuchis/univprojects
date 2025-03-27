--drop table formatii;
drop table sectii1;
drop table studenti1;

create table sectii1 (
  cod integer , 
  denumire varchar(30), 
  grupe colgrupa
) nested table grupe store as TabGrupe;



Create table studenti1(
  sectia integer ,
  nrmatricol Char (10),
  nume Char (30),
  prenume Char (30),
  cnp Char (13),
  rez colrez
 )nested table rez store as TabRez;

insert into sectii1 values (1,'info', colgrupa(grupa(3,2011,1),grupa(1,2011,2)));

insert into studenti1 values (1,'123','ion','ion','1234',colrez(rezult(2011,1,10,6),rezult(2011,2,9,6)));

update sectii1 set grupe=colgrupa() where cod=1;
insert into the(select grupe from sectii1 where cod=1)
       values(1,2011,2);



