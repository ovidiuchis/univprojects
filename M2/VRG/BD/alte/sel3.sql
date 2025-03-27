
/** Cross Apply*/
select 
	d.subunitate, d.numar, d.data, d.tip, pd.pret p
from doc d
CROSS APPLY 
(
	SELECT SUM(pp.pret_valuta)pret
	from pozdoc pp where pp.subunitate=d.subunitate and pp.tip=d.tip and pp.data=d.data and pp.numar=d.numar
)pd 