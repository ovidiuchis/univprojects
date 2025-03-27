create function intersectie1(@id_t1 int, @id_t2 int)
returns int
as
begin
	if exists (select * from (select * from SetCitire where id_tranzactie=@id_t1) as R inner join 
								(select * from SetScriere where id_tranzactie=@id_t2) as W 
									on R.id_resursa=W.id_resursa)
		return 1
	return 0
end