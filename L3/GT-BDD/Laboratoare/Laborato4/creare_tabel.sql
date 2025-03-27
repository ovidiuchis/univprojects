create procedure create_rezervari
as
begin
  if exists (select name from sys.sysobjects where xtype='U' and name='Rezervari')
     drop table Rezervari
 
 create table Rezervari(
  cursa varchar(30) primary key,
  nr_locuri int,
  nr_locuri_libere int
  )

insert into Rezervari
select 'Cluj Napoca',100,80
union all
select 'Sibiu',50,40
union all
select  'Timisioara',80,30
union all
select 'Bucuresti', 150, 50
union all
select 'Iasi',60,50
union all
select 'Constanta',90,10
union all
select 'Craiova',30,25
union all
select 'Brasov',20,5

end