create table JocOlimpic
(
  sporturi Sporturi,
  sportivi Sportivi,
  an int,
  localitate varchar2(10)
)
nested table sportivi store as tab_sportivi;



