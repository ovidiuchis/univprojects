/** Daca nu mergem pe tot indexul va face hash  prima data */

select 
	d.subunitate, d.numar, d.data, d.tip, SUM(pd.pret_valuta) p
from doc d
LEFT join pozdoc pd ON pd.numar=d.numar and d.tip=pd.tip and d.subunitate=pd.subunitate AND d.data=pd.data

GROUP BY d.subunitate, d.numar, d.data, d.tip

/** Vs Cross apply **/
