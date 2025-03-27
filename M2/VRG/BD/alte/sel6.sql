

select *
from pozdoc pd 
JOIN terti t on t.tert=pd.tert and t.Subunitate='1' and pd.Subunitate='1'
JOIN facturi f ON f.Factura=pd.Factura and pd.Tip='RM' and f.tert=pd.tert
--LEFT JOIN pozplin p on p.Factura=f.Factura and p.Tert=t.tert
and not EXISTS (select 1 from pozplin where Factura=pd.factura AND Tert=pd.tert)