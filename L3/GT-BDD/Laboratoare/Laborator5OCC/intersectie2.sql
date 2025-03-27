create function intersectie2(@id_t1 int, @id_t2 int)
returns int
as
begin
	if exists (select * from (select * from SetCitire where id_tranzactie=@id_t1) as R inner join 
								((select * from SetScriere where id_tranzactie=@id_t2) union all 
									(select * from SetCitire where id_tranzactie=@id_t2)) as B
									on R.id_resursa=B.id_resursa)
		return 1
	return 0
end