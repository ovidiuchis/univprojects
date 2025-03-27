if OBJECT_ID('tempdb..#top_clienti') is not null
	drop table #top_clienti

if OBJECT_ID('tempdb..#clienti_exp') is not null
	drop table #clienti_exp

select tert 
into #clienti_exp
from terti where subunitate='1' and denumire like 'casa%'


select 
	tert, cod, sum(cantitate*pret_vanzare) valoare
into #top_clienti
from pozdoc 
where subunitate='1' and tip='AP'  and tert not in (select tert from #clienti_exp)
group by tert,cod

delete tc
from #top_clienti tc 
join 
	(
		select tert tert, count(1) nrprod
		from #top_clienti
		group by tert
		having count(1)<10
	) tc_cen on tc.tert=tc_cen.tert

alter table #top_clienti add ordineT int, valtert float, nrp int

update tc set tc.ordineT=c.ot, tc.valtert=c.val, tc.nrp=c.nrp
from #top_clienti tc
JOIN
	(
		select 
			tert, sum(valoare) val,count(1) nrp,  rank() OVER (order by sum(valoare) desc, tert)  ot
		from #top_clienti
		group by tert
	) c on c.Tert=tc.Tert

select * 
from 
	(
		select 
			tc.ordineT OrdineT, rtrim(t.denumire) DenumireT, tc.nrp, tc.valtert Valtert, rank() over (partition by tc.tert order by tc.valoare desc, tc.cod) ordineP,
			rtrim(n.denumire) as denumire, tc.valoare valprodus
		from #top_clienti tc
		JOIN terti t on tc.tert=t.tert and t.subunitate='1'
		JOIN nomencl n on n.cod=tc.cod
	) f where f.OrdineT<=20 and f.ordinep<=10
order by f.OrdineT, f.ordineP