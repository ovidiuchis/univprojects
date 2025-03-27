--show errors;
--drop type colgrupa;
--drop type grupa;

create or replace type grupa as object (
anstudiu integer,
anuniv integer,
grupa integer
);
/
create or replace type colgrupa is table of grupa;
-- multime de grupa
/



