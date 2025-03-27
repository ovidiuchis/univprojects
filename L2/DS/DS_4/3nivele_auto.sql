select denumireC,
	(select denumireP as DenumireProdus, pret as PretProdus, stoc as StocProdus from Produse where codc=Categorii.cod for xml auto,type ) as Produse
from  Categorii for xml auto