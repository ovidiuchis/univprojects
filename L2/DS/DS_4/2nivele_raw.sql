select denumireP,pret,descriere,garantie,
	(select caracteristica, valoare from caracteristici where idp=p.idp for xml raw,type )
from produse p for xml raw 

