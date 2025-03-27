alter table sectii add constraint numec check(cods>0);

alter table Studenti drop constraint nenul;
alter table Sectii add facultate nvarchar2(40);
alter table studenti add bursa number;

alter table Sectii drop column facultate;



