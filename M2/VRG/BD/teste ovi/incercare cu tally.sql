-- Mentiune: view-ul pt random se foloseste pt ca nu am voie in functie sa apelez RAND()..... Dupa creare se poate comenta corpul de mai sus:)
declare 
	@text varchar(max), @text_modificat varchar(max)

select 
	@text_modificat=''

--Exemplu 1
set @text='Dcaa ptoi sa ctiseti atsa, ai o mtine cuiadta si tu. Cahir ptoi sa ctiseti atsa? Daor ctavia omanei pot. Nu mi-a vinet sa cerd ca am ptuut sa itelneg ce ctieam. Pnetru fnemoeanla mitne a oulmui, ptorivit uuni sutdiu al Utvinersitaii Cmabridge nu cnoateza in ce odrnie snut sricse ltilelre itnr-un cavunt. Snigurul lcuru ipomtrant etse ca pirma si utilma lietra din c\unat sa fie la lcoul lor. Rsteul paote sa fie o dzeroidne ttoala si ptoi sa ctiseti fraa porlbmee. Atsa pnertu ca ninitea oumlui nu cistete feiacre letira in prate, ci cvuatnul ca itnerg. Icrendibil, nu Si eu crae mreeu am cerzut ca otrograifa etse aatt de ipmotranta'

--Exemplu 2
set @text='Exemplul al doilea pentru problema patrul am fcaut dpua ce am rlveazot poblmaer. Nu aveam cum sa il fac iniatne dseugir. '


select
	it. id, substring(item,t.n,1)
from  #cuvinte it
JOIN tally t on t.N<=len(it.item)

alter table #cuvinte add litere varchar(max)

update c
	set litere=SUBSTRING(item, 2, len(item)-2)
from #cuvinte c


select * from #cuvinte

select 
	c.id, c.item, SUBSTRING(c.item, 1,1),SUBSTRING(c.item, len(c.item),1) ,cc.lit
from #cuvinte c
OUTER APPLY 
	(
		select 
			SUBSTRING(c.litere,t.n,1)lit
		from tally t where t.N<=len(c.litere)
	) cc
where c.id=1