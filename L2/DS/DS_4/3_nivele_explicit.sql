select 1 as tag,
	 null as parent, 
	prod.idp as [produs!1!idp],
	prod.denumireP as [produs!1!denumireP!element],
	prod.descriere as [produs!1!descriere!element],
	null as [caracteristica!2!greutate!element],
	null as [caracteristica!2!valoare!element]
from Produse as prod

union all

select 2 as tag,
	1 as parent,
	caract.idp,
	null,
	null,
	caract.caracteristica,
	caract.valoare
from caracteristici	as caract
order by [produs!1!idp]
for xml explicit

