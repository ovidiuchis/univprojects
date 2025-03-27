create table Sectii (cods number primary key , nume nvarchar2(20) unique);
create table Grupe(codg number primary key, cods number Constraint nume7 references Sectii(cods) on delete set null  );


create table Studenti (nrm number not null, codg number, nume nvarchar2(50), constraint nenul check(nrm >0))



