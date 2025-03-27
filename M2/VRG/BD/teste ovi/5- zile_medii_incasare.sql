IF EXISTS (
		SELECT *
		FROM sysobjects
		WHERE NAME = 'wZileMediiIncasare_ovic'
		)
	DROP PROCEDURE wZileMediiIncasare_ovic
GO

create procedure wZileMediiIncasare_ovic @tert varchar(20), @dataJos datetime, @dataSus datetime
as
begin try
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

	/** 
		Exemple rulare

				 exec wZileMediiIncasare_ovic '17742241     ','01/01/2011', '01/01/2012'
				 exec wZileMediiIncasare_ovic '1     ','01/01/2011', '01/01/2012'
	**/

	declare @mesaj varchar(max)

	if @tert is null or @dataJos is null or @dataSus is null
		raiserror('Parametri:) ' , 11,1 )

	if OBJECT_ID('#tempdb..#facturiFiltr') is not null
		drop table #facturiFiltr


	select 
		f.factura, min(f.data) data_facturii, sum(f.valoare+f.tva) valoare
	into #facturiFiltr
	from dbo.fTert('B', @dataJos,@dataSus, @tert, null, null, NULL, NULL, NULL, NULL) f  
	where f.tip in ('AP','AS') and f.valoare>0.0 
	group  by f.factura
	having min(data) between @dataJos and @dataSus

	if OBJECT_ID('tempdb..#incasariFacturi') is not null
		drop table #incasariFacturi

	select 
		f.tert, f.factura, ff.data_facturii data_fact,ff.valoare valoare, f.data_platii data_inc, f.achitat incasat
	into #incasariFacturi
	from dbo.fTert('B', @dataJos, @dataSus, @tert, NULL, NULL, NULL, NULL, NULL, NULL) f
	JOIN #facturiFiltr ff on ff.factura=f.factura
	where f.tip='IB'
	
	if OBJECT_ID('tempdb..#zileIncasariFacturi') is not null
		drop table #zileIncasariFacturi

	select *, DATEDIFF(DAY, data_fact, data_inc) zileInc 
	into #zileIncasariFacturi
	from #incasariFacturi
	order by tert, factura

	if OBJECT_ID('tempdb..#zileMedFactura') is not null
		drop table #zileMedFactura

	/** Zile medii pe factura prima data- incasari multiple **/
	select 
		tert, factura, avg(zileInc) zileMed 
	into #zileMedFactura
	from #zileIncasariFacturi
	group by tert, factura
	
	select zm.Factura,ff.valoare Valoare,  zm.zileMed ZileIncasare
	from #zileMedFactura zm
	JOIN #facturiFiltr ff on ff.factura=zm.factura

	select 
		AVG(zileMed) DurataMediaIncasareTert
	from #zileMedFactura


end try
begin catch
	set @mesaj=ERROR_MESSAGE() + ' (wZileMediiIncasare_ovic)'
	raiserror(@mesaj, 11,1 )
end catch