select 1 as tag,
	 null as parent, 
	idp as [produs!1!idp],
	denumireP as [produs!1!denumireP!element],
	descriere as [produs!1!descriere!element]
from Produse
for xml explicit
