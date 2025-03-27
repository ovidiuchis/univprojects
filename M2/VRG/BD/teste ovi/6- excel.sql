

/** Metoda programatica (scrip)
	
	pct. a-> Presupunem ca am gasit o modalitate de a aduce numele worksheeturilor in acest tabel corelate cu numele fisierelor de care apartin
		(aceasta prespunere costa 1 punct :)   )

	Metoda click-click

	Foarte simplu se pot urma pasii:
	Pe baza de date-> Import data-> sursa de tip Excel-> se alege fisierul-> se alege copy data, iar serverul va determina numele sheeturilor si datele
	transformandu-le in tabele SQL ( de ex. daca urmam pasii pt fisier exemplu (eximport) serverul va creaza tabelul Tbl2$ disponibil pt.
	a fi rulate instructuini pe el,prelucrate datele prin script SAMD 
		
		select * from Tbl2$
**/


declare 
	@sql_final nvarchar(4000), @sql_date nvarchar(4000), @sql_drop nvarchar(4000)
select 
	@sql_final='', @sql_date='', @sql_drop=''

IF OBJECT_ID('tempdb..##sheeturi') is not null
	drop table ##sheeturi

create table ##sheeturi( fisier varchar(100), nume varchar(200))

	insert into ##sheeturi (fisier, nume)
	select 'exempluimport1.xlsx' ,'Ceva' 
	union 
	select 'exempluimport1.xlsx','Altceva' 
	union 
	select 'exempluimport.xlsx', 'Tbl1'  
	union 
	select 'exempluimport.xlsx', 'Tbl2' 


alter table ##sheeturi add comanda nvarchar(4000), tabel varchar(100)

update s set 
	s.comanda='select * into ##'+nume+'_ovic from opendatasource(''Microsoft.ACE.OLEDB.12.0'',
		''Data Source='+'d:\excel\'+fisier+';Extended Properties=Excel 12.0'')...['+nume+'$] ex',
	s.tabel='##'+nume+'_ovic',
	@sql_drop=@sql_drop+' IF OBJECT_ID(''tempdb..'+'##'+nume+'_ovic'+''') is not null drop table '+'##'+nume+'_ovic'
from ##sheeturi s

select 
	@sql_final=@sql_final+ comanda +char(13)
from ##sheeturi

exec sp_executesql  @statement=@sql_drop
exec sp_executesql  @statement=@sql_final

select 
	@sql_date=@sql_date+' select * from '+tabel
from ##sheeturi

exec sp_executesql  @statement=@sql_date

/** Coloanele noilor tabele se pot afla usor-> daca vrem sa nu "afisam" cu SELECT * datele putem sa construim un 
	select dinamic folosind coloanele obtinute astfel in dreptul fiecarui tabel **/

/**
	select 
		s.tabel, sc.name coloana
	from tempdb..sysobjects so
	JOIN ##sheeturi s on so.name=s.tabel
	JOIN tempdb..syscolumns sc on sc.id=so.id

*/