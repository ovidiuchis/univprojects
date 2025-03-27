if OBJECT_ID('tempdb..#terti2010') is not null
	drop table #terti2010

select 
	distinct tert
into #terti2010
from pozdoc where subunitate='1' and tip='AP' and YEAR(data)=2010

delete t2
from #terti2010 t2
JOIN pozdoc pd on pd.Subunitate='1' and pd.tip='AP' and YEAR(pd.Data)=2011 and pd.tert=t2.Tert


select 
	rtrim(t.denumire) Denumire, rtrim(l.oras) Localitatea, rtrim(j.denumire) judetul, rtrim(t.adresa) adresa
from #terti2010 t2
JOIN terti t on t.subunitate='1' and t2.tert=t.tert
LEFT JOIN Judete j on j.cod_judet=t.judet
LEFT JOIN Localitati l on l.cod_judet=j.cod_judet and l.cod_oras=t.localitate