declare @par xml
set @par=(select xml from xmlTable)
-- insert o filiala
set @par.modify('insert <filiala > <denumire> Ceva </denumire> </filiala> as first into (/librarie/filiale)[1]')
select @par
--insert la filiala introdusa cod
set @par.modify ('insert  <codf> 0 </codf> into (/librarie/filiale/filiala)[1]')
select @par
-- delete atributul gen al cartilor
set @par.modify('delete /librarie/carti/carte/@gen')
select @par
--delete a doua filiala
set @par.modify('delete /librarie/filiale/filiala[2]')
select @par
--replace denumirea primei carti
set @par.modify('replace value of (/librarie/carti/carte/titlu/text())[1] with "Titlu schimbat"' )
select @par
--replace pretul primei carti astfel: daca este mai mare decat 3 la 2, altfel l 1
set @par.modify('replace value of (/librarie/carti/carte/pret/text())[1] with ( if ((/librarie/carti/carte/pret/text()) > 3 ) then "2" else "1") ')
select @par