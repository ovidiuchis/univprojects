--drop type Persoana;
create or replace type Persoana as object
(
  cnp varchar2(13),
  nume varchar2(10),
  prenume varchar2(10)
)not final;
/


