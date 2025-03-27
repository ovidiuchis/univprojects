alter function opConflict(@id1 int,@id2 int)
returns table
as
	return (select R.id_tranzactie from (select * from SetCitire where id_tranzactie=@id1) as R inner join 
						(select * from SetScriere where id_tranzactie=@id2) as W on R.id_resursa=W.id_resursa)
			union all
			(select R.id_tranzactie from (select * from SetCitire where id_tranzactie=@id1) as R inner join 
						(select * from SetScriere where id_tranzactie=@id2) as W on R.id_resursa=W.id_resursa)
