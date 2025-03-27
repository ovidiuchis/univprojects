alter procedure creare_tabele
AS
 BEGIN
  
   if object_id ('Rezervari','U') is not null drop table Rezervari
   if object_id ('SetCitire','U') is not null drop table SetCitire
   if object_id ('SetScriere','U') is not null drop table SetScriere
   if object_id ('Tranzactii','U') is not null drop table Tranzactii

   
   create table Rezervari(
   id int,
   cursa varchar(20),
   nr_locuri int,
   nr_locuri_libere int
   )
  insert into Rezervari values (1,'Cluj',100,100)

  Create table SetCitire(
 id_tranzactie int,
 id_resursa int,
 cursa varchar(50),
 nr_locuri int,
 nr_locuri_libere int
  
 )

  Create table SetScriere(
  id_tranzactie int,
  id_resursa int,
  cursa varchar(50),
  nr_locuri int,
  nr_locuri_libere int
  
 )

  Create table Tranzactii(
   id int,
   ts datetime,
   faza char(1)
  )

END