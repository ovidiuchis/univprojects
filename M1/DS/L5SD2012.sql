/* 1 */
select j.cod as CodJudet, j.denumire as denJudet, count(l.* ) numarLocalitati
from judete j
inner join localitati l on j.cod=l.judet
group by j.cod, j.denumire

/* 2 
Mentiune: la momentul descrierii acestui laborator nu merge conexiunea la server din exterior deci am facut anumite presupuneri legate de date:
	de ex: localitate mare este cea cu coduri postale asociate la strazi, deci in campul cod postal din tabelul localitgati este null
*/
select l.denumire, strazi.count
from localitati l where l.codpostal is null

/* 3 */
/* denumireL, codJudetL */

select s.denumire as DenumireStrada 
from 
	(
		select strazi
		from Localitati l where l.judet=codJudetL and l.denumire=denumireL
	) s
	
/* 4 */

select 
	j.cod as CodJudet, j.denumire as denJudet, count(l.* ) numarLocalitati , count(lm.*) numarLocalitatiMari,
	(select sum(strazi.count) from localitati where judet=j.cod and codpostal is null ) numarTotalStraziLocalitatiMari
from judete j
inner join localitati l on j.cod=l.judet
inner join localitat lm on j.cod=lm.cod and lm.codpostal is null
group by j.cod, j.denumire

